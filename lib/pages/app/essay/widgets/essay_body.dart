import 'package:essai/models/essay.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EssayDisplay extends StatelessWidget {
  final EssayModel essay;
  const EssayDisplay({Key? key, required this.essay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Essay Content
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
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
                      //Essay Title
                      Row(
                        children: [
                          Expanded(
                            flex: 10,
                            child: Text(
                              '${essay.essayTitle}',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.ptSans(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Expanded(
                            flex: 2,
                            child: Text(
                              '${essay.essayBody!.split(' ').length} words',
                              style: GoogleFonts.ptSans(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 2,
                            child: Text(
                              '${essay.essayBody!.characters.length} Chars',
                              style: GoogleFonts.ptSans(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      //Essay Body
                      Text(
                        '${essay.essayBody}',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.ptSans(
                            color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
