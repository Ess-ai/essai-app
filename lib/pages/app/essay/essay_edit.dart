import 'package:essai/controllers/edit_essay_controller.dart';
import 'package:essai/models/essay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class EditEssay extends StatefulWidget {
  final EssayModel essay;
  const EditEssay({Key? key, required this.essay}) : super(key: key);

  @override
  EditEssayState createState() => EditEssayState();
}

// ignore: must_be_immutable
class EditEssayState extends State<EditEssay> {
  final controller = EditEssayController();

  final Color primary = const Color.fromARGB(255, 0, 0, 77);
  final Color dark = const Color.fromARGB(156, 0, 0, 17);

  String _essay = '';
  String title = '';
  String title2 = 'Expository Essay';

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

  Widget essayActionButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          //Edit Essay Button
          OutlinedButton(
            onPressed: () => controller.saveEssay(context),
            style: OutlinedButton.styleFrom(foregroundColor: Colors.blue),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Save'),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Iconsax.save_add,
                  size: 20,
                )
              ],
            ),
          ),
          const SizedBox(width: 10),

          //Submit Essay Button
          OutlinedButton(
            onPressed: () => controller.submitEssay(context),
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
                  width: 10,
                ),
                Icon(
                  Iconsax.trash,
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
          ],
        ),
      ),
    );
  }

  Widget essayInputArea() {
    double width = MediaQuery.of(context).size.width;
    var essay = widget.essay;
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
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Essay Title
                    TextFormField(
                      initialValue: essay.essayTitle,
                      //controller: essayTitle,
                      onChanged: (value) => setState(() => title = value),
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
                      initialValue: essay.essayBody,
                      maxLines: 40,
                      //controller: essayBody,
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
        child: Row(
          children: [
            //Essay Display
            width >= 840
                ? Expanded(flex: 3, child: essayDisplayArea())
                : Container(),

            //Essay Text Area
            essayInputArea(),
          ],
        ),
      ),
    );
  }
}
