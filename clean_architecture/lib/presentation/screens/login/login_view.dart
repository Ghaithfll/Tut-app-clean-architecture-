import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 350,
          ),
          Container(
              //color: Colors.blue,
              width: MediaQuery.sizeOf(context).width * 0.65,
              child: (TextButton(
                  onPressed: () {},
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "~Hello~",
                        textAlign: TextAlign.start,
                      ))))),
        ],
      )),
    );
  }
}
