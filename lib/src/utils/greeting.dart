/*
MIT License

Copyright (c) 2023 Tegar Bangun Suganda (OVERMIND)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

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
