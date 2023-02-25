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
          color: const Color.fromARGB(255, 238, 242, 251),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  child: const Image(
                    image: AssetImage('assets/images/logo.png'),
                    height: 40,
                  ),
                ),
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
              const CircleAvatar(
                radius: 15,
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(top: 50, left: 200, right: 300),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '👋 Hi, $user',
                  style: GoogleFonts.ptSans(
                      fontSize: 26, fontWeight: FontWeight.bold),
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
                    Container(
                        padding: const EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 0.5, color: Colors.grey)),
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
                                'Document Marker',
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
                                'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.ptSans(
                                    color: Colors.black, fontSize: 12),
                              ),
                            ],
                          ),
                        )),
                    Container(
                        padding: const EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 0.5, color: Colors.grey)),
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
                                'Document Marker',
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
                                'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.ptSans(
                                    color: Colors.black, fontSize: 12),
                              ),
                            ],
                          ),
                        )),
                    Container(
                        padding: const EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 0.5, color: Colors.grey)),
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
                                'Document Marker',
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
                                'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.ptSans(
                                    color: Colors.black, fontSize: 12),
                              ),
                            ],
                          ),
                        )),
                    Container(
                        padding: const EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 0.5, color: Colors.grey)),
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
                                'Document Marker',
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
                                'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.ptSans(
                                    color: Colors.black, fontSize: 12),
                              ),
                            ],
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
