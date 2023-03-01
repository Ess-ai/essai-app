import 'package:essai/pages/app/essay/new_essay.dart';
import 'package:essai/pages/app/widgets/footer.dart';
import 'package:essai/pages/app/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Essay extends StatefulWidget {
  const Essay({Key? key}) : super(key: key);

  @override
  EssayState createState() => EssayState();
}

class EssayState extends State<Essay> {
  final List<ChartData> chartData = [
    ChartData('Performance', 78),
  ];

  final String title = 'Plastics Should be Banned';
  final String title2 = 'Why Plastics Should be Banned';
  final String _essay =
      'Plastics have become an integral part of modern society, and their production and usage have increased dramatically over the past few decades. Plastics are versatile, lightweight, durable, and inexpensive, making them ideal for various applications. However, the widespread use of plastics has also led to significant environmental problems, and the negative impacts of plastics are becoming more apparent. In this essay, I will argue that plastics should be banned due to their detrimental effects on the environment and human health.\n\nFirst and foremost, plastics have severe consequences for the environment. Plastics are not biodegradable, meaning that they do not break down naturally and can persist in the environment for hundreds of years. As a result, they accumulate in the oceans, landfills, and other ecosystems, leading to a range of environmental problems. Plastic waste in the oceans poses a significant threat to marine life, as it can be mistaken for food and ingested, leading to injury or death. Plastics also release toxic chemicals as they degrade, contaminating soil and water resources.\n\nMoreover, plastics are a significant source of greenhouse gas emissions. The production of plastics is energy-intensive and involves the extraction and processing of fossil fuels. Additionally, the transportation and disposal of plastics also contribute to greenhouse gas emissions. These emissions contribute to climate change, which has far-reaching environmental and social impacts, including rising sea levels, more frequent natural disasters, and food and water scarcity.\n\nFurthermore, plastics have harmful effects on human health. Plastic products contain chemicals such as phthalates and bisphenol-A, which have been linked to a range of health problems, including reproductive disorders, developmental problems in children, and cancer. These chemicals can leach into food and water, especially when plastics are exposed to heat or other stressors, and can cause significant health risks.\n\nIn conclusion, plastics should be banned due to their negative impact on the environment and human health. Although plastics have numerous benefits, the costs of their production, usage, and disposal far outweigh the benefits. Governments, businesses, and individuals need to take action to reduce the use of plastics and transition to more sustainable alternatives. This can include measures such as introducing plastic taxes, promoting reusable and biodegradable products, and investing in research and innovation to find alternative materials. By taking action to ban plastics, we can protect the environment and safeguard the health of current and future generations.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //Header
          const Header(),

          //Body
          Expanded(
              child: SingleChildScrollView(
                  child: Container(
                      alignment: Alignment.topLeft,
                      padding:
                          const EdgeInsets.only(top: 30, left: 200, right: 200),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Recent Essays Title
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: GoogleFonts.ptSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),

                                //Edit Essay Button
                                OutlinedButton(
                                    onPressed: () {
                                      Get.to(const NewEssay());
                                    },
                                    style: OutlinedButton.styleFrom(
                                        foregroundColor: Colors.blue),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                        foregroundColor: Colors.green),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                    style: OutlinedButton.styleFrom(
                                        foregroundColor: Colors.red),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                              ],
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 20,
                            ),

                            //Essay Body
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Essay Content
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
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
                                            //Essay Title
                                            Text(
                                              title2,
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.ptSans(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),

                                            //Essay Body
                                            Text(
                                              _essay,
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.ptSans(
                                                  color: Colors.black,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),

                                //Essay Stats
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        children: [
                                          //Score
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey)),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'SCORE:',
                                                    style: GoogleFonts.ptSans(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                      alignment:
                                                          Alignment.center,
                                                      padding: EdgeInsets.zero,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.1,
                                                      child: SfCircularChart(
                                                          margin:
                                                              EdgeInsets.zero,
                                                          legend: Legend(
                                                              title: LegendTitle(
                                                                  text: '78')),
                                                          series: <
                                                              CircularSeries>[
                                                            // Renders radial bar chart
                                                            RadialBarSeries<
                                                                    ChartData,
                                                                    String>(
                                                                trackColor:
                                                                    Colors
                                                                        .green,
                                                                maximumValue:
                                                                    100,
                                                                radius: '50%',
                                                                innerRadius:
                                                                    '80%',
                                                                dataSource:
                                                                    chartData,
                                                                xValueMapper:
                                                                    (ChartData data,
                                                                            _) =>
                                                                        data.x,
                                                                yValueMapper:
                                                                    (ChartData data,
                                                                            _) =>
                                                                        data.y,
                                                                cornerStyle:
                                                                    CornerStyle
                                                                        .bothCurve)
                                                          ]))
                                                ]),
                                          ),
                                          const SizedBox(height: 20),

                                          //Marks
                                          Container(
                                              alignment: Alignment.topLeft,
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors.grey)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Marks:',
                                                    style: GoogleFonts.ptSans(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    '.../20',
                                                    style: GoogleFonts.ptSans(
                                                        fontSize: 18,
                                                        color: Colors.lightBlue,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              )),
                                          const SizedBox(height: 8),

                                          //Grade
                                          Container(
                                              alignment: Alignment.topLeft,
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors.grey)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Grade:',
                                                    style: GoogleFonts.ptSans(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    '...',
                                                    style: GoogleFonts.ptSans(
                                                        fontSize: 18,
                                                        color: Colors.green,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              )),
                                          const SizedBox(height: 8),

                                          //Words
                                          Container(
                                              alignment: Alignment.topLeft,
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors.grey)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'WORDS:',
                                                    style: GoogleFonts.ptSans(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    '${_essay.split(' ').length}',
                                                    style: GoogleFonts.ptSans(
                                                        fontSize: 18,
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              )),
                                          const SizedBox(height: 8),

                                          //Characters
                                          Container(
                                              alignment: Alignment.topLeft,
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors.grey)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'CHARACTERS:',
                                                    style: GoogleFonts.ptSans(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    '${_essay.characters.length}',
                                                    style: GoogleFonts.ptSans(
                                                        fontSize: 18,
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              )),
                                        ],
                                      )),
                                ),
                              ],
                            ),

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
