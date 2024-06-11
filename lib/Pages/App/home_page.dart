import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progress_tracker/Components/HomePage/check_box.dart';
import 'package:progress_tracker/Components/Defaults/my_drawer.dart';
import 'package:progress_tracker/Components/HomePage/text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool? isCheckedML = false;
  bool? isCheckedContentCreation = false;
  bool? isCheckedProductDevelopment = false;
  bool? isCheckedJournal = false;
  String notes = "";

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  final db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  void _resetInputFields() {
    setState(() {
      isCheckedML = false;
      isCheckedContentCreation = false;
      isCheckedProductDevelopment = false;
      isCheckedJournal = false;
      notes = "";
    });
  }

  void handleCheckboxChangeML(bool? newValue) {
    setState(() {
      isCheckedML = newValue;
    });
  }

  void handleCheckboxChangeContentCreation(bool? newValue) {
    setState(() {
      isCheckedContentCreation = newValue;
    });
  }

  void handleCheckboxChangeProductDevelopment(bool? newValue) {
    setState(() {
      isCheckedProductDevelopment = newValue;
    });
  }

  void handleCheckboxChangeJournal(bool? newValue) {
    setState(() {
      isCheckedJournal = newValue;
    });
  }

  void handleTextChange(String newValue) {
    setState(() {
      notes = newValue;
    });
  }

  Future<void> submitReport() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("User is not logged in");
      return;
    }

    final data = {
      'Machine Learning': isCheckedML,
      'Content Creation': isCheckedContentCreation,
      'Product Development': isCheckedProductDevelopment,
      'Journal': isCheckedJournal,
      'Notes': notes,
      'Timestamp': FieldValue.serverTimestamp(),
    };

    final date = DateTime.now();
    final dateString = "${date.year}-${date.month}-${date.day}";

    try {
      await db
          .collection('dailyProgress')
          .doc(user.uid)
          .collection('progress')
          .doc(dateString)
          .set(data);
      print("Data successfully added to Firestore");
      _resetInputFields(); // Reset the input fields after submitting
    } catch (e) {
      print("Error adding data to Firestore: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          "H O M E",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(238, 128, 94, 0.8),
      ),
      drawer: const MyDrawer(),
      body: ListView(children: [
        const SizedBox(height: 90),
        const Center(
          child: Text(
            "Progress Today",
            style: TextStyle(fontSize: 30),
          ),
        ),
        const SizedBox(height: 30),
        CustomCheckBox(
          title: "Machine Learning",
          initialValue: isCheckedML ?? false,
          onChanged: handleCheckboxChangeML,
        ),
        CustomCheckBox(
          title: "Content Creation",
          initialValue: isCheckedContentCreation ?? false,
          onChanged: handleCheckboxChangeContentCreation,
        ),
        CustomCheckBox(
          title: "Product Development",
          initialValue: isCheckedProductDevelopment ?? false,
          onChanged: handleCheckboxChangeProductDevelopment,
        ),
        CustomCheckBox(
          title: "Journal",
          initialValue: isCheckedJournal ?? false,
          onChanged: handleCheckboxChangeJournal,
        ),
        const SizedBox(height: 30),
        MyTextField(onTextChange: handleTextChange),
        const SizedBox(height: 30),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: submitReport,
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll<Color>(
                Color.fromRGBO(238, 128, 94, 1),
              ),
            ),
            child: const Text(
              "Submit",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ]),
    );
  }
}
