import 'package:flutter/material.dart';

class Greeting {
  static String getGreeting() {
    final DateTime timeNow = DateTime.now();
    final int hourNow = timeNow.hour;
    if (hourNow <= 12) {
      return 'Good Morning';
    } else if ((hourNow > 12) && (hourNow <= 16)) {
      return 'Good Afternoon';
    } else if ((hourNow > 16) && (hourNow < 20)) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  static Color getColor() {
    final DateTime timeNow = DateTime.now();
    final int hourNow = timeNow.hour;
    Color color;
    if (hourNow <= 12) {
      color = Colors.lightBlue.shade300; // Morning
    } else if ((hourNow > 12) && (hourNow <= 16)) {
      color = Colors.blue.shade300; // Afternoon
    } else if ((hourNow > 16) && (hourNow < 20)) {
      color = Colors.cyan.shade300; // Evening
    } else {
      color = Colors.indigo.shade300; // Night
    }
    return color.withOpacity(0.7);
  }
}
