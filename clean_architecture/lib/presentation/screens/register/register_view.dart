import 'package:clean_architecture/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(onPressed: (){
          Navigator.pushReplacementNamed(context, Routes.splashRoute);
        }, child: Text("data")),
      ),
    );
  }
}