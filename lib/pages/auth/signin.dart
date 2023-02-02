import 'package:flutter/material.dart';
import 'package:flutter_acrylic/window.dart';
import 'package:flutter_acrylic/window_effect.dart';
import 'package:glass/glass.dart';
import 'package:google_fonts/google_fonts.dart';

class Signin extends StatelessWidget {
  Signin({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final Color primary = const Color.fromARGB(255, 0, 0, 77);
  final Color dark = const Color.fromARGB(156, 0, 0, 17);

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
            padding: const EdgeInsets.all(36),
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign in',
                    style: GoogleFonts.roboto(color: primary, fontSize: 24),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Login to your account',
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
                                child: TextField(
                                    maxLines: 1,
                                    style: GoogleFonts.lora(
                                        color: dark, fontSize: 14),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      prefixIcon: Icon(
                                        Icons.person_outline_sharp,
                                        color: dark,
                                      ),
                                      labelText: 'Email',
                                      hintText: 'email@email.com',
                                      hintStyle:
                                          TextStyle(color: dark, fontSize: 14),
                                      labelStyle:
                                          TextStyle(color: dark, fontSize: 14),
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          128, 255, 255, 255),
                                      border: const OutlineInputBorder(
                                          gapPadding: 0),
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
                                child: TextField(
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
                                      fillColor: const Color.fromARGB(
                                          128, 255, 255, 255),
                                      border: const OutlineInputBorder(
                                          gapPadding: 0),
                                    )))),
                        Padding(
                            padding: const EdgeInsets.only(top: 10),
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
                            padding: const EdgeInsets.only(top: 10),
                            child: TextButton(
                              onPressed: () {},
                              child: Text.rich(
                                TextSpan(
                                    text: 'Dont Have An Account',
                                    style: TextStyle(color: dark),
                                    children: const [
                                      TextSpan(
                                          text: ' SIGN UP',
                                          style: TextStyle(
                                              color: Colors.blueAccent))
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
