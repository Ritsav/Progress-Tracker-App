import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:progress_tracker/Components/check_box.dart';
import 'package:progress_tracker/Components/row_elements.dart';
import 'package:progress_tracker/Components/text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool? isChecked = false;

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  void submitReport() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Progress Tracker"),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(238, 128, 94, 0.8),
        actions: [
          IconButton(onPressed: logout, icon: const Icon(Icons.logout))
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(238, 128, 94, 1),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const DrawerHeader(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.favorite),
                      Text(
                        "Progress Tracker",
                        style: TextStyle(fontSize: 30),
                      )
                    ],
                  )),
                  const SizedBox(height: 30),
                  RowElements(
                    label: "Home",
                    name: "home",
                    onTap: () {},
                  ),
                  RowElements(
                    label: "Team",
                    name: "team",
                    onTap: () {},
                  ),
                  RowElements(
                    label: "Progress",
                    name: "progress",
                    onTap: () {
                      context.go('/progressPage');
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  RowElements(
                    label: "Logout",
                    name: "logout",
                    onTap: logout,
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ]),
      ),
      body: ListView(children: [
        const SizedBox(height: 90),
        const Center(
          child: Text(
            "Progress Today",
            style: TextStyle(fontSize: 30),
          ),
        ),
        const SizedBox(height: 30),
        const CustomCheckBox(title: "Machine Learning"),
        const CustomCheckBox(title: "Content Creation"),
        const CustomCheckBox(title: "Product Development"),
        const CustomCheckBox(title: "Journal"),
        const SizedBox(height: 30),
        const MyTextField(),
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
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: const Color.fromRGBO(238, 128, 94, 1),
      //   child: const Text(
      //     "+",
      //     style: TextStyle(fontSize: 20),
      //   ),
      //   onPressed: () {},
      // ),
    );
  }
}
