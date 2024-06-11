import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:progress_tracker/Components/Defaults/row_elements.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(238, 128, 94, 1),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
              onTap: () {
                context.go('/homePage');
              },
            ),
            RowElements(
              label: "Team",
              name: "team",
              onTap: () {
                context.go('/teamPage');
              },
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
    );
  }
}
