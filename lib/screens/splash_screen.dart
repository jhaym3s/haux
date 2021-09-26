import 'package:flutter/material.dart';
import 'package:haux/screens/screens.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({ Key? key }) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then(
        (value) => Navigator.pushReplacementNamed(context, AuthenticationScreen.routeName));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Center(
        child: Image.asset("assets/image/logo.png"),
      ),
    );
  }
}
