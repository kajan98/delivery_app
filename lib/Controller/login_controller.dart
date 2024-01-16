import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/Screens/home_page.dart';
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

  OtpFieldControllerV2 otpContoller = OtpFieldControllerV2();
  bool otpFieldShown = false;
  int? otpSend ;
  int? otpEntered;


  @override
  void onReady() {
    Map<String,dynamic>? user = box.read("Login User");
    if (user != null){
      Get.to(HomePage());
    }else{

    }
    super.onReady();
    }

  @override
  void onInit() {
    userCollection = firestore.collection('User');
    super.onInit();
  }

  addUser() {
    try {
      if(otpSend == otpEntered) {
        DocumentReference doc = userCollection.doc();
        User user = User(
          id: doc.id,
          name: registername.text,
          number: int.parse(registernumber.text),
          password: password.text,

        );
        final userJson = user.toJson();
        doc.set(userJson);
        Get.snackbar(
            'Success', 'User added successfully', colorText: Colors.green,duration: Duration(seconds: 1));
        registername.clear();
        registernumber.clear();
        otpContoller.clear();
        password.clear();
      }else{
        Get.snackbar('Error','OTP is incorrct' ,colorText: Colors.red,duration: Duration(seconds: 1));
      }
    } catch(e){
      Get.snackbar('Error','Please fill the fields' ,colorText: Colors.red,duration: Duration(seconds: 1));
      print(e);
    }
    }

  sendOTP(){
    try {
      if(registername.text.isEmpty || registernumber.text.isEmpty || password.text.isEmpty){
        Get.snackbar('Error', 'Fill the fields', colorText: Colors.red,duration: Duration(seconds: 1));
        return;
      }
      final random = Random();
      int otp = 1000 + random.nextInt(9000);
      print(otp);
      if (otp != null) {
        otpFieldShown = true;
        otpSend=otp;
        Get.snackbar(
            'Success', 'OTP sent successfully', colorText: Colors.green,duration: Duration(seconds: 1));
        print(e);
      } else {
        Get.snackbar('Error', 'OTP not found', colorText: Colors.red,duration: Duration(seconds: 1));
      }
    }catch (e){
      print(e);
    }finally{
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
            box.write('Login User', userData);
            loginnumber.clear();
            password.clear();
            Get.to(HomePage());
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
