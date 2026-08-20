import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final _namecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoggedIn = false;
  String userName = "";

  @override
  void dispose() {
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoggedIn ? buildSuccessScreen() : buildLoginScreen(),
    );
  }

  Widget buildLoginScreen() {
    return Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _namecontroller,
                decoration: const InputDecoration(
                  labelText: "Name",
                  hintText: "Enter Name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
              ),

              TextFormField(
                controller: _namecontroller,
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Enter Email",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }

                  final emailRegex = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );

                  if (!emailRegex.hasMatch(value)) {
                    return "Please enter a valid email";
                  }

                  return null;
                },
              ),

              TextFormField(
                controller: _namecontroller,
                decoration: const InputDecoration(
                  labelText: "Password",
                  hintText: "Enter Password",
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  return null;
                },
              ),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("Form is valid");
                  }
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      );
  }

  Widget buildSuccessScreen(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.check, color: Colors.green,),

        Text("Welcome $userName")
      ],
    );
  }
}
