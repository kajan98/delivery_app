import 'package:delivery_app/Controller/controller.dart';
import 'package:delivery_app/Screens/login_page.dart';
import 'package:delivery_app/Widgets/otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class resetpassword extends StatefulWidget {
  const resetpassword({super.key});

  @override
  State<resetpassword> createState() => _resetpasswordState();
}

class _resetpasswordState extends State<resetpassword> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(builder: (ctrl) {
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.blueGrey[50]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Reset your Password',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
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
                    hintText: '07********'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: ctrl.password,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'New Password',
                  hintText: 'Enter Your New Password',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    child: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              OtpTextField(otpController:ctrl.otpContoller, vivisble: ctrl.otpFieldShown, onComplete: (otp ) { ctrl.otpEntered = int.tryParse(otp ?? '0000'); },  ),
              SizedBox(height: 20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    if (ctrl.otpFieldShown){
                      ctrl.addUser();
                    }else {
                      ctrl.sendOTPForResetPassword();
                    }
                  },
                  child: Text(ctrl.otpFieldShown ? 'Reset Password' : 'Send OTP')),
              SizedBox(height: 10),
              TextButton(
                  onPressed: () {
                    Get.to(Login());
                  },
                  child: Text('Login',style: TextStyle(color: Colors.black),)
              ),
            ],
          ),
        ),
      );
    });
  }
}


