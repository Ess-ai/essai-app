import 'package:essai/models/essay.dart';
import 'package:essai/models/essay_category.dart';
import 'package:essai/pages/app/essay/all_essays.dart';
import 'package:essai/pages/app/essay/essay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../services/add_essay.dart';
import '../widgets/snack_message.dart';

class NewEssay extends StatefulWidget {
  const NewEssay({Key? key}) : super(key: key);

  @override
  NewEssayState createState() => NewEssayState();
}

// ignore: must_be_immutable
class NewEssayState extends State<NewEssay> {
  final addEssays = AddEssay();

  final _formKey = GlobalKey<FormState>();
  final essayBody = TextEditingController();
  final essayTitle = TextEditingController();

  final Color primary = const Color.fromARGB(255, 0, 0, 77);
  final Color dark = const Color.fromARGB(156, 0, 0, 17);

  bool valuefirst = false;
  bool valuesecond = false;

  String title = '';
  final String title2 = 'Expository Essay';
  String _essay = '';

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?',
                style: Theme.of(context).textTheme.headlineLarge),
            content: Text(
                'Do you want to Delete this Essay?\nYou will lose your progress',
                style: Theme.of(context).textTheme.labelMedium),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(false), //<-- SEE HERE
                child:
                    Text('No', style: Theme.of(context).textTheme.labelSmall),
              ),
              TextButton(
                onPressed: () => Get.to(const AllEssays()), // <-- SEE HERE
                child:
                    Text('Yes', style: Theme.of(context).textTheme.labelSmall),
              ),
            ],
          ),
        )) ??
        false;
  }

  saveEssay() {}

  submitEssay() async {
    if (_formKey.currentState!.validate()) {
      var essay = EssayModel(
          essayCategory:
              EssayCategoryModel(id: '67ce4435-d675-454b-beb7-5c87486141e9'),
          essayBody: essayBody.text,
          essayTitle: essayTitle.text);
      var res = await addEssays.addEssays(essay);
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
          color: Colors.blue,
          message: "Essay Submitted",
        ).snackMessage();
        Get.to(Essay(essay: essay));
      }
    }
  }

  deleteEssay() {
    _onWillPop();
  }

  Widget essayActionButtons() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          //Edit Essay Button
          OutlinedButton(
              onPressed: submitEssay,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.blue),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Save'),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Iconsax.save_2,
                    size: 20,
                  )
                ],
              )),
          const SizedBox(width: 10),

          //Submit Essay Button
          OutlinedButton(
              onPressed: submitEssay,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.green),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Submit'),
                  SizedBox(
                    width: 10,
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
              onPressed: deleteEssay,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Delete'),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Iconsax.trash,
                    size: 20,
                  )
                ],
              )),
          const SizedBox(width: 10),

          //Exit
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
                    Iconsax.document_upload,
                    size: 20,
                  )
                ],
              )),
        ]));
  }

  Widget essayDisplayArea() {
    return Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'),
              fit: BoxFit.cover,
              opacity: 0.3,
              filterQuality: FilterQuality.high),
        ),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.lora(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  _essay,
                  style: GoogleFonts.lora(color: Colors.white, fontSize: 13),
                ),
              ]),
        ));
  }

  Widget essayInputArea() {
    double width = MediaQuery.of(context).size.width;
    return Expanded(
        flex: 5,
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(36),
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title2,
                        style: GoogleFonts.ptSans(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      width >= 650 ? essayActionButtons() : Container(),
                    ],
                  ),
                  width >= 650
                      ? Container()
                      : Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: essayActionButtons()),
                  const Divider(),

                  //Counter
                  Row(
                    children: [
                      Text(
                        '${_essay.split(' ').length} Words',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ptSans(
                            fontSize: 16, color: Colors.blueAccent),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text('|'),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${_essay.characters.length} Characters',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ptSans(
                            fontSize: 16, color: Colors.blueAccent),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Essay Title
                            TextFormField(
                              controller: essayTitle,
                              onChanged: (value) =>
                                  setState(() => title = value),
                              style: GoogleFonts.ptSans(
                                  color: primary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                              decoration: const InputDecoration(
                                labelText: 'Title',
                                hintText: 'Why Plastics Should be banned',
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        style: BorderStyle.none,
                                        width: 0,
                                        color: Colors.white)),
                                contentPadding: EdgeInsets.all(0),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        style: BorderStyle.none,
                                        width: 0,
                                        color: Colors.white)),
                              ),
                            ),

                            const SizedBox(
                              height: 15,
                            ),

                            //Essay Title
                            TextFormField(
                              maxLines: 40,
                              controller: essayBody,
                              onChanged: (value) =>
                                  setState(() => _essay = value),
                              style: GoogleFonts.ptSans(
                                  color: primary, fontSize: 18),
                              decoration: const InputDecoration(
                                hintText: 'Essay Body',
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        style: BorderStyle.none,
                                        width: 0,
                                        color: Colors.white)),
                                contentPadding: EdgeInsets.all(0),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        style: BorderStyle.none,
                                        width: 0,
                                        color: Colors.white)),
                              ),
                            )
                          ]))
                ]),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(children: [
        //Essay Display
        width >= 840
            ? Expanded(flex: 3, child: essayDisplayArea())
            : Container(),

        //Essay Text Area
        essayInputArea()
      ]),
    );
  }
}
