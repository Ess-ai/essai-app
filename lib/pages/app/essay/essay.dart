import 'package:essai/models/essay.dart';
import 'package:essai/pages/app/essay/essay_edit.dart';
import 'package:essai/pages/app/essay/widgets/essay_stats.dart';
import 'package:essai/pages/app/navigation/footer.dart';
import 'package:essai/pages/app/navigation/header.dart';
import 'package:essai/services/get_essays.dart';
import 'package:essai/services/mark_essay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../services/delete_essay.dart';
import '../widgets/snack_message.dart';
import 'all_essays.dart';

// ignore: must_be_immutable
class Essay extends StatefulWidget {
  EssayModel essay;
  Essay({Key? key, required this.essay}) : super(key: key);

  @override
  EssayState createState() => EssayState();
}

class EssayState extends State<Essay> {
  final getEssays = GetEssays();
  final delEssay = EssayDelete();
  final markEssay = MarkEssay();

  bool _isMarking = false;

  get markessay => markingEssay;

  Future markingEssay() async {
    var essay = widget.essay;
    setState(() => _isMarking = true);
    final res = await markEssay.markEssay(essay);
    final ess = await getEssays.getEssay(res);

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
                          top: 30, left: padding, right: padding),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Recent Essays Title
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  essay.essayTitle.toString(),
                                  style: GoogleFonts.ptSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                width >= 650 ? essayButtons() : Container(),
                              ],
                            ),

                            width >= 650
                                ? Container()
                                : Container(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: essayButtons()),
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
                                              'assets/resources/downloading.json')),
                                      Center(
                                          child: Text(
                                        'Your essay is being marked\nYou will get your results Shortly',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.ptSans(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ],
                                  )
                                : Column(children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //Essay Content
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        width: 0.5,
                                                        color: Colors.grey)),
                                                alignment: Alignment.topLeft,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  alignment: Alignment.topLeft,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      //Essay Title
                                                      Text(
                                                        '${essay.essayTitle}',
                                                        textAlign:
                                                            TextAlign.left,
                                                        style:
                                                            GoogleFonts.ptSans(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),

                                                      //Essay Body
                                                      Text(
                                                        '${essay.essayBody}',
                                                        textAlign:
                                                            TextAlign.left,
                                                        style:
                                                            GoogleFonts.ptSans(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 14),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                          ),

                                          //Essay Stats
                                          width >= 650
                                              ? EssayStats(essay: widget.essay)
                                              : Container(),
                                        ])
                                  ]),

                            const Divider(),
                            const SizedBox(
                              height: 20,
                            ),

                            //Footer
                            const Footer(),
                            const SizedBox(
                              height: 10,
                            ),
                          ])))),
        ],
      ),
    );
  }

  Widget essayButtons() {
    return Row(children: [
      //Edit Essay Button
      OutlinedButton(
          onPressed: () {
            Get.to(EditEssay(essay: widget.essay));
          },
          style: OutlinedButton.styleFrom(foregroundColor: Colors.blue),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Edit'),
              SizedBox(
                width: 15,
              ),
              Icon(
                Iconsax.edit,
                size: 20,
              )
            ],
          )),
      const SizedBox(width: 10),

      //Submit Essay Button
      OutlinedButton(
          onPressed: () {
            markingEssay();
          },
          style: OutlinedButton.styleFrom(foregroundColor: Colors.green),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Submit'),
              SizedBox(
                width: 15,
              ),
              Icon(
                Iconsax.document_upload,
                size: 20,
              )
            ],
          )),
      const SizedBox(width: 10),

      //Delete Essay Button
      OutlinedButton(
          onPressed: _onWillPop,
          style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Delete'),
              SizedBox(
                width: 15,
              ),
              Icon(
                Iconsax.trash,
                size: 20,
              )
            ],
          )),
      const SizedBox(width: 10),

      //Exit Essay Button
      OutlinedButton(
          onPressed: () {
            Get.back();
          },
          style: OutlinedButton.styleFrom(foregroundColor: Colors.black),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Exit'),
              SizedBox(
                width: 15,
              ),
              Icon(
                Iconsax.back_square,
                size: 20,
              )
            ],
          )),
    ]);
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?',
                style: Theme.of(context).textTheme.headlineLarge),
            content: Text(
                'Do you want to Delete this Essay?\nYou will lose this essay.',
                style: Theme.of(context).textTheme.labelMedium),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(false), //<-- SEE HERE
                child:
                    Text('No', style: Theme.of(context).textTheme.labelSmall),
              ),
              TextButton(
                onPressed: deleteEssay, // <-- SEE HERE
                child:
                    Text('Yes', style: Theme.of(context).textTheme.labelSmall),
              ),
            ],
          ),
        )) ??
        false;
  }

  deleteEssay() async {
    var essay = EssayModel(id: widget.essay.id);
    var res = await delEssay.deleteEssay(essay);
    SnackMessage(
      state: 'Loading',
      context: context,
    ).snackMessage();
    if (res.runtimeType == PostgrestException) {
      final PostgrestException resp = res;
      SnackMessage(
        state: 'Message',
        context: context,
        color: Colors.red,
        message: resp.message,
      ).snackMessage();
    } else {
      SnackMessage(
        state: 'Message',
        context: context,
        color: Colors.red,
        message: "Essay Deleted",
      ).snackMessage();
      Get.to(const AllEssays());
    }
  }
}
