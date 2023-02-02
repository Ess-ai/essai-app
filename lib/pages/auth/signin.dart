import 'package:flutter/material.dart';
import 'package:flutter_acrylic/window.dart';
import 'package:flutter_acrylic/window_effect.dart';
import 'package:glass/glass.dart';
import 'package:google_fonts/google_fonts.dart';

class Signin extends StatelessWidget {
  Signin({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(children: [
        Expanded(
            flex: 2,
            child: Container(
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
            ]))),
        Expanded(
          child: Container(
            color: const Color.fromARGB(122, 0, 0, 0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome Back',
                    style: GoogleFonts.lora(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 36, right: 36),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)),
                                child: TextField(
                                    style:
                                        GoogleFonts.lora(color: Colors.white),
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person_outline_sharp,
                                        color: Colors.white,
                                      ),
                                      labelText: 'Email',
                                      hintText: 'email@email.com',
                                      hintStyle: TextStyle(color: Colors.white),
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(128, 255, 255, 255),
                                      border: OutlineInputBorder(),
                                    )))),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 36, right: 36),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)),
                                child: TextField(
                                    style:
                                        GoogleFonts.lora(color: Colors.white),
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.fingerprint_outlined,
                                        color: Colors.white,
                                      ),
                                      labelText: 'Password',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      hintText: '********',
                                      hintStyle: TextStyle(color: Colors.white),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(128, 255, 255, 255),
                                      border: OutlineInputBorder(),
                                    )))),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 36, right: 36),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)),
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: Container(
                                        padding: const EdgeInsets.all(12),
                                        color: const Color.fromARGB(
                                            122, 68, 137, 255),
                                        width: double.infinity,
                                        child: const Text(
                                          'SIGN IN',
                                          textAlign: TextAlign.center,
                                        ))))),
                        Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextButton(
                              onPressed: () {},
                              child: const Text.rich(
                                TextSpan(
                                    text: 'Dont Have An Account',
                                    children: [
                                      TextSpan(
                                          text: ' SIGN UP',
                                          style: TextStyle(color: Colors.white))
                                    ]),
                              ),
                            )),
                      ],
                    ),
                  )
                ]),
          ).asGlass(),
        ),
      ]),
    );
  }
}
