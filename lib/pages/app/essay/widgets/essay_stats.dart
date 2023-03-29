import 'package:essai/models/essay.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../services/get_essays.dart';

// ignore: must_be_immutable
class EssayStats extends StatefulWidget {
  EssayStats({Key? key, this.essay}) : super(key: key);
  EssayModel? essay;

  @override
  EssayStatsState createState() => EssayStatsState();
}

class EssayStatsState extends State<EssayStats> {
  final getEssays = GetEssays();
  Future<List> getScores(id) async {
    final scr = await getEssays.getEssayResult(id);
    setState(() {
      score = scr.score;
      grade = scr.grade;
      reasons = scr.reasons;
      improvement = scr.improvements;
    });
    return [scr.score, scr.grade];
  }

  var score = '0';
  var grade = '';
  var reasons = '';
  var improvement = '';

  Widget remarksImprovement(wid, mess) {
    return Container(
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
                wid == 'reasoms'
                    ? 'Teacher Remarks'
                    : 'Where you should Improve on',
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
                mess,
                textAlign: TextAlign.left,
                style: GoogleFonts.ptSans(color: Colors.black, fontSize: 12),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var essay = widget.essay;
    if (essay!.isSubmitted != null) {
      getScores(essay.id);
    }
    return Expanded(
      flex: 2,
      child: Container(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            children: [
              //Score
              //Marks
              Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 0.5, color: Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Score:',
                        style: GoogleFonts.ptSans(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        essay.isSubmitted == null
                            ? 'Not Submitted'
                            : score.toString(),
                        style: GoogleFonts.ptSans(
                            fontSize: 18,
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              const SizedBox(height: 8),

              //Grade
              Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 0.5, color: Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Grade:',
                        style: GoogleFonts.ptSans(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        essay.isSubmitted == null ? 'Not Submitted' : grade,
                        style: GoogleFonts.ptSans(
                            fontSize: 18,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              const SizedBox(height: 8),

              //Words
              Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 0.5, color: Colors.grey)),
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
                  )),
              const SizedBox(height: 8),

              //Characters
              Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 0.5, color: Colors.grey)),
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
                      )
                    ],
                  )),

              //Reasons
              essay.isSubmitted == null
                  ? Container()
                  : remarksImprovement('reasons', reasons),

              //Improvements
              essay.isSubmitted == null
                  ? Container()
                  : remarksImprovement('impr', improvement)
            ],
          )),
    );
  }
}
