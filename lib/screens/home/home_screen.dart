import 'package:drivox/screens/home/widgets/home_app_bar.dart';
import 'package:drivox/screens/home/widgets/start_driving_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

List<Contact> selectedContacts = [];
List<Contact> allContacts = [];
List<Contact> displayedContacts = [];
bool isSearchEmpty = false;

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<void> getContacts() async {
    if (!await FlutterContacts.requestPermission()) {
      return;
    }

    List<Contact>? contacts = await FlutterContacts.getContacts(withProperties: true);
    setState(() {
      allContacts = contacts;
      displayedContacts = List.from(allContacts);
    });
  }

  void addContactToSelection(Contact contact) {
    setState(() {
      if (selectedContacts.isEmpty) {
        selectedContacts = [contact];
      }
    });
  }

  void removeSelectedContact() {
    setState(() {
      selectedContacts.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    getContacts();
  }
  Future<void> loadContacts() async {
    if (await FlutterContacts.requestPermission()) {
      List<Contact> contacts = await FlutterContacts.getContacts(withProperties: true);
      setState(() {
        allContacts = contacts;
        displayedContacts = List.from(allContacts);
      });
    }
  }

  void filterContacts(String query) {
    setState(() {
      isSearchEmpty = false;
      if (query.isNotEmpty) {
        displayedContacts = allContacts.where((contact) {
          return contact.displayName.toLowerCase().contains(query.toLowerCase());
        }).toList();
        isSearchEmpty = displayedContacts.isEmpty;
      } else {
        displayedContacts = List.from(allContacts);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              HomeAppBar(onSearch: filterContacts),
              if (isSearchEmpty)
                const SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(50.0),
                      child: Text(
                        'No contacts found',
                        style: TextStyle(fontSize: 18, color: Colors.red),
                      ),
                    ),
                  ),
                ),
              if (selectedContacts.isNotEmpty)
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Selected Contact',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              if (selectedContacts.isNotEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(child: Text(selectedContacts[0].displayName[0])),
                        title: Text(selectedContacts[0].displayName),
                        subtitle: Text(selectedContacts[0].phones.isNotEmpty ? selectedContacts[0].phones.first.number : 'No number'),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: removeSelectedContact,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              if (displayedContacts.isNotEmpty)
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Your Contacts',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              SliverList.separated(
                itemCount: displayedContacts.length,
                itemBuilder: (context, index) {
                  Contact contact = displayedContacts[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text(contact.displayName[0])),
                    title: Text(contact.displayName),
                    subtitle: Text(contact.phones.isNotEmpty ? contact.phones.first.number : 'No number'),
                    trailing: IconButton(
                      icon: Icon(Icons.add,color: selectedContacts.isEmpty ? Colors.green : Colors.grey),
                      onPressed: selectedContacts.isEmpty ? () => addContactToSelection(contact) : null,
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              ),
            ],
          ),
          const StartDrivingButton()
        ],
      ),
    );
  }
}