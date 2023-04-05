import 'package:card_loading/card_loading.dart';
import 'package:essai/pages/app/navigation/footer.dart';
import 'package:essai/pages/app/navigation/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../services/get_essays.dart';
import 'essay/essay.dart';

class Essays extends StatefulWidget {
  const Essays({Key? key}) : super(key: key);

  @override
  EssaysState createState() => EssaysState();
}

class EssaysState extends State<Essays> {
  final getEssays = GetEssays();

  bool isLoading = true;
  int score = 0;
  List essays = [];
  List colors = [
    Colors.red,
    Colors.pink,
    Colors.orange,
    Colors.lightGreen,
    Colors.green,
    Colors.blue
  ];

  @override
  void initState() {
    super.initState();
    getEssays.getEssays().then((essay) {
      setState(() {
        essays = essay;
        isLoading = false;
      });
    });
  }

  getScores(id) {
    getEssays.getEssayResult(id).then((value) {
      setState(() {
        score = int.parse(value.score);
      });
    });
  }

  Text submittedResult(submitState, [id]) {
    if (submitState != null) {
      getScores(id);
      return Text('Score: $score',
          textAlign: TextAlign.left,
          style: GoogleFonts.ptSans(
              color: colors[score], fontSize: 12, fontWeight: FontWeight.bold));
    }
    return Text('Draft',
        textAlign: TextAlign.left,
        style: GoogleFonts.ptSans(
            color: Colors.yellow, fontSize: 12, fontWeight: FontWeight.bold));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var padding = width * 0.05;
    return Scaffold(
      body: Column(children: [
        //Header
        const Header(),

        //Body
        Expanded(
            child: SingleChildScrollView(
                child: Container(
                    alignment: Alignment.topLeft,
                    padding:
                        EdgeInsets.only(top: 30, left: padding, right: padding),
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
                          isLoading
                              ? Wrap(
                                  spacing:
                                      MediaQuery.of(context).size.width * 0.03,
                                  runSpacing:
                                      MediaQuery.of(context).size.width * 0.02,
                                  children: [
                                      for (int x = 0; x < 6; x++) ...[
                                        Container(
                                            width: width >= 840
                                                ? width * 0.2
                                                : width * 0.4,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey)),
                                            alignment: Alignment.topLeft,
                                            padding: const EdgeInsets.all(2),
                                            child: const CardLoading(
                                              height: 140,
                                              cardLoadingTheme:
                                                  CardLoadingTheme(
                                                      colorOne: Color.fromARGB(
                                                          255, 240, 240, 240),
                                                      colorTwo: Color.fromARGB(
                                                          255, 236, 235, 235)),
                                            )),
                                      ]
                                    ])
                              : Wrap(
                                  spacing:
                                      MediaQuery.of(context).size.width * 0.03,
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
                                                    width: 0.5,
                                                    color: Colors.grey)),
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
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  submittedResult(
                                                      essays[x].isSubmitted,
                                                      essays[x].id),
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
                                            )),
                                      )
                                    ],
                                  ],
                                ), //Spacing

                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(),

                          //Footer
                          const Footer(),
                          const SizedBox(
                            height: 10,
                          ),
                        ])))),
      ]),
    );
  }
}
