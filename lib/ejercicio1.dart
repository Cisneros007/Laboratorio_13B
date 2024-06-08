import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:universal_platform/universal_platform.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UniversalPlatform.isIOS ? CupertinoApp(
      home: CupertinoLoginPage(),
    ) : MaterialApp(
      home: MaterialLoginPage(),
    );
  }
}

class MaterialLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Login', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 40.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text('Login'),
                ),
                SizedBox(height: 20.0),
                TextButton(
                  onPressed: () {},
                  child: Text('Forgot password?'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Sign up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CupertinoLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Login'),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', height: 80.0),
                SizedBox(height: 40.0),
                CupertinoTextField(
                  placeholder: 'Username',
                  padding: EdgeInsets.all(16.0),
                ),
                SizedBox(height: 20.0),
                CupertinoTextField(
                  placeholder: 'Passphrase',
                  padding: EdgeInsets.all(16.0),
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                CupertinoButton.filled(
                  onPressed: () {},
                  child: Text('Sign In'),
                ),
                SizedBox(height: 20.0),
                CupertinoButton(
                  onPressed: () {},
                  child: Text('Reset your passphrase?'),
                ),
                CupertinoButton(
                  onPressed: () {},
                  child: Text('Sign up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}