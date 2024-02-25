// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:convert';
import 'package:ali_app/showmemoryitem.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'sounds.dart';

bool isArabic(String text) {
  final arabicRegex = RegExp(r'[\u0600-\u06FF]');
  return arabicRegex.hasMatch(text);
}

class TodoItem {
  final String text;
  final Color color;

  TodoItem({required this.text, required this.color});
}

class Tasks extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<Tasks> {
  final TextEditingController _textEditingController = TextEditingController();
  Color? selectedColor;
  List<TodoItem> items = [];

  @override
  void initState() {
    super.initState();
    loadItems();
  }

////
  void loadItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonData = prefs.getString('items4');
    if (jsonData != null) {
      final itemsData = json.decode(jsonData) as List<dynamic>;
      setState(() {
        items = itemsData
            .map((item) =>
                TodoItem(text: item['text'], color: Color(item['color'])))
            .toList();
      });
    }
  }

////
  void saveItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final itemsData = items
        .map((item) => {'text': item.text, 'color': item.color.value})
        .toList();
    prefs.setString('items4', json.encode(itemsData));
  }

  void addItem(String itemText, Color itemColor) {
    setState(() {
      items.add(TodoItem(text: itemText, color: itemColor));
    });
    saveItems();
  }

  void showSnackBar(BuildContext context1, String message, Color color) {
    ScaffoldMessenger.of(context1).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        backgroundColor: color,
        duration: Duration(seconds: 3),
      ),
    );
  }

  Future<void> _showAddItemDialog() async {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(96, 75, 74, 74),
          title: Text(
            'Add new task ',
            style: TextStyle(color: Color.fromARGB(255, 168, 2, 2)),
          ),
          content: SizedBox(
            width: screenWidth * 0.8,
            height: screenHight / 3.5,
            child: Card(
              color: Color.fromARGB(41, 49, 49, 49),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  side: BorderSide(
                      color: Color.fromARGB(255, 141, 12, 3), width: 0.8)),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      style: TextStyle(
                          color: const Color.fromARGB(255, 247, 7, 255)),
                      controller: _textEditingController,
                      decoration: InputDecoration(
                          hintText: 'write ur task here ',
                          hintStyle: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 201, 57, 1))),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    DropdownButtonFormField<Color>(
                      hint: Text(
                        " select task color ",
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 201, 57, 1)),
                      ),
                      //  icon: Icon(Icons.color_lens),
                      dropdownColor: Color.fromARGB(255, 32, 32, 32),
                      value: selectedColor,
                      items: [
                        DropdownMenuItem(
                          value: Colors.red,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(
                                        20.0), // Round the edges
                                  ),
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Red',
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                              255,
                                              15,
                                              15,
                                              15), // Text color matches the selected color
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: Colors.blue,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(
                                        20.0), // Round the edges
                                  ),
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Blue',
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                              255,
                                              15,
                                              15,
                                              15), // Text color matches the selected color
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: Colors.green,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(
                                        20.0), // Round the edges
                                  ),
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Green',
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                              255,
                                              15,
                                              15,
                                              15), // Text color matches the selected color
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: Colors.yellow,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(
                                        20.0), // Round the edges
                                  ),
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Yellow',
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                              255,
                                              15,
                                              15,
                                              15), // Text color matches the selected color
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                      onChanged: (color) {
                        setState(() {
                          selectedColor = color;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(color: const Color.fromARGB(255, 219, 20, 6)),
              ),
              onPressed: () {
                MySound.playAudio("assests/audio/open.mp3");
                Navigator.of(context).pop();
                showSnackBar(
                    context, "okay canceld ", Color.fromARGB(255, 247, 6, 6));
              },
            ),
            TextButton(
              child: Text('Save',
                  style: TextStyle(color: Color.fromARGB(255, 6, 219, 17))),
              onPressed: () {
                if (_textEditingController.text.isNotEmpty &&
                    selectedColor != null) {
                  MySound.playAudio("assests/audio/open.mp3");
                  addItem(_textEditingController.text, selectedColor!);
                  _textEditingController.clear();
                  Navigator.of(context).pop();
                  showSnackBar(context, "succesfully Done ✔",
                      Color.fromARGB(255, 26, 247, 6));
                }
              },
            ),
          ],
        );
      },
    );
  }
////////////////////////////////////////
  ///

  void showDeleteConfirmationDialog(BuildContext context, int index) {
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
            content: Text("Are you sure you want to delete this task ✔?",
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
                onPressed: () {
                  MySound.playAudio("assests/audio/open.mp3");
                  // Confirm and delete the item
                  setState(() {
                    items.removeAt(index);
                  });
                  saveItems();
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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: screenHight,
          width: screenWidth,
          color: Colors.black,
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: screenHight * 0.1,
              ),
              SizedBox(
                //! dont delete this
                height: screenHight * 0.9,
                width: screenWidth * 0.9,
                // child: Image.asset(
                //   "assests/wallpapers/w8.jpg", //screen wallpaper
                //   fit: BoxFit.cover,
                // ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: screenHight * 0.7,
          width: screenWidth * 0.8,
          child: Opacity(
            opacity: 0.6,
            child: Image.asset(
              "assests/gif/7.gif", //screen wallpaper
              fit: BoxFit.fill,
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Card(
                        color: Color.fromARGB(66, 44, 44, 44),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            side: BorderSide(
                                color: Color.fromARGB(255, 53, 52, 52),
                                width: 1)),
                        child: Container(
                          //height: screenHight / 6,
                          width: screenWidth * 0.9,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      // Show a confirmation dialog before deletion
                                      showDeleteConfirmationDialog(
                                          context, index);
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors
                                          .red, // Change the color to your preference
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    " task id :  $index",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 227, 12, 235)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(builder: (_) {
                                        return MemoryItem(
                                          details: item.text,
                                          color: item.color,
                                        );
                                      }));
                                    },
                                    child: Text(
                                      " show 📑",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: const Color.fromARGB(
                                              255, 71, 71, 71)),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              SizedBox(
                                width: screenWidth * 0.7,
                                height: 40,
                                child: Marquee(
                                  textDirection: isArabic(item.text)
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                  blankSpace: 30,
                                  text: item.text,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: item.color,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                onTap: _showAddItemDialog,
                child: Container(
                  height: 60,
                  width: screenWidth * 0.5,
                  color: Color.fromARGB(80, 121, 119, 119),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.add,
                        color: const Color.fromARGB(255, 218, 255, 7),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        )
      ],
    ));
  }
}
