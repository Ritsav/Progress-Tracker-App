import 'package:flutter/material.dart';

class RowElements extends StatelessWidget {
  final String label;
  final String name;
  final void Function()? onTap;

  const RowElements(
      {super.key,
      required this.label,
      required this.name,
      required this.onTap});

  static const Map<String, IconData> iconsMap = {
    'home': Icons.home,
    'settings': Icons.settings,
    'search': Icons.search,
    'team': Icons.group,
    'progress': Icons.leaderboard,
    'update': Icons.upcoming,
    'logout': Icons.logout,
    // Add more icon mappings as needed
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        leading: Icon(
          iconsMap[name] ??
              Icons.help, // Default to Icons.help if name is not found
        ),
        title: Text(
          label,
          style: const TextStyle(fontSize: 28),
        ),
        onTap: onTap,
      ),
    );
  }
}
