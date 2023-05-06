import 'package:essai/models/essay.dart';
import 'package:essai/pages/app/essay/widgets/essay_buttons.dart';
import 'package:essai/pages/app/essay/widgets/essay_stats.dart';
import 'package:essai/pages/app/navigation/footer.dart';
import 'package:essai/pages/app/navigation/header.dart';
import 'package:essai/services/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class Essay extends StatefulWidget {
  EssayModel essay;
  Essay({Key? key, required this.essay}) : super(key: key);

  @override
  EssayState createState() => EssayState();
}

class EssayState extends State<Essay> {
  final services = Services();

  bool _isMarking = false;

  get markessay => markingEssay;

  Future markingEssay() async {
    var essay = widget.essay;
    setState(() => _isMarking = true);
    final res = await services.aiService.markEssay(
      essay,
      'General Essay Rubric',
    );
    final ess = await services.essayServices.getEssay(res);

    setState(() {
      widget.essay = ess;
      _isMarking = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var essay = widget.essay;
    double width = MediaQuery.of(context).size.width;
    var padding = width * 0.05;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //Header
          const Header(),

          //Body
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(
                  top: 30,
                  left: padding,
                  right: padding,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Recent Essays Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            essay.essayTitle.toString(),
                            style: GoogleFonts.ptSans(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Spacer(),
                        width >= 650
                            ? EssayActionButtons(
                                essay: widget.essay,
                              )
                            : Container(),
                      ],
                    ),

                    width >= 650
                        ? Container()
                        : Container(
                            padding: const EdgeInsets.only(top: 10),
                            child: EssayActionButtons(
                              essay: widget.essay,
                            ),
                          ),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),

                    //Essay Body
                    _isMarking
                        ? Column(
                            children: [
                              Center(
                                child: Lottie.asset(
                                  'assets/resources/downloading.json',
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Your essay is being marked\nYou will get your results Shortly',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.ptSans(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Essay Content
                                  Expanded(
                                    flex: 4,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //Essay Title
                                            Text(
                                              '${essay.essayTitle}',
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

                                            //Essay Body
                                            Text(
                                              '${essay.essayBody}',
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.ptSans(
                                                  color: Colors.black,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  //Essay Stats
                                  width >= 650
                                      ? EssayStats(essay: widget.essay)
                                      : Container(),
                                ],
                              ),
                            ],
                          ),

                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),

                    //Footer
                    const Footer(),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
