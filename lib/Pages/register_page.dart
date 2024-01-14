import 'package:delivery_app/Controller/login_controller.dart';
import 'package:delivery_app/Pages/login_page.dart';
import 'package:delivery_app/Widgets/otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (ctrl) {
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.blueGrey[50]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create Your Account!',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.phone,
                controller: ctrl.registername,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Name',
                    hintText: 'Enter Your Name'),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.phone,
                controller: ctrl.registernumber,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.phone_android),
                    labelText: 'Mobile Number',
                    hintText: 'Enter Your Mobile number'),
              ),
              SizedBox(height: 20),
              OtpTextField(otpController:ctrl.otpContoller, vivisble: ctrl.otpFieldShown, onComplete: (otp ) { ctrl.otpEntered = int.tryParse(otp ?? '0000'); },  ),
              SizedBox(height: 20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.deepPurple,
                  ),
                  onPressed: () {
                    if (ctrl.otpFieldShown){
                      ctrl.addUser();
                    }else {
                      ctrl.sendOTP();
                    }
                  },
                  child: Text(ctrl.otpFieldShown ? 'Register' : 'Send OTP')),
              SizedBox(height: 10),
              TextButton(
                  onPressed: () {
                    Get.to(Login());
                  },
                  child: Text('Login')
              ),
            ],
          ),
        ),
      );
    });
  }
}
