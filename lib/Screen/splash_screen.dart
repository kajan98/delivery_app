import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'Home Page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool hasInternet;

  @override
  void initState() {
    super.initState();
    checkInternet();
  }

  Future<void> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        hasInternet = false;
      });
    } else {
      setState(() {
        hasInternet = true;
      });
      Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: hasInternet == false
            ? const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('No Internet Connection!'),
            SizedBox(height: 20),
          ],
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Image.asset('Assets/1.jpeg'),
            const SpinKitFadingCircle(
              color: Colors.orangeAccent,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
