import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class PopularTools extends StatelessWidget {
  const PopularTools({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
              child: Container(
                  width: width >= 840 ? width * 0.15 : width * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 0.5, color: Colors.grey)),
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
              child: Container(
                  width: width >= 840 ? width * 0.15 : width * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 0.5, color: Colors.grey)),
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
              child: Container(
                  width: width >= 840 ? width * 0.15 : width * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 0.5, color: Colors.grey)),
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
              child: Container(
                  width: width >= 840 ? width * 0.15 : width * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 0.5, color: Colors.grey)),
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
        ));
  }
}
