import 'package:essai/pages/app/essay/essay.dart';
import 'package:essai/pages/app/widgets/footer.dart';
import 'package:essai/pages/app/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  final String user = 'Joe';

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.only(top: 30, left: 200, right: 200),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Greetings
                Text(
                  '👋 Hi There, $user',
                  style: GoogleFonts.ptSans(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),

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
                        'Welcome Back',
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
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.to(const Essay());
                          },
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(0)),
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 0.5, color: Colors.grey)),
                              alignment: Alignment.topLeft,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.topLeft,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      'Plastic bags are a major cause of environmental pollution. Plastic as a substance is non-biodegradable and thus plastic bags remain in the environment for hundreds of years polluting it immensely.',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.ptSans(
                                          color: Colors.black, fontSize: 12),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(0)),
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 0.5, color: Colors.grey)),
                              alignment: Alignment.topLeft,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.topLeft,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      'Looking at the age when a man led a life like a savage, we notice how far we have come. Similarly, the evolution of mankind is truly commendable. One of the major driving forces behind this is science.',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.ptSans(
                                          color: Colors.black, fontSize: 12),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Divider(),

                //Spacings
                const SizedBox(
                  height: 20,
                ),

                //Popular Tools Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Tools',
                      style: GoogleFonts.ptSans(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                //Popular Tools List
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0)),
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.15,
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
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0)),
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.15,
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
                                  Iconsax.document,
                                  size: 30,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'File Marker',
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
                                  'Upload your typed essay from multiple formats e.g docs, img',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.ptSans(
                                      color: Colors.black, fontSize: 12),
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
                          width: MediaQuery.of(context).size.width * 0.15,
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
                                  Iconsax.pen_add,
                                  size: 30,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Write',
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
                                  'Write or paste your essay here with our writing tool',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.ptSans(
                                      color: Colors.black, fontSize: 12),
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
                          width: MediaQuery.of(context).size.width * 0.15,
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
                                  Iconsax.d_cube_scan,
                                  size: 30,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Essay Zone',
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
                                  'Get Essay Prompts and even generate or get essay samples.',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.ptSans(
                                      color: Colors.black, fontSize: 12),
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
