
import 'package:flutter/material.dart';

import 'package:homestay_raya/views/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final bool _passwordVisible = true;
  final _formKey = GlobalKey<FormState>();
  bool _ischecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
          child: SingleChildScrollView(
              child: Card(
        elevation: 11,
        margin: const EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                    controller: _emailEditingController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) =>
                        val!.isEmpty || !val.contains("@") || !val.contains(".")
                            ? "Enter a Valid Email"
                            : null,
                    decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(),
                        icon: Icon(Icons.email),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.0),
                        ))),
                TextFormField(
                    controller: _passwordEditingController,
                    keyboardType: TextInputType.visiblePassword,
                   validator: (val) => validatePassword(val.toString()),
                    obscureText: _passwordVisible,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(),
                        icon: const Icon(Icons.lock),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1.0),
                        ))),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Checkbox(
                        value: _ischecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _ischecked = value!;
                          });
                        }),
                    Flexible(
                      child: GestureDetector(
                        onTap: null,
                        child: const Text('Remember Me',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      minWidth: 112,
                      height: 40,
                      elevation: 7,
                      onPressed: _loginUser,
                      color: Theme.of(context).colorScheme.primary,
                      child: const Text('Log In'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                GestureDetector(
                  onTap: _goRegister,
                  child: const Text(
                    "Don't have an account. Register now",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                
              ],
            ),
          ),
        ),
      ))),
    );
  }

String? validatePassword(String value) {
    String pattern = r'^(?=.*?[A‐Z])(?=.*?[a‐z])(?=.*?[0‐9]).{6,}$';
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Wrong password';
      } else {
        return null;
      }
    }
  }
  void _loginUser() {}

  
  void _goRegister(){
    Navigator.push(
        context, MaterialPageRoute(builder: (content) => const RegisterPage()));
  }
}
