import 'package:essai/controllers/essay_buttons_controller.dart';
import 'package:essai/models/essay.dart';
import 'package:essai/pages/app/essay/widgets/essay_body.dart';
import 'package:essai/pages/app/navigation/footer.dart';
import 'package:essai/pages/app/navigation/header.dart';
import 'package:essai/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

import 'essay_edit.dart';

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

  Future markingEssay() async {
    var essay = widget.essay;
    setState(() => _isMarking = true);
    final res = await services.aiService.markEssay(
      essay,
      'High School Essay Rubric',
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
                            'Check Your Performance',
                            style: GoogleFonts.ptSans(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          //Submit Essay Button
                          OutlinedButton(
                            onPressed: () => buildShowModalBottomSheet(context),
                            style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.blue.shade900),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          ),
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

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Results'),
            ],
          ),
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
