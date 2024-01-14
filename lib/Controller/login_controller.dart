import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/model/User/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

class LoginController extends GetxController{

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;

  TextEditingController registername = TextEditingController();
  TextEditingController registernumber = TextEditingController();
  TextEditingController loginnumber = TextEditingController();

  OtpFieldControllerV2 otpContoller = OtpFieldControllerV2();
  bool otpFieldShown = false;
  int? otpSend ;
  int? otpEntered;
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

        );
        final userJson = user.toJson();
        doc.set(userJson);
        Get.snackbar(
            'Success', 'User added successfully', colorText: Colors.green);
        registername.clear();
        registernumber.clear();
        otpContoller.clear();
      }else{
        Get.snackbar('Error','OTP is incorrct' ,colorText: Colors.red);
      }
    } catch(e){
      Get.snackbar('Error','Please fill the fields' ,colorText: Colors.red);
      print(e);
    }
    }

  sendOTP(){
    try {
      if(registername.text.isEmpty || registernumber.text.isEmpty){
        Get.snackbar('Error', 'Fill the fields', colorText: Colors.red);
        return;
      }
      final random = Random();
      int otp = 1000 + random.nextInt(9000);
      print(otp);
      if (otp != null) {
        otpFieldShown = true;
        otpSend=otp;
        Get.snackbar(
            'Success', 'OTP sent successfully', colorText: Colors.green);
        print(e);
      } else {
        Get.snackbar('Error', 'OTP not found', colorText: Colors.red);
      }
    }catch (e){
      print(e);
    }finally{
      update();
    }
  }
  
  Future<void> LoginWithPhone()async{
    try{
        String phonenumber = loginnumber.text;
      if (phonenumber.isEmpty){
        var querSnapshot = await userCollection.where('phone', isEqualTo: int.tryParse(phonenumber)).limit(1).get();
        if (querSnapshot.docs.isNotEmpty) {
          var userDoc = querSnapshot.docs.first;
          var userData = userDoc.data() as Map<String, dynamic>;
    Get.snackbar('Success','Login Success', colorText: Colors.green);
    }
    }else{
    Get.snackbar('Error','User Not Found Please Registter', colorText: Colors.red);
    }

    }catch(error){
      print('Failed to Login : $error');
      Get.snackbar('Error', 'Failed to Login',colorText: Colors.red);

    }
    
  }

}