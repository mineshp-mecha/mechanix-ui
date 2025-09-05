import 'package:flutter/material.dart';
import 'mechanix_elevated_button.dart';

class MechanixAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final String primaryLabel;
  final VoidCallback onPrimaryPressed;
  final String secondaryLabel;
  final VoidCallback onSecondaryPressed;
  final Color primaryColor;
  final Color secondaryColor;
  final Color primaryButtonTextColor;
  final Color secondaryButtonTextColor;

  MechanixAlertDialog({
    super.key,
    required this.title,
    required this.message,
    required this.primaryLabel,
    required this.onPrimaryPressed,
    required this.secondaryLabel,
    required this.onSecondaryPressed,
    this.primaryColor = Colors.red, // default red for Delete
    Color? secondaryColor, // default grey for Cancel
    this.primaryButtonTextColor = Colors.white,
    this.secondaryButtonTextColor = Colors.white,
  }) : secondaryColor = secondaryColor ?? Colors.grey[800]!;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: Colors.grey[900],
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      content: Text(
        message,
        style: const TextStyle(color: Colors.white70),
      ),
      actions: [
        MechanixElevatedButton(
          label: secondaryLabel,
          onPressed: onSecondaryPressed,
          backgroundColor: secondaryColor,
          textColor: secondaryButtonTextColor,
          borderRadius: 50.0,
        ),
        MechanixElevatedButton(
          label: primaryLabel,
          onPressed: onPrimaryPressed,
          backgroundColor: primaryColor,
          textColor: primaryButtonTextColor,
          borderRadius: 50.0,
        ),
      ],
    );
  }
}
