import 'package:essai/controllers/essay_buttons_controller.dart';
import 'package:essai/mixins/handle_exception_mixin.dart';
import 'package:essai/models/essay.dart';
import 'package:essai/models/essay_results.dart';
import 'package:essai/pages/app/essay/widgets/essay_body.dart';
import 'package:essai/pages/app/navigation/footer.dart';
import 'package:essai/pages/app/navigation/header.dart';
import 'package:essai/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

import '../widgets/loader.dart';
import 'essay_edit.dart';

// ignore: must_be_immutable
class Essay extends StatefulWidget {
  EssayModel essay;
  Essay({Key? key, required this.essay}) : super(key: key);

  @override
  EssayState createState() => EssayState();
}

class EssayState extends State<Essay> with HandleExceptions {
  final services = Services();

  bool _isMarking = false;

  Future markingEssay() async {
    var essay = widget.essay;
    setState(() => _isMarking = true);
    final res = await services.aiService.markEssay(
      essay,
      'High School Essay Rubric',
    );
    if (res.runtimeType != String) {
      // ignore: use_build_context_synchronously
      handleExceptions(context, 'Out of Quotas');
      setState(() {
        _isMarking = false;
      });
    } else {
      final ess = await services.essayServices.getEssay(res);

      setState(() {
        widget.essay = ess;
        _isMarking = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var essay = widget.essay;
    double width = MediaQuery.of(context).size.width;
    var padding = width * 0.05;
    bool isSubmitted = essay.isSubmitted == null ? false : true;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
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
                            fit: FlexFit.loose,
                            child: Text(
                              essay.essayTitle.toString(),
                              style: GoogleFonts.ptSans(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Spacer(),
                          width >= 650 ? actionButtons() : Container(),
                        ],
                      ),

                      width >= 650
                          ? Container()
                          : Container(
                              padding: const EdgeInsets.only(top: 10),
                              child: actionButtons(),
                            ),
                      const Divider(),
                      const SizedBox(
                        height: 3,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            isSubmitted
                                ? 'Check Your Performance'
                                : 'Submit Essay',
                            style: GoogleFonts.ptSans(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          //Submit Essay Button

                          isSubmitted
                              ? OutlinedButton(
                                  onPressed: () =>
                                      buildShowModalBottomSheet(context, essay),
                                  style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.blue.shade900),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text('Results'),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Icon(
                                        Iconsax.activity,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),

                      const SizedBox(height: 10),

                      //Essay Body
                      _isMarking ? marking() : EssayDisplay(essay: essay),

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
      ),
    );
  }

  Widget marking() {
    return Column(
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
    );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context, essay) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(18),
        child: FutureBuilder(
          future: services.essayServices.getEssayResults(essay.id.toString()),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loading();
            } else {
              if (snapshot.hasData) {
                if (snapshot.data.runtimeType == EssayResultsModel) {
                  EssayResultsModel results = snapshot.data;
                  return Container(
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
                      ],
                    ),
                  );
                } else {
                  return const Text('There was an Error Reaching the server');
                }
              } else {
                return const Text('No Data Found');
              }
            }
          }),
        ),
      ),
    );
  }

  final controller = EssayButtonsController();

  Widget actionButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
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
            ),
          ),
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
            ),
          ),
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
            ),
          ),
          const SizedBox(width: 10),

          //Exit Essay Button
          OutlinedButton(
            onPressed: () {
              Get.back();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
            ),
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
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> _onWillPop() async {
    var dialog = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?',
            style: Theme.of(context).textTheme.headlineLarge),
        content: Text(
            'Do you want to Delete this Essay?\nYou will lose this essay.',
            style: Theme.of(context).textTheme.labelMedium),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), //<-- SEE HERE
            child: Text('No', style: Theme.of(context).textTheme.labelSmall),
          ),
          TextButton(
            onPressed: controller.deleteEssay(
              context,
              widget.essay,
            ), // <-- SEE HERE
            child: Text('Yes', style: Theme.of(context).textTheme.labelSmall),
          ),
        ],
      ),
    );
    return dialog ?? false;
  }
}
