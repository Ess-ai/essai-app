import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../essay/essay.dart';

class RecentEssays extends StatefulWidget {
  const RecentEssays({Key? key}) : super(key: key);

  @override
  RecentEssaysState createState() => RecentEssaysState();
}

class RecentEssaysState extends State<RecentEssays> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Get.to(const Essay());
              },
              style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
              child: Container(
                  width: width >= 840 ? width * 0.2 : width * 0.4,
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
                        Text(
                          'Plastic be Banned',
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
                          'Plastic bags are a major cause of environmental pollution. Plastic as a substance is non-biodegradable and thus plastic bags remain in the environment for hundreds of years polluting it immensely.',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.ptSans(
                              color: Colors.black, fontSize: 12),
                        ),
                      ],
                    ),
                  )),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
              child: Container(
                  width: width >= 840 ? width * 0.2 : width * 0.4,
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
                        Text(
                          'Wonder of Science',
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
                          'Looking at the age when a man led a life like a savage, we notice how far we have come. Similarly, the evolution of mankind is truly commendable. One of the major driving forces behind this is science.',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.ptSans(
                              color: Colors.black, fontSize: 12),
                        ),
                      ],
                    ),
                  )),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
          ],
        ));
  }
}
