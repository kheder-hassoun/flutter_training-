// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:shared_preferences/shared_preferences.dart';
import 'sounds.dart';
import 'package:flutter/material.dart';

class Data {
  static Future<void> showDeleteAccountConfirmationDialog(
      BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: AlertDialog(
            backgroundColor: Color.fromARGB(141, 32, 32, 32),
            title: Text(
              "Confirm Deletion",
              style: TextStyle(color: const Color.fromARGB(255, 214, 21, 7)),
            ),
            content: Text(
                "Are you sure you want to delete the entir account ⚠?",
                style: TextStyle(color: Color.fromARGB(255, 219, 133, 2))),
            actions: [
              TextButton(
                onPressed: () {
                  // Cancel the deletion
                  MySound.playAudio("assests/audio/open.mp3");
                  Navigator.of(context).pop();
                },
                child: Text("Cancel",
                    style: TextStyle(color: Color.fromARGB(255, 3, 138, 25))),
              ),
              TextButton(
                onPressed: () async {
                  MySound.playAudio("assests/audio/open.mp3");
                  // Confirm and delete the item
                  SharedPreferences _prefs =
                      await SharedPreferences.getInstance();
                  if (_prefs.getString('name') != null) {
                    _prefs.remove("name");
                    _prefs.remove("password");
                    _prefs.remove('star1');
                    _prefs.remove('star2');
                    _prefs.remove('star3');
                    _prefs.remove('star4');
                    _prefs.remove('star5');
                    _prefs.remove('loginwallpaper');
                    _prefs.remove('wallpaper');
                    _prefs.remove('fast_boot');
                    _prefs.remove('items'); //for secret note
                    _prefs.remove('items2'); //for memoryis
                    _prefs.remove('items3'); //for studylist
                    _prefs.remove('items4'); //for Tasks
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "succesfully done ! ",
                        ),
                        backgroundColor: Color.fromARGB(255, 7, 235, 26),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "failed becuse no account founded",
                        ),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }

                  Navigator.of(context).pop();
                },
                child: Text("Yes",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 214, 21, 7))),
              ),
            ],
          ),
        );
      },
    );
  }
}
