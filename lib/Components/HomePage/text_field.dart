import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final ValueChanged<String> onTextChange;
  const MyTextField({super.key, required this.onTextChange});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: SingleChildScrollView(
        child: TextField(
          maxLines: null,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black87,
            fontWeight: FontWeight.w400,
          ),
          decoration: const InputDecoration(
            hintText: 'Write your notes here...',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
          ),
          onChanged: widget.onTextChange, // Call the callback with the new text
        ),
      ),
    );
  }
}
