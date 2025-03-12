import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inteshar/app/config/handle_logout.dart';

void exitDialog(String message) {
  // Displaying a dialog using GetX
  Get.dialog(
    barrierDismissible: false,
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(16), // Rounded corners for the dialog
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Padding inside the dialog
        child: Column(
          mainAxisSize: MainAxisSize.min, // Makes the dialog wrap its content
          children: [
            Text(
              message,
              textAlign: TextAlign.center, // Center-align the text
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20), // Space between text and button
            ElevatedButton(
              onPressed: () {
                // Close the dialog when the button is pressed
                handleLogout('تم تسجيل خروجك من قبل المشرف!');
              },
              child: const Text("تسجيل الدخول"),
            ),
          ],
        ),
      ),
    ),
  );
}
