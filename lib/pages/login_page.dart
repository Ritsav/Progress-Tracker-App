import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:progress_tracker/Components/login_text_field.dart';
import 'package:progress_tracker/Components/sign_in_btn.dart';
import 'package:progress_tracker/functions/helper_functions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text Controller
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  //signIn function

  void signIn() async {
    // Show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Pop loading circle if the widget is still mounted
      if (mounted) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      // Pop loading circle if the widget is still mounted
      if (mounted) {
        Navigator.pop(context);
        displayMessageToUser(e.code, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(204, 255, 206, 190),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              const Icon(
                Icons.person,
                size: 80,
              ),

              const SizedBox(height: 25),

              //App Name
              const Center(
                child: Text(
                  "P R O G R E S S",
                  style: TextStyle(fontSize: 30),
                ),
              ),

              const SizedBox(height: 50),

              //Email textfield
              LoginTextField(
                hintText: "Email",
                obscureText: false,
                controller: emailController,
              ),

              const SizedBox(height: 10),

              //Password Textfield
              LoginTextField(
                hintText: "Password",
                obscureText: true,
                controller: passwordController,
              ),

              const SizedBox(height: 25),

              // Sign In Button
              MyButton(text: "Sign In", onTap: signIn)
            ],
          ),
        ),
      ),
    );
  }
}
