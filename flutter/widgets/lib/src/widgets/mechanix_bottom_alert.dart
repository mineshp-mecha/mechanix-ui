import 'package:flutter/material.dart';
import 'mechanix_elevated_button.dart';

class MechanixBottomAlert extends StatelessWidget {
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

  MechanixBottomAlert({
    super.key,
    required this.title,
    required this.message,
    required this.primaryLabel,
    required this.onPrimaryPressed,
    required this.secondaryLabel,
    required this.onSecondaryPressed,
    this.primaryColor = Colors.red,
    Color? secondaryColor,
    this.primaryButtonTextColor = Colors.white,
    this.secondaryButtonTextColor = Colors.white,
  }) : secondaryColor = secondaryColor ?? Colors.grey[800]!;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            message,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: MechanixElevatedButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  label: secondaryLabel,
                  onPressed: () {
                    Navigator.of(context).pop();
                    onSecondaryPressed();
                  },
                  backgroundColor: secondaryColor,
                  textColor: secondaryButtonTextColor,
                  borderRadius: 50.0,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: MechanixElevatedButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  label: primaryLabel,
                  onPressed: () {
                    Navigator.of(context).pop();
                    onPrimaryPressed();
                  },
                  backgroundColor: primaryColor,
                  textColor: primaryButtonTextColor,
                  borderRadius: 50.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Helper to show bottom alert
void showMechanixBottomAlert(
    {required BuildContext context,
    required String title,
    required String message,
    required String primaryLabel,
    required VoidCallback onPrimaryPressed,
    required String secondaryLabel,
    required VoidCallback onSecondaryPressed,
    Color? primaryColor,
    Color? secondaryColor,
    Color? primaryButtonTextColor,
    Color? secondaryButtonTextColor}) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (ctx) {
      return MechanixBottomAlert(
        title: title,
        message: message,
        primaryLabel: primaryLabel,
        onPrimaryPressed: onPrimaryPressed,
        secondaryLabel: secondaryLabel,
        onSecondaryPressed: onSecondaryPressed,
        primaryColor: primaryColor ?? Colors.red,
        secondaryColor: secondaryColor,
        primaryButtonTextColor: primaryButtonTextColor ?? Colors.white,
        secondaryButtonTextColor: secondaryButtonTextColor ?? Colors.white,
      );
    },
  );
}
