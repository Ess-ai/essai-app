import 'package:card_loading/card_loading.dart';
import 'package:essai/pages/app/essay/new_essay.dart';
import 'package:essai/pages/app/essays.dart';
import 'package:essai/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../navigation/footer.dart';
import '../navigation/header.dart';
import '../widgets/recent_essays.dart';
import 'essay.dart';

class AllEssays extends StatefulWidget {
  const AllEssays({Key? key}) : super(key: key);

  @override
  AllEssaysState createState() => AllEssaysState();
}

class AllEssaysState extends State<AllEssays> {
  final services = Services();

  bool isLoading = true;
  List essays = [];

  @override
  void initState() {
    super.initState();
    services.essayServices.getEssays().then((essay) {
      setState(() {
        essays = essay;
        isLoading = false;
      });
    });
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
            //Top Bar
            const Header(),
            //Body
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.topLeft,
                  padding:
                      EdgeInsets.only(top: 30, left: padding, right: padding),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Welcome Card
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade900,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add a New Essay',
                              style: GoogleFonts.ptSans(
                                  color: Colors.white, fontSize: 20),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                              style: GoogleFonts.ptSans(
                                  color: Colors.white, fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Get.to(const NewEssay());
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.all(5)),
                                  child: Text(
                                    'Get Started',
                                    style: GoogleFonts.lora(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 14),
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'CONTINUE',
                                    style: GoogleFonts.lora(
                                        color: Colors.white, fontSize: 14),
                                  ))
                            ])
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      //Recent Essays Title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recent Essays',
                            style: GoogleFonts.ptSans(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              Get.to(const Essays());
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.black,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('View All'),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Iconsax.arrow_right,
                                  size: 20,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),

                      //Recent Essays List
                      const RecentEssays(),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(),

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
                            onPressed: () {
                              Get.to(const Essays());
                            },
                            style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.black),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Search'),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Iconsax.arrow_right,
                                  size: 20,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),

                      //All Essays
                      isLoading
                          ? Wrap(
                              spacing: MediaQuery.of(context).size.width * 0.03,
                              runSpacing:
                                  MediaQuery.of(context).size.width * 0.02,
                              children: [
                                for (int x = 0; x < 6; x++) ...[
                                  Container(
                                    width: width >= 840
                                        ? width * 0.2
                                        : width * 0.4,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            width: 0.5, color: Colors.grey)),
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.all(2),
                                    child: const CardLoading(
                                      height: 140,
                                      cardLoadingTheme: CardLoadingTheme(
                                        colorOne:
                                            Color.fromARGB(255, 240, 240, 240),
                                        colorTwo:
                                            Color.fromARGB(255, 236, 235, 235),
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            )
                          : Wrap(
                              spacing: MediaQuery.of(context).size.width * 0.03,
                              runSpacing:
                                  MediaQuery.of(context).size.width * 0.02,
                              children: [
                                for (int x = 0; x < essays.length; x++) ...[
                                  TextButton(
                                    onPressed: () {
                                      Get.to(Essay(
                                        essay: essays[x],
                                      ));
                                    },
                                    style: TextButton.styleFrom(
                                        padding: const EdgeInsets.all(0)),
                                    child: Container(
                                      width: width >= 840
                                          ? width * 0.2
                                          : width * 0.4,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 0.5, color: Colors.grey)),
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
                                            Text(
                                              '${essays[x].essayTitle}',
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
                                              essays[x]
                                                  .essayBody!
                                                  .substring(0, 197),
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.ptSans(
                                                  color: Colors.black,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ), //Spacing

                      const SizedBox(height: 20),
                      const Divider(),

                      //Footer
                      const Footer(),

                      //Spacing
                      const SizedBox(
                        height: 20,
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
}
