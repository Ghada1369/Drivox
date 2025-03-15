import 'package:drivox/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class StartDrivingButton extends StatefulWidget {
  const StartDrivingButton({super.key});

  @override
  State<StartDrivingButton> createState() => _StartDrivingButtonState();
}

class _StartDrivingButtonState extends State<StartDrivingButton> {
  void startDriving() {
    if (selectedContacts.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Start Driving'),
          content: Text('Are you sure you want to start driving with ${selectedContacts[0].displayName}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Starting driving with ${selectedContacts[0].displayName}')),
                );
              },
              child: const Text('Yes, Start Driving'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 60,
      right: 60,
      child: ElevatedButton(
        onPressed: selectedContacts.isEmpty ? null : startDriving,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(selectedContacts.isEmpty ? Colors.grey : Colors.green),
        ),
        child: const Text('Start Driving'),
      ),
    );
  }
}
