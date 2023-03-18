import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeftPart extends StatefulWidget {
  const LeftPart({Key? key}) : super(key: key);

  @override
  LeftPartState createState() => LeftPartState();
}

class LeftPartState extends State<LeftPart> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        alignment: Alignment.topLeft,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/quest.jpg'),
                fit: BoxFit.cover)),
      ),
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(122, 33, 149, 243),
            Color.fromARGB(122, 68, 137, 255)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(48),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Essai',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Blanka',
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Text(
                'Think Differently',
                style: GoogleFonts.lora(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              Text(
                "'If you can THINK, SPEAK and WRITE you are absolutely DEADLY.'\nDr. Jordan B. Peterson",
                style: GoogleFonts.lora(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'About',
                        style: GoogleFonts.lora(color: Colors.white),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Services',
                        style: GoogleFonts.lora(color: Colors.white),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Rate Us',
                        style: GoogleFonts.lora(color: Colors.white),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Feedback',
                        style: GoogleFonts.lora(color: Colors.white),
                      )),
                ],
              )
            ]),
      )
    ]);
  }
}
