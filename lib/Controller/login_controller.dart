import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/Screens/AdminPage.dart';
import 'package:delivery_app/Screens/HomePage.dart';
import 'package:delivery_app/Screens/login_page.dart';
import 'package:delivery_app/model/User/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

class LoginController extends GetxController{

  GetStorage box = GetStorage();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;

  TextEditingController registername = TextEditingController();
  TextEditingController registernumber = TextEditingController();
  TextEditingController loginnumber = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isPasswordResetting = false;
  bool isRegister = false;

  OtpFieldControllerV2 otpContoller = OtpFieldControllerV2();
  bool otpFieldShown = false;
  int? otpSend ;
  int? otpEntered;




  @override
  void onInit() {
    userCollection = firestore.collection('User');
    super.onInit();
  }

  Future<void> addUser() async {
    try {
      // Check if OTP is correct
      if (otpSend == otpEntered) {
        // Check if a user with the same phone number already exists
        QuerySnapshot querySnapshot = await userCollection.where('number', isEqualTo: int.parse(registernumber.text)).get();

        if (querySnapshot.docs.isNotEmpty) {
          // User with the same phone number already exists, update password
          DocumentSnapshot userDoc = querySnapshot.docs.first;
          String userId = userDoc.id;

          // Define newPassword variable
          String newPassword = password.text;

          await userCollection.doc(userId).update({
            'password': newPassword,
          });

          Get.snackbar('Success', 'Password updated successfully',
              colorText: Colors.green, duration: Duration(seconds: 2));

          // Clear fields after updating password
          registername.clear();
          registernumber.clear();
          otpContoller.clear();
          password.clear();

          // Reset flag after password reset
          isPasswordResetting = false;
          otpFieldShown = false;
          otpSend = null;
          update();
          Get.off(Login());

        } else {
          // User with the same phone number does not exist, proceed to add the new user
          DocumentReference doc = userCollection.doc();
          User user = User(
            id: doc.id,
            name: registername.text,
            number: int.parse(registernumber.text),
            password: password.text,
          );
          final userJson = user.toJson();
          doc.set(userJson);
          Get.snackbar('Success', 'User added successfully',
              colorText: Colors.green, duration: Duration(seconds: 2));

          // Clear fields after adding user
          registername.clear();
          registernumber.clear();
          otpContoller.clear();
          password.clear();

          // Reset flag after password reset
          isRegister = false;
          otpFieldShown = false;
          otpSend = null;
          update();

          Get.off(Login());
        }
      } else {
        Get.snackbar('Error', 'OTP is incorrect',
            colorText: Colors.red, duration: Duration(seconds: 2));
      }
    } catch (e) {
      Get.snackbar('Error', 'Please fill the fields',
          colorText: Colors.red, duration: Duration(seconds: 2));
      print(e);
    }
  }




  sendOTP(){
    try {
      if(registername.text.isEmpty || registernumber.text.isEmpty || password.text.isEmpty){
        Get.snackbar('Error', 'Fill the fields', colorText: Colors.red, duration: Duration(seconds: 1));
        return;
      }

      // Check if the phone number starts with '07' and has 10 digits
      String phoneNumber = registernumber.text.trim();
      if (!phoneNumber.startsWith('07') || phoneNumber.length != 10) {
        Get.snackbar('Error', 'Invalid phone number', colorText: Colors.red, duration: Duration(seconds: 1));

        // Clear fields after updating password
        registernumber.clear();
        password.clear();

        // Reset flag after password reset
        isRegister = false;
        otpFieldShown = false;
        otpSend = null;
        update();

      return;


      }

      final random = Random();
      int otp = 1000 + random.nextInt(9000);
      print(otp);
      if (otp != null) {
        otpFieldShown = true;
        otpSend=otp;
        Get.snackbar(
            'Success', 'OTP sent successfully', colorText: Colors.green, duration: Duration(seconds: 1));


      } else {
        Get.snackbar('Error', 'OTP not found', colorText: Colors.red, duration: Duration(seconds: 1));
      }
    } catch (e) {
      print(e);
    } finally {
      update();
    }
  }

  sendOTPForResetPassword(){
    try {
      if(registernumber.text.isEmpty ){
        Get.snackbar('Error', 'Fill the fields', colorText: Colors.red, duration: Duration(seconds: 1));
        return;
      }

      // Check if the phone number starts with '07' and has 10 digits
      String phoneNumber = registernumber.text.trim();
      if (!phoneNumber.startsWith('07') || phoneNumber.length != 10) {
        Get.snackbar('Error', 'Invalid phone number', colorText: Colors.red, duration: Duration(seconds: 1));

        registernumber.clear();
        password.clear();
        isPasswordResetting = false;
        otpFieldShown = false;
        otpSend = null;
        update();
        return;
      }

      final random = Random();
      int otp = 1000 + random.nextInt(9000);
      print(otp);
      if (otp != null) {
        otpFieldShown = true;
        otpSend=otp;
        Get.snackbar(
            'Success', 'OTP sent successfully', colorText: Colors.green, duration: Duration(seconds: 1));
      } else {
        Get.snackbar('Error', 'OTP not found', colorText: Colors.red, duration: Duration(seconds: 1));
      }
    } catch (e) {
      print(e);
    } finally {
      update();
    }
  }


  Future<void> LoginWithPhone() async {
    try {
      String phonenumber = loginnumber.text;
      String Password = password.text;



      if (!phonenumber.isEmpty && !Password.isEmpty) {
        var querySnapshot = await userCollection
            .where('number', isEqualTo: int.tryParse(phonenumber))
            .limit(1)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          var userDoc = querySnapshot.docs.first;
          var userData = userDoc.data() as Map<String, dynamic>;

          String storedPassword = userData['password'];

          if (storedPassword == Password) {
            // Check if it's admin login
            if (phonenumber == '0764191135' && Password == '12345') {
              // Admin login successful
              Get.to(AdminHomePage());
              loginnumber.clear();
              password.clear();
            } else {
              // Regular user login successful
              box.write('Login User', userData);
              loginnumber.clear();
              password.clear();
              Get.to(HomePage());
            }

            Get.snackbar(
              'Success',
              'Login Success',
              colorText: Colors.green,
              duration: Duration(seconds: 1),
            );
          } else {
            Get.snackbar(
              'Error',
              'Incorrect Password. Please try again.',
              colorText: Colors.red,
            );
          }
        } else {
          Get.snackbar(
            'Error',
            'User Not Found. Please Register',
            colorText: Colors.red,
          );
        }
      } else {
        Get.snackbar(
          'Error',
          'Please enter both phone number and password',
          colorText: Colors.red,
          duration: Duration(seconds: 1),
        );
      }
    } catch (error) {
      print('Failed to Login: $error');
      Get.snackbar(
        'Error',
        'Failed to Login',
        colorText: Colors.red,
        duration: Duration(seconds: 1),
      );
    }
  }



}

