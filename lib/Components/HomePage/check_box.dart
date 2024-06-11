import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final String title;
  final bool initialValue;
  final ValueChanged<bool?> onChanged;
  const CustomCheckBox({
    super.key,
    required this.title,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<CustomCheckBox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckBox> {
  bool? isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CheckboxListTile(
          value: isChecked,
          title: Text(
            widget.title,
            style: const TextStyle(fontSize: 18),
          ),
          onChanged: (newBool) {
            setState(() {
              isChecked = newBool;
            });
            widget.onChanged(newBool); // Call the callback with the new value
          },
          checkColor: Colors.white,
          activeColor: Colors.orangeAccent,
          tileColor: const Color.fromARGB(31, 238, 151, 64),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
