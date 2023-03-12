import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

import '../navigation/footer.dart';
import '../navigation/header.dart';

class Tools extends StatefulWidget {
  const Tools({Key? key}) : super(key: key);

  @override
  ToolsState createState() => ToolsState();
}

class ToolsState extends State<Tools> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var padding = width * 0.05;
    return Scaffold(
        body: Column(
      children: [
        //Top Bar
        const Header(),
        //Body
        Expanded(
            child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(top: 30, left: padding, right: padding),
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
                        'Scan Document',
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
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.all(5)),
                            child: Text(
                              'Try Tool',
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

                //Tools
                //Upload .doc type
                Wrap(
                  spacing: MediaQuery.of(context).size.width * 0.03,
                  runSpacing: MediaQuery.of(context).size.width * 0.02,
                  children: [
                    for (int x = 1; x <= 10; x++) ...[
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0)),
                        child: Container(
                            width: width >= 840 ? width * 0.15 : width * 0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(width: 0.5, color: Colors.grey)),
                            alignment: Alignment.topLeft,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              alignment: Alignment.topLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Iconsax.scan,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Document Scanner',
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
                                    'No need to Type your essay, Just Scan with your camera.',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.ptSans(
                                        color: Colors.black, fontSize: 12),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ]
                  ],
                ),

                //Spacing
                const SizedBox(
                  height: 20,
                ),

                //Footer
                const Footer(),

                //Spacing
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ))
      ],
    ));
  }
}
