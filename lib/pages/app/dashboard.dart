import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List menu = ['DashBoard', 'Essays', 'Tools'];
  final String user = 'Joe';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.only(left: 200, right: 200, top: 20),
          child: Row(
            children: [
              Row(children: [
                TextButton(
                    onPressed: () {},
                    child: const Text('essai',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Blanka',
                            fontSize: 30))),
                const SizedBox(width: 20),
                TextButton(
                    onPressed: () {},
                    child: Text('Dashboard',
                        style: GoogleFonts.ptSans(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold))),
                const SizedBox(width: 15),
                TextButton(
                    onPressed: () {},
                    child: Text('Essays',
                        style: GoogleFonts.ptSans(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold))),
                const SizedBox(width: 15),
                TextButton(
                    onPressed: () {},
                    child: Text('Tools',
                        style: GoogleFonts.ptSans(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold))),
                const SizedBox(width: 15),
                TextButton(
                    onPressed: () {},
                    child: Text('Support',
                        style: GoogleFonts.ptSans(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold))),
              ]),
              const Spacer(),
              const CircleAvatar(
                radius: 15,
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(top: 50, left: 200, right: 200),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '👋 Hi There, $user',
                  style: GoogleFonts.ptSans(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back',
                        style: GoogleFonts.ptSans(
                            color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                        style:
                            GoogleFonts.lora(color: Colors.white, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.all(5)),
                            child: Text(
                              'Get Started',
                              style: GoogleFonts.lora(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 14),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'CONTINUE',
                              style: GoogleFonts.lora(
                                  color: Colors.white, fontSize: 14),
                            ))
                      ])
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Tools',
                      style: GoogleFonts.ptSans(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('View All'),
                            SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Iconsax.arrow_right,
                              size: 20,
                            )
                          ],
                        ))
                  ],
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0)),
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(width: 0.5, color: Colors.grey)),
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.topLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Iconsax.scan,
                                  size: 30,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Document Scanner',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.ptSans(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'No need to Type your essay, Just Scan with your camera.',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.ptSans(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ],
                            ),
                          )),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0)),
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(width: 0.5, color: Colors.grey)),
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.topLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Iconsax.document,
                                  size: 30,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'File Marker',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.ptSans(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Upload your typed essay from multiple formats e.g docs, img',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.ptSans(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ],
                            ),
                          )),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0)),
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(width: 0.5, color: Colors.grey)),
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.topLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Iconsax.pen_add,
                                  size: 30,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Write',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.ptSans(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Write or paste your essay here with our writing tool',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.ptSans(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ],
                            ),
                          )),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0)),
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(width: 0.5, color: Colors.grey)),
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.topLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Iconsax.d_cube_scan,
                                  size: 30,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Essay Zone',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.ptSans(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Get Essay Prompts and even generate or get essay samples.',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.ptSans(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
