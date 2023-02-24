import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
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
                            ))),
                    const SizedBox(width: 5),
                    TextButton(
                        onPressed: () {},
                        child: Text('Docs',
                            style: GoogleFonts.ptSans(
                              fontSize: 20,
                              color: Colors.black,
                            ))),
                    const SizedBox(width: 5),
                    TextButton(
                        onPressed: () {},
                        child: Text('Support',
                            style: GoogleFonts.ptSans(
                              fontSize: 20,
                              color: Colors.black,
                            ))),
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
              padding: const EdgeInsets.all(10),
            ))
          ],
        ));
  }
}
