import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../essay/essay.dart';

class RecentEssays extends StatefulWidget {
  final List? essays;
  const RecentEssays({super.key, this.essays});

  @override
  RecentEssaysState createState() => RecentEssaysState();
}

class RecentEssaysState extends State<RecentEssays> {
  @override
  Widget build(BuildContext context) {
    List? essays = widget.essays!;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (essays.isEmpty) ...[
              for (int x = 0; x < 5; x++) ...[
                Container(
                    width: width >= 840 ? width * 0.2 : width * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 0.5, color: Colors.grey)),
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(2),
                    child: const CardLoading(
                      height: 140,
                      cardLoadingTheme: CardLoadingTheme(
                          colorOne: Color.fromARGB(255, 240, 240, 240),
                          colorTwo: Color.fromARGB(255, 236, 235, 235)),
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                )
              ]
            ],
            for (int x = 0; x < essays.length; x++) ...[
              TextButton(
                onPressed: () {
                  Get.to(Essay(
                    essay: essays[x],
                  ));
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
                            '${essays[x].essayTitle}',
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
                            '${essays[x].essayBody!.substring(0, 197)}',
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
              )
            ]
          ],
        ));
  }
}
