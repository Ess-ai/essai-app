import 'package:essai/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../signin.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  SignupFormState createState() => SignupFormState();
}

class SignupFormState extends State<SignupForm> {
  final controller = Get.put(SignUpController());

  @override
  void dispose() {
    super.dispose();
  }

  final Color primary = const Color.fromARGB(255, 0, 0, 77);
  final Color dark = const Color.fromARGB(156, 0, 0, 17);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(36),
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Essai',
                style: TextStyle(
                    color: Colors.blue.shade900,
                    fontFamily: 'Blanka',
                    fontSize: 30)),
            const SizedBox(height: 25),
            Text(
              'Sign Up',
              style: GoogleFonts.roboto(color: primary, fontSize: 24),
            ),
            const SizedBox(height: 40),
            Text(
              'Register | Join Us',
              style: GoogleFonts.roboto(color: primary, fontSize: 18),
            ),
            Text(
              'Welcome back to essai, Let as make you deadly by teaching you to write | speak | think',
              style: GoogleFonts.roboto(color: dark, fontSize: 14),
            ),
            Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Email',
                    style: GoogleFonts.roboto(color: dark, fontSize: 14),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 10),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: TextFormField(
                              controller: controller.email,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Email';
                                }
                                controller.validateEmail(value);
                                return null;
                              },
                              maxLines: 1,
                              style:
                                  GoogleFonts.lora(color: dark, fontSize: 14),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                prefixIcon: Icon(
                                  Icons.person_outline_sharp,
                                  color: dark,
                                ),
                                labelText: 'Email',
                                hintText: 'email@email.com',
                                hintStyle: TextStyle(color: dark, fontSize: 14),
                                labelStyle:
                                    TextStyle(color: dark, fontSize: 14),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(128, 255, 255, 255),
                                border: const OutlineInputBorder(gapPadding: 0),
                              )))),
                  const SizedBox(height: 10),
                  Text(
                    'Password',
                    style: GoogleFonts.roboto(color: dark, fontSize: 14),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 10),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: TextFormField(
                              controller: controller.password,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Password';
                                }
                                if (value.length < 6) {
                                  return 'Password must have more than 6 characters';
                                }
                                return null;
                              },
                              style: GoogleFonts.lora(color: dark),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                prefixIcon: Icon(
                                  Icons.fingerprint_outlined,
                                  color: dark,
                                ),
                                labelText: 'Password',
                                labelStyle: TextStyle(color: dark),
                                hintText: '********',
                                hintStyle: TextStyle(color: dark),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(128, 255, 255, 255),
                                border: const OutlineInputBorder(gapPadding: 0),
                              )))),
                  Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: ElevatedButton(
                              onPressed: () {
                                controller.register(controller.email.text,
                                    controller.password.text, context);
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(12),
                                  color:
                                      const Color.fromARGB(122, 68, 137, 255),
                                  width: double.infinity,
                                  child: const Text(
                                    'SIGN UP',
                                    textAlign: TextAlign.center,
                                  ))))),
                  Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextButton(
                        onPressed: () {
                          Get.to(const Signin());
                        },
                        child: Text.rich(
                          TextSpan(
                              text: 'Have An Account',
                              style: TextStyle(color: dark),
                              children: const [
                                TextSpan(
                                    text: ' SIGN IN',
                                    style: TextStyle(color: Colors.blueAccent))
                              ]),
                        ),
                      )),
                ],
              ),
            )
          ]),
    );
  }
}
