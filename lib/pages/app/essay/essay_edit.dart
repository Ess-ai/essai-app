import 'package:essai/pages/app/essay/essay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class NewEssay extends StatefulWidget {
  const NewEssay({Key? key}) : super(key: key);

  @override
  NewEssayState createState() => NewEssayState();
}

// ignore: must_be_immutable
class NewEssayState extends State<NewEssay> {
  final _formKey = GlobalKey<FormState>();
  final Color primary = const Color.fromARGB(255, 0, 0, 77);
  final Color dark = const Color.fromARGB(156, 0, 0, 17);

  bool valuefirst = false;
  bool valuesecond = false;

  String title = '';
  final String title2 = 'Expository Essay';
  String _essay = '';

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

                      //Submit Essay Button
                      OutlinedButton(
                          onPressed: () {
                            Get.to(const Essay());
                          },
                          style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.green),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Submit'),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Iconsax.document_upload,
                                size: 20,
                              )
                            ],
                          )),
                      const SizedBox(width: 10),

                      //Save as Draft
                      OutlinedButton(
                          onPressed: () {
                            Get.to(const Essay());
                          },
                          style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.blue.shade900),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Save'),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Iconsax.document_cloud,
                                size: 20,
                              )
                            ],
                          )),
                      const SizedBox(width: 10),

                      //Delete Essay Button
                      OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.red),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Discard'),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Iconsax.trash,
                                size: 20,
                              )
                            ],
                          )),
                    ],
                  ),
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
