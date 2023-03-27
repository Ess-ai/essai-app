import 'package:essai/models/essay.dart';
import 'package:essai/pages/app/essay/essay_edit.dart';
import 'package:essai/pages/app/navigation/footer.dart';
import 'package:essai/pages/app/navigation/header.dart';
import 'package:essai/pages/app/widgets/loader.dart';
import 'package:essai/services/get_essays.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
//import 'package:syncfusion_flutter_charts/charts.dart';

class Essay extends StatefulWidget {
  const Essay({Key? key}) : super(key: key);

  @override
  EssayState createState() => EssayState();
}

class EssayState extends State<Essay> {
  final getEssays = GetEssays();

  bool _isMarking = false;

  @override
  void initState() {
    super.initState();
    getEssays.getEssays().then((value) {
      setState(() {
        essay = value.first;
        isLoading = false;
      });
    });
  }

  EssayModel essay = EssayModel();

  Widget essayActionButtons() {
    return Row(children: [
      //Edit Essay Button
      OutlinedButton(
          onPressed: () {
            Get.to(const NewEssay());
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
            setState(() {
              _isMarking = true;
              Future.delayed(const Duration(milliseconds: 3500)).then((value) {
                setState(() {
                  _isMarking = false;
                });
              });
            });
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
          onPressed: () {},
          style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Delete'),
              SizedBox(
                width: 15,
              ),
              Icon(
                Iconsax.document_upload,
                size: 20,
              )
            ],
          )),
    ]);
  }

  Widget essayStats() {
    return Expanded(
      flex: 2,
      child: Container(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            children: [
              /*Score
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 0.5, color: Colors.grey)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SCORE:',
                        style: GoogleFonts.ptSans(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.zero,
                          height: MediaQuery.of(context).size.width * 0.1,
                          child: SfCircularChart(
                              margin: EdgeInsets.zero,
                              legend: Legend(title: LegendTitle(text: '78')),
                              series: <CircularSeries>[
                                // Renders radial bar chart
                                RadialBarSeries<ChartData, String>(
                                    trackColor: Colors.green,
                                    maximumValue: 100,
                                    radius: '50%',
                                    innerRadius: '80%',
                                    dataSource: chartData,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y,
                                    cornerStyle: CornerStyle.bothCurve)
                              ]))
                    ]),
              ),
              const SizedBox(height: 20),
              */
              //Marks
              Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 0.5, color: Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Marks:',
                        style: GoogleFonts.ptSans(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        essay.isSubmitted == null ? 'Not Submitted' : 'loading',
                        style: GoogleFonts.ptSans(
                            fontSize: 18,
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              const SizedBox(height: 8),

              //Grade
              Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 0.5, color: Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Grade:',
                        style: GoogleFonts.ptSans(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        essay.isSubmitted == null ? 'Not Submitted' : 'loading',
                        style: GoogleFonts.ptSans(
                            fontSize: 18,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              const SizedBox(height: 8),

              //Words
              Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 0.5, color: Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'WORDS:',
                        style: GoogleFonts.ptSans(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${essay.essayBody!.split(' ').length}',
                        style: GoogleFonts.ptSans(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              const SizedBox(height: 8),

              //Characters
              Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 0.5, color: Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'CHARACTERS:',
                        style: GoogleFonts.ptSans(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${essay.essayBody!.characters.length}',
                        style: GoogleFonts.ptSans(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
            ],
          )),
    );
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var padding = width * 0.05;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //Header
          const Header(),

          //Body
          isLoading
              ? const Loader()
              : Expanded(
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
                                    width >= 650
                                        ? essayActionButtons()
                                        : Container(),
                                  ],
                                ),

                                width >= 650
                                    ? Container()
                                    : Container(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: essayActionButtons()),
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
                                                            BorderRadius
                                                                .circular(5),
                                                        border: Border.all(
                                                            width: 0.5,
                                                            color:
                                                                Colors.grey)),
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          //Essay Title
                                                          Text(
                                                            '${essay.essayTitle}',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: GoogleFonts.ptSans(
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
                                                            style: GoogleFonts
                                                                .ptSans(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        14),
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                              ),

                                              //Essay Stats
                                              width >= 650
                                                  ? essayStats()
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
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
