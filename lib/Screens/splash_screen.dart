import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:delivery_app/Screens/HomePage.dart';
import 'package:delivery_app/Screens/onboard.dart';
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
  void initState() {
    super.initState();
    checkInternetAndNavigate();
  }

  Future<void> checkInternetAndNavigate() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        hasInternet = false;
      });
      // Show snackbar for no internet connection
      Get.snackbar(
        'Error',
        'No Internet Connection',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      setState(() {
        hasInternet = true;
      });

      // Check if user is logged in
      bool isLoggedIn = box.read('isLoggedIn') ?? false;

      // Navigate based on login status
      Timer(const Duration(seconds: 3), () {
        if (isLoggedIn) {
          Get.offAll(() => HomePage()); // Navigate to home page
        } else {
          Get.offAll(() => Onboard()); // Navigate to login page
        }
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
