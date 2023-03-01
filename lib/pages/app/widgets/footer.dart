import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Copyright © 2023\nAudRead',
        textAlign: TextAlign.center,
        style: GoogleFonts.ptSans(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
