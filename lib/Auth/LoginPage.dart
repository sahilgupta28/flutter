import 'package:demo/Components/Form/ButtonTextType.dart';
import 'package:demo/Components/Form/InputField.dart';
import 'package:demo/common/CommonColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/AuthController.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('public/images/register.png'), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                    const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: WelcomeBack()
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.1,
                            left: MediaQuery.of(context).size.width * 0.1,
                            right: MediaQuery.of(context).size.width * 0.1
                        ),
                        child: LoginForm()
                    )
                ]
              ),
            )
          ),
      )
    );
  }
}

class LoginForm extends StatefulWidget {
  LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool tnc = false;
  bool otpVisible = false;

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Column(
      children: [
         InputField(
          label: 'ISD Code',
          radius: 10,
          fillColor: white,
          filled: true,
          controller:  authController.codeController,

        ),
        const SizedBox(
          height: 20,
        ),
         InputField(
          label: 'Phone',
          radius: 10,
          fillColor: white,
          filled: true,
          controller: authController.phoneNumberController,
        ),
        const SizedBox(
          height: 20,
        ),
         Visibility(
          visible: otpVisible,
          child: InputField(
            label: 'OTP',
            radius: 10,
            fillColor: white,
            filled: true,
            controller: authController.OTPController,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
            children: [
              Checkbox(
                  value: tnc,
                  side: const BorderSide(color: white),
                  checkColor: blue,
                  activeColor: white,
                  onChanged: (value) {
                    setState(() {
                      tnc = value ?? false;
                    });
                  }),
              const Text('Term and conditions', style: TextStyle(
                color: white
              ),)
          ]
        ),
        Visibility(
        visible: !otpVisible,
        child: Button(
           label: 'Send OTP',
           size: 25,
           color: white,
           weight: FontWeight.w700,
           callBack: () {
            authController.sendOtpApi(
                {
                  "phone":authController.phoneNumberController.text.trim().toString(),
                  "isd_code":authController.codeController.text.trim().toString()
                }
                ).then((value) {
                  setState(() {
                    otpVisible = value ?? false;
                  });
            });
            },
         )
        ),
        Visibility(
        visible: otpVisible,
        child: Button(
              label: 'Login',
              size: 25,
              color: white,
              weight: FontWeight.w700,
              callBack: () {
                authController.LoginApi(
                    {
                      "phone":authController.phoneNumberController.text.trim().toString(),
                      "isd_code":authController.codeController.text.trim().toString(),
                      "otp":authController.OTPController.text.trim().toString(),
                      "device_name":"android"
                    }
                ).then((value) {
                    Navigator.pushReplacementNamed(context, 'welcome');
                });
              },
            )
        )
      ]
    );
  }
}



class WelcomeBack extends StatelessWidget {
  const WelcomeBack({super.key});
  @override
  Widget build(BuildContext context) {
    return const  Align(
      alignment: Alignment.topCenter,
      child: Text("Welcome \n Back",
        style: TextStyle(
          fontSize: 50,
          color: white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
