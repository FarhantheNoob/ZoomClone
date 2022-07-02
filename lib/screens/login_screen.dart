import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Start or join a meeting',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Image.asset('assets/onboarding.jpg'),
            ),
            CustomButton(text: 'Sign In to join meeting', onPressed: () async{
              bool res = await _authMethods.signInWithGoogle(context);
              if(res){
                Navigator.pushNamed(context, '/home');
              }
            })
          ],
        ),
      ),
    );
  }
}
