import 'package:drivox/core/colors/app_colors.dart';
import 'package:drivox/core/text/app_text.dart';
import 'package:drivox/screens/home/widgets/account_settings.dart';
import 'package:drivox/screens/home/widgets/settings_options.dart';
import 'package:drivox/screens/login/login_screen.dart';
import 'package:drivox/screens/password_configuration/reset_password.dart';
import 'package:drivox/widgets/custom_scaffold.dart';
import 'package:drivox/widgets/drivox_logo.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  static String routeName = '/settings';
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  bool isNotificationsEnabled = false;
  String firstName = "Ghada"; //change it according to user name
  String lastName = "Abou-El-Fadl";

  void _toggleNotifications(bool value) {
    setState(() {
      isNotificationsEnabled = value;
    });
  }

  void _showEditNameDialog() {
    TextEditingController firstNameController = TextEditingController(text: firstName);
    TextEditingController lastNameController = TextEditingController(text: lastName);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(AppText.editEmail),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: firstNameController,
                decoration: const InputDecoration(labelText: AppText.firstName),
              ),
              TextField(
                controller: lastNameController,
                decoration: const InputDecoration(labelText: AppText.lastName),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(AppText.cancel),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  firstName = firstNameController.text;
                  lastName = lastNameController.text;
                });
                Navigator.pop(context); // just close the dialog
              },
              child: const Text(AppText.save),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      enableAnimation: false,
      widget: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DrivoxLogo(text: 5),
            AccountSettings(
              title: AppText.username,
              content: "$firstName $lastName",
              widget: InkWell(
                onTap: _showEditNameDialog,
                child: const Icon(Icons.edit, color: AppColors.sidedText, size: 20),
              ),
            ),
            const SizedBox(height: 15),
            const AccountSettings(
              title: AppText.email,
              content: 'ghada.af@yahoo.com',
              widget: null,
            ),
            const SizedBox(height: 15),
            AccountSettings(
              title: AppText.password,
              content: AppText.changePassword,
              widget: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResetPassword(needCurrentPassword: true)),
                  );
                },
                child: const Icon(Icons.arrow_forward_ios, color: AppColors.sidedText, size: 13),
              ),
            ),
            buildPadding(),
            SettingsOptions(
              title: AppText.notification,
              value: isNotificationsEnabled,
              function: _toggleNotifications,
            ),
            buildPadding(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(AppText.logout, style: TextStyle(color: AppColors.sidedText, fontSize: 18)),
                IconButton(
                  onPressed: () {Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false,);},
                  icon: const Icon(Icons.logout, color: AppColors.sidedText),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding buildPadding() {
    return const Padding(
            padding: EdgeInsets.only(bottom: 10, top: 10, right: 55, left: 55),
            child: Divider(color: AppColors.hintText, thickness: 1),
          );
  }
}
