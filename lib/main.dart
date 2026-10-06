import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          title: const Text('Example title'),
          actions: const [
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null,
            ),
          ],
        ),
        body: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var username = '';
  late final TextEditingController usernameController;
  var password = '';
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
    return Center(
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
              decoration: InputDecoration(filled: true, labelText: 'Username'),
              onChanged: (value) {
                username = value;
              },
            ),
            // spacer
            SizedBox(height: 12.0),
            // [Password]
            TextField(
              controller: passwordController,
              decoration: InputDecoration(filled: true, labelText: 'Password'),
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {}, child: Text('Reset')),
                ElevatedButton(onPressed: () {}, child: Text('Next')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
