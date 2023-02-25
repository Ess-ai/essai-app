import 'package:essai/pages/app/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/glass.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final Color primary = const Color.fromARGB(255, 0, 0, 77);
  final Color dark = const Color.fromARGB(156, 0, 0, 17);

  bool valuefirst = false;
  bool valuesecond = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(children: [
        Expanded(
            child: Stack(children: [
          Container(
            alignment: Alignment.topLeft,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/quest.jpg'),
                    fit: BoxFit.cover)),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(122, 33, 149, 243),
                Color.fromARGB(122, 68, 137, 255)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(48),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Essai',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Blanka',
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Text(
                    'Think Differently',
                    style: GoogleFonts.lora(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700),
                  ),
                  const Spacer(),
                  Text(
                    "'If you can THINK, SPEAK and WRITE you are absolutely DEADLY.'\nDr. Jordan B. Peterson",
                    style: GoogleFonts.lora(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'About',
                            style: GoogleFonts.lora(color: Colors.white),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Services',
                            style: GoogleFonts.lora(color: Colors.white),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Rate Us',
                            style: GoogleFonts.lora(color: Colors.white),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Feedback',
                            style: GoogleFonts.lora(color: Colors.white),
                          )),
                    ],
                  )
                ]),
          )
        ])),
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(36),
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                      key: _formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 20),
                                    Text(
                                      'First Name',
                                      style: GoogleFonts.roboto(
                                          color: dark, fontSize: 14),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.285,
                                      height: 40,
                                      child: const TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Enter a search term',
                                            hintStyle: TextStyle(fontSize: 14)),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      'Phone Number',
                                      style: GoogleFonts.roboto(
                                          color: dark, fontSize: 14),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.285,
                                      height: 40,
                                      child: const TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Enter a search term',
                                            hintStyle: TextStyle(fontSize: 14)),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      'Password',
                                      style: GoogleFonts.roboto(
                                          color: dark, fontSize: 14),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.285,
                                      height: 40,
                                      child: const TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Enter a search term',
                                            hintStyle: TextStyle(fontSize: 14)),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 20),
                                    Text(
                                      'Last Name',
                                      style: GoogleFonts.roboto(
                                          color: dark, fontSize: 14),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.285,
                                      height: 40,
                                      child: const TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Enter a search term',
                                            hintStyle: TextStyle(fontSize: 14)),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      'Email',
                                      style: GoogleFonts.roboto(
                                          color: dark, fontSize: 14),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.285,
                                      height: 40,
                                      child: const TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Enter a search term',
                                            hintStyle: TextStyle(fontSize: 14)),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      'Confirm Password',
                                      style: GoogleFonts.roboto(
                                          color: dark, fontSize: 14),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.285,
                                      height: 40,
                                      child: const TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Enter a search term',
                                            hintStyle: TextStyle(fontSize: 14)),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Checkbox(
                                    value: valuefirst,
                                    onChanged: (value) {
                                      valuefirst = value!;
                                    }),
                                Text(
                                  'I agree with the Terms and Conditions',
                                  style: GoogleFonts.roboto(
                                      color: dark, fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.1,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)),
                                child: ElevatedButton(
                                    onPressed: () {
                                      Get.to(Dashboard());
                                    },
                                    child: Container(
                                        padding: const EdgeInsets.all(12),
                                        color: const Color.fromARGB(
                                            122, 68, 137, 255),
                                        width: double.infinity,
                                        child: const Text(
                                          'SIGN UP',
                                          textAlign: TextAlign.center,
                                        )))),
                            const SizedBox(height: 10),
                            TextButton(
                              onPressed: () {
                                Get.to(Signup());
                              },
                              child: Text.rich(
                                TextSpan(
                                    text: 'Already Have An Account',
                                    style: TextStyle(color: dark),
                                    children: const [
                                      TextSpan(
                                          text: ' SIGN IN',
                                          style: TextStyle(
                                              color: Colors.blueAccent))
                                    ]),
                              ),
                            ),
                          ]))
                ]),
          ).asGlass(),
        ),
      ]),
    );
  }
}
