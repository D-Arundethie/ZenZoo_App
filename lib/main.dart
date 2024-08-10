import 'package:flutter/material.dart';
import 'package:myapp/SignUp.dart';

import 'dart:io';
import 'package:flutter/services.dart';

void main() {
  runApp(ZenZooApp());
}

class ZenZooApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZenZoo App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
      routes: {
        '/SignUp': (context) => HomePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('Assests/ZZ HI.png', height: 300),
            SizedBox(height: 20),
            Text(
              'Hi! I\'m ZenZoo',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Your Virtual Assistant pet',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Get Started',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Handle "Already have an account" button press
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Already have an account',
                style: TextStyle(fontSize: 18, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmotionDetectionPage extends StatelessWidget {
  static const platform = MethodChannel('com.example.yourapp/emotion');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Emotion Detection')),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              try {
                // Provide path to image file
                final result = await platform.invokeMethod(
                    'analyzeEmotion', {'path': 'path/to/your/image.jpg'});
                print('Detected emotion: $result');
              } on PlatformException catch (e) {
                print("Failed to analyze emotion: '${e.message}'.");
              }
            },
            child: Text('Analyze Emotion'),
          ),
        ),
      ),
    );
  }
}
