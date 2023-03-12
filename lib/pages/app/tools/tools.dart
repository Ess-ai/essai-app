import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
