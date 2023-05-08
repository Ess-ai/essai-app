import 'package:essai/models/essay.dart';
import 'package:essai/models/essay_results.dart';
import 'package:essai/services/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final services = Services();
// ignore: must_be_immutable
Widget essayStats(EssayModel essay) {
  bool isSubmitted = essay.isSubmitted == null ? false : true;
  if (!isSubmitted) {
    return Expanded(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          children: [
            //Words
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 0.5,
                  color: Colors.grey,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Words:',
                    style: GoogleFonts.ptSans(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${essay.essayBody!.split(' ').length}',
                    style: GoogleFonts.ptSans(
                        fontSize: 18,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 0.5,
                  color: Colors.grey,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Score:',
                    style: GoogleFonts.ptSans(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Not Submitted',
                    style: GoogleFonts.ptSans(
                      fontSize: 18,
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  } else {
    return FutureBuilder(
      future: services.essayServices.getEssayResults(essay.id.toString()),
      builder: ((context, snapshot) {
        if (snapshot.data.runtimeType == EssayResultsModel) {
          EssayResultsModel results = snapshot.data;
          return Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Score:',
                          style: GoogleFonts.ptSans(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          results.score.toString(),
                          style: GoogleFonts.ptSans(
                            fontSize: 18,
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reasons:',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.ptSans(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            results.reasons.toString(),
                            textAlign: TextAlign.left,
                            style: GoogleFonts.ptSans(
                                color: Colors.black, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Where you should Improve on:',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.ptSans(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            results.improvements.toString(),
                            textAlign: TextAlign.left,
                            style: GoogleFonts.ptSans(
                                color: Colors.black, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //Words
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Words:',
                          style: GoogleFonts.ptSans(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${essay.essayBody!.split(' ').length}',
                          style: GoogleFonts.ptSans(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),

                  //Characters
                  Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Characters:',
                            style: GoogleFonts.ptSans(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${essay.essayBody!.characters.length}',
                            style: GoogleFonts.ptSans(
                                fontSize: 18,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
