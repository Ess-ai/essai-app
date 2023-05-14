import 'package:essai/controllers/new_essay_controller.dart';
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
  final controller = NewEssayController();

  final Color primary = const Color.fromARGB(255, 0, 0, 77);
  final Color dark = const Color.fromARGB(156, 0, 0, 17);

  bool valuefirst = false;
  bool valuesecond = false;

  String title = '';
  final String title2 = 'Expository Essay';
  String _essay = '';

  // Initial Selected Value
  String dropdownvalue = 'General Essay';

  final categories = [
    'General Essay',
    'College Essay',
    'High School Essay',
    'Ielts Essay',
    'Toefl Essay'
  ];

  itemFunctions() {
    switch (dropdownvalue) {
      case 'General Essay':
        break;
      case 'College Essay':
        break;
      case 'High School Essay':
        break;
      case 'Ielts Essay':
        break;
      case 'Toefl Essay':
        break;

      default:
    }
  }

  Widget essayActionButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          //Edit Essay Button
          OutlinedButton(
            onPressed: () => controller.submitEssay(context, dropdownvalue),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Save'),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Iconsax.save_2,
                  size: 20,
                )
              ],
            ),
          ),
          const SizedBox(width: 10),

          //Exit
          OutlinedButton(
            onPressed: () {
              Get.back();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Exit'),
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
        ],
      ),
    );
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
          filterQuality: FilterQuality.high,
        ),
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
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              _essay,
              style: GoogleFonts.lora(color: Colors.white, fontSize: 13),
            ),
          ],
        ),
      ),
    );
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
                  DropdownButton(
                    underline: Container(),
                    style: GoogleFonts.ptSans(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    value: dropdownvalue,
                    icon: const Icon(Iconsax.arrow_down_1),
                    items: categories.map((String category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                  const Spacer(),
                  width >= 650 ? essayActionButtons() : Container(),
                ],
              ),
              width >= 650
                  ? Container()
                  : Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: essayActionButtons(),
                    ),
              const Divider(),

              //Counter
              Row(
                children: [
                  Text(
                    '${_essay.split(' ').length} Words',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ptSans(
                      fontSize: 16,
                      color: Colors.blueAccent,
                    ),
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
                      fontSize: 16,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Essay Title
                    TextFormField(
                      controller: controller.essayTitle,
                      onChanged: (value) => setState(() => title = value),
                      style: GoogleFonts.ptSans(
                        color: primary,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        hintText: 'Why Plastics Should be banned',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            style: BorderStyle.none,
                            width: 0,
                            color: Colors.white,
                          ),
                        ),
                        contentPadding: EdgeInsets.all(0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            style: BorderStyle.none,
                            width: 0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //Essay Title
                    TextFormField(
                      maxLines: 40,
                      controller: controller.essayBody,
                      onChanged: (value) => setState(() => _essay = value),
                      style: GoogleFonts.ptSans(color: primary, fontSize: 18),
                      decoration: const InputDecoration(
                        hintText: 'Essay Body',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            style: BorderStyle.none,
                            width: 0,
                            color: Colors.white,
                          ),
                        ),
                        contentPadding: EdgeInsets.all(0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            style: BorderStyle.none,
                            width: 0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Row(children: [
          //Essay Display
          width >= 840
              ? Expanded(flex: 3, child: essayDisplayArea())
              : Container(),

          //Essay Text Area
          essayInputArea()
        ]),
      ),
    );
  }
}
