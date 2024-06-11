import 'package:flutter/material.dart';
import 'package:progress_tracker/Components/Defaults/my_drawer.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "T E A M",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(238, 128, 94, 0.8),
      ),
      drawer: const MyDrawer(),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Coming Soon...",
            style: TextStyle(fontSize: 30),
          ))
        ],
      ),
    );
  }
}
