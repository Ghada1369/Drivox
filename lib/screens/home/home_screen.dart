import 'package:drivox/core/colors/app_colors.dart';
import 'package:drivox/core/text/app_text.dart';
import 'package:drivox/screens/home/widgets/home_app_bar.dart';
import 'package:drivox/screens/home/widgets/start_driving_button.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

List<Contact> selectedContacts = [];
List<Contact> allContacts = [];
List<Contact> displayedContacts = [];
bool isSearchEmpty = false;
bool hasPermission = true;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    getContacts();
  }

  Future<void> getContacts() async {
    PermissionStatus status = await Permission.contacts.request();

    if (status.isGranted) {
      List<Contact> contacts = await FlutterContacts.getContacts(withProperties: true);
      setState(() {
        allContacts = contacts;
        displayedContacts = List.from(allContacts);
        hasPermission = true;
      });
    } else if (status.isPermanentlyDenied) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(AppText.dialogHeader),
          content: const Text(AppText.dialogTitle),
          actions: [
            TextButton(
              onPressed: () => openAppSettings(),
              child: const Text(AppText.dialogButton),
            ),
          ],
        ),
      );
      setState(() => hasPermission = false);
    } else {
      setState(() => hasPermission = false);
    }
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
              if (!hasPermission)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          AppText.homeError,
                          style: TextStyle(fontSize: 16, color: AppColors.error),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () async {
                            await openAppSettings();
                          },
                          child: const Text(AppText.homeErrorButton),
                        ),
                      ],
                    ),
                  ),
                )
              else ...[
                if (isSearchEmpty)
                  const SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(50.0),
                        child: Text(
                          AppText.noContactsFound,
                          style: TextStyle(fontSize: 18, color: AppColors.error),
                        ),
                      ),
                    ),
                  ),
                if (selectedContacts.isNotEmpty)
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        AppText.selectedContact,
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
                          subtitle: Text(selectedContacts[0].phones.isNotEmpty ? selectedContacts[0].phones.first.number : AppText.noNumber),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove, color: AppColors.error),
                            onPressed: removeSelectedContact,
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
                        AppText.yourContacts,
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
                      subtitle: Text(contact.phones.isNotEmpty ? contact.phones.first.number : AppText.noNumber),
                      trailing: IconButton(
                        icon: Icon(Icons.add, color: selectedContacts.isEmpty ? AppColors.green : AppColors.hintText),
                        onPressed: selectedContacts.isEmpty ? () => addContactToSelection(contact) : null,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                ),
              ],
            ],
          ),
          StartDrivingButton(),
        ],
      ),
    );
  }
}