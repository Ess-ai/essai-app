import 'package:essai/pages/app/widgets/footer.dart';
import 'package:essai/pages/app/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Essays extends StatefulWidget {
  const Essays({Key? key}) : super(key: key);

  @override
  EssaysState createState() => EssaysState();
}

class EssaysState extends State<Essays> {
  @override
  Widget build(BuildContext context) {
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
                        const EdgeInsets.only(top: 30, left: 200, right: 200),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.black),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text('View All'),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Icon(
                                        Iconsax.arrow_right,
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

                          //Recent Essays List
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                        padding: const EdgeInsets.all(0)),
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
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
                                                'Plastic be Banned',
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
                                              Text(
                                                'Plastic bags are a major cause of environmental pollution. Plastic as a substance is non-biodegradable and thus plastic bags remain in the environment for hundreds of years polluting it immensely.',
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.ptSans(
                                                    color: Colors.black,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.03,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                        padding: const EdgeInsets.all(0)),
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
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
                                                'Wonder of Science',
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
                                              Text(
                                                'Looking at the age when a man led a life like a savage, we notice how far we have come. Similarly, the evolution of mankind is truly commendable. One of the major driving forces behind this is science.',
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.ptSans(
                                                    color: Colors.black,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                  ),
                                ],
                              )),
                          const SizedBox(
                            height: 20,
                          ),

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

                          //Recent Essays List
                          Wrap(
                            spacing: MediaQuery.of(context).size.width * 0.025,
                            runSpacing: 20,
                            children: [
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(0)),
                                child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
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
                                            'Plastic be Banned',
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
                                            'Submitted - 15/20',
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.ptSans(
                                                color: Colors.green,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Plastic bags are a major cause of environmental pollution. Plastic as a substance is non-biodegradable and thus plastic bags remain in the environment for hundreds of years polluting it immensely.',
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.ptSans(
                                                color: Colors.black,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(0)),
                                child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
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
                                            'Wonder of Science',
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
                                            'Draft',
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.ptSans(
                                                color: Colors.yellow,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Looking at the age when a man led a life like a savage, we notice how far we have come. Similarly, the evolution of mankind is truly commendable. One of the major driving forces behind this is science.',
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.ptSans(
                                                color: Colors.black,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(0)),
                                child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
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
                                            'Plastic be Banned',
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
                                            'Submitted - 8/20',
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.ptSans(
                                                color: Colors.red,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Plastic bags are a major cause of environmental pollution. Plastic as a substance is non-biodegradable and thus plastic bags remain in the environment for hundreds of years polluting it immensely.',
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.ptSans(
                                                color: Colors.black,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(0)),
                                child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
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
                                            'Wonder of Science',
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
                                            'Submitted - 10/20',
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.ptSans(
                                                color: Colors.greenAccent,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Looking at the age when a man led a life like a savage, we notice how far we have come. Similarly, the evolution of mankind is truly commendable. One of the major driving forces behind this is science.',
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.ptSans(
                                                color: Colors.black,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(0)),
                                child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
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
                                            'Plastic be Banned',
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
                                            'Submitted - 15/20',
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.ptSans(
                                                color: Colors.green,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Plastic bags are a major cause of environmental pollution. Plastic as a substance is non-biodegradable and thus plastic bags remain in the environment for hundreds of years polluting it immensely.',
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.ptSans(
                                                color: Colors.black,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(0)),
                                child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
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
                                            'Wonder of Science',
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
                                            'Submitted - 19/20',
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.ptSans(
                                                color: Colors.green.shade900,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Looking at the age when a man led a life like a savage, we notice how far we have come. Similarly, the evolution of mankind is truly commendable. One of the major driving forces behind this is science.',
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.ptSans(
                                                color: Colors.black,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          ),
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
