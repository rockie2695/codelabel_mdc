import 'package:codelabel_mdc/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var username = '';
  late final TextEditingController usernameController;
  var password = '';
  var obscurePassword = true;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController(text: username);
    passwordController = TextEditingController(text: password);
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 80.0),
                  Icon(
                    Icons.diamond_outlined,
                    size: 40.0,
                  ), //Image.asset('assets/diamond.png'),
                  SizedBox(height: 16.0),
                  Text('Shrine'),
                  SizedBox(height: 120.0),
                  // [Name]
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Username',
                    ),
                    onChanged: (value) {
                      username = value;
                    },
                  ),
                  // spacer
                  SizedBox(height: 20.0),
                  // [Password]
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye, semanticLabel: 'toggle password visibility'),
                        tooltip: 'Toggle password visibility',
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                      ),
                    ),
                    obscureText: obscurePassword,
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  SizedBox(height: 80.0),
                  Row(
                    //or OverflowBar
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          usernameController.clear();
                          passwordController.clear();
                        },
                        child: Text('Reset'),
                      ),
                      SizedBox(width: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.push(
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HomePage(username: usernameController.text),
                            ),
                          );
                        },
                        child: Text('Next'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
