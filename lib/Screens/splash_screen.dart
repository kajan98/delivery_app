import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:delivery_app/Screens/HomePage.dart';
import 'package:delivery_app/Screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool hasInternet = false;
  GetStorage box = GetStorage();

  @override
  void onReady() {
    Map<String,dynamic>? user = box.read("Login User");
    if (user != null){
      Get.to(HomePage());
    }else{

    }

  }

  @override
  void initState() {
    super.initState();
    checkInternet();
  }

  Future<void> checkInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        hasInternet = false;
      });
    } else {
      setState(() {
        hasInternet = true;
      });
      Timer(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Login()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Container(
              width: 150,
              height: 150,
              child: Image.asset('Assets/logo.jpeg'),
            ),
            const SizedBox(height: 20),
            hasInternet
                ? const SpinKitWave(
              color: Colors.black87,
              size: 35.0,
            )
                : const Text(
              'No Internet Connection',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
