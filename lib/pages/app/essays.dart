import 'package:card_loading/card_loading.dart';
import 'package:essai/mixins/handle_exception_mixin.dart';
import 'package:essai/models/essay_results.dart';
import 'package:essai/pages/app/navigation/footer.dart';
import 'package:essai/pages/app/navigation/header.dart';
import 'package:essai/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import 'essay/essay.dart';

class Essays extends StatefulWidget {
  const Essays({Key? key}) : super(key: key);

  @override
  EssaysState createState() => EssaysState();
}

class EssaysState extends State<Essays> with HandleExceptions {
  final getEssays = Services().essayServices;

  bool isLoading = true;
  List essays = [];

  void loadEssays() async {
    var essay = await getEssays.getEssays();
    setState(() {
      essays = essay;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadEssays();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var padding = width * 0.05;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      //All Essays Title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'All Essays',
                            style: GoogleFonts.ptSans(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.black),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Search Essay'),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Iconsax.search_status,
                                    size: 20,
                                  )
                                ],
                              ))
                        ],
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),

                      //All Essays List
                      allEssays(),

                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(),

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

  Widget allEssays() {
    double width = MediaQuery.of(context).size.width;
    return isLoading
        ? Wrap(
            spacing: width * 0.01,
            runSpacing: width * 0.04,
            children: [
              for (int x = 0; x < 5; x++) ...[
                Container(
                  width: width >= 840 ? width * 0.2 : width * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(2),
                  child: const CardLoading(
                    height: 140,
                    cardLoadingTheme: CardLoadingTheme(
                      colorOne: Color.fromARGB(255, 240, 240, 240),
                      colorTwo: Color.fromARGB(255, 236, 235, 235),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
              ],
            ],
          )
        : Wrap(
            spacing: width * 0.01,
            runSpacing: width * 0.04,
            children: [
              if (essays.isEmpty) ...[
                Container(
                  width: width >= 840 ? width * 0.2 : width * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 0.5, color: Colors.grey),
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
                          'NO ESSAY(S) FOUND',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.ptSans(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'You Do Not Have Any Essays\nClick Dowm Here to Add a New Essay',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.ptSans(
                              color: Colors.white, fontSize: 12),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.all(2),
                          ),
                          child: Text(
                            'Add Essay',
                            style: GoogleFonts.lora(
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              for (var ess in essays) ...[
                TextButton(
                  onPressed: () {
                    Get.to(Essay(essay: ess));
                  },
                  style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
                  child: Container(
                    width: width >= 840 ? width * 0.2 : width * 0.4,
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
                            ess.essayTitle.length <= 40
                                ? ess.essayTitle + '...'
                                : ess.essayTitle.substring(0, 40) + '...',
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
                            ess.essayBody.length < 190
                                ? ess.essayBody + '...'
                                : ess.essayBody.substring(0, 190) + '...',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.ptSans(
                                color: Colors.black, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
              ],
            ],
          );
  }
}
