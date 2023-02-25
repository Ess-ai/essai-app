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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Row(children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    ' essai',
                    style: GoogleFonts.lobsterTwo(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
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
                    child: Text('Docs',
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
            child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 245, 246, 250)),
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    TextButton(
                        onPressed: (() {}),
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(12)),
                        child: Row(
                          children: [
                            const Icon(
                              Iconsax.activity,
                              size: 20,
                              color: Colors.black,
                              shadows: [Shadow(color: Colors.black)],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Dashboard',
                              style: GoogleFonts.ptSans(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                    TextButton(
                        onPressed: (() {}),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Iconsax.paperclip,
                              size: 20,
                              color: Colors.black,
                              shadows: [Shadow(color: Colors.black)],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Essays',
                              style: GoogleFonts.ptSans(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                    TextButton(
                        onPressed: (() {}),
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(12)),
                        child: Row(
                          children: [
                            const Icon(
                              Iconsax.calculator,
                              size: 20,
                              color: Colors.black,
                              shadows: [Shadow(color: Colors.black)],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Tools',
                              style: GoogleFonts.ptSans(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                    TextButton(
                        onPressed: (() {}),
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(12)),
                        child: Row(
                          children: [
                            const Icon(
                              Iconsax.support,
                              size: 20,
                              color: Colors.black,
                              shadows: [Shadow(color: Colors.black)],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Tips',
                              style: GoogleFonts.ptSans(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                    TextButton(
                        onPressed: (() {}),
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(12)),
                        child: Row(
                          children: [
                            const Icon(
                              Iconsax.setting,
                              size: 20,
                              color: Colors.black,
                              shadows: [Shadow(color: Colors.black)],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Settings',
                              style: GoogleFonts.ptSans(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(color: const Color.fromARGB(255, 238, 242, 251)),
            )
          ],
        ))
      ],
    ));
  }
}
