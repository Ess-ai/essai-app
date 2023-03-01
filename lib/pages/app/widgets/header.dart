import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  HeaderState createState() => HeaderState();
}

class HeaderState extends State<Header> {
  final List menu = ['DashBoard', 'Essays', 'Tools'];
  // Initial Selected Value
  String dropdownvalue = 'Joe Gakah';

  // List of items in our dropdown menu
  var items = [
    'Joe Gakah',
    'Profile',
    'Settings',
    'Log Out',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding:
          const EdgeInsets.only(left: 200, right: 200, top: 10, bottom: 10),
      child: Row(
        children: [
          Row(children: [
            //Logo
            TextButton(
                onPressed: () {},
                child: const Text('essai',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Blanka',
                        fontSize: 30))),
            const SizedBox(width: 20),

            //Menu Items
            TextButton(
                onPressed: () {},
                child: Text('Dashboard',
                    style: GoogleFonts.ptSans(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold))),
            const SizedBox(width: 15),
            TextButton(
                onPressed: () {},
                child: Text('Essays',
                    style: GoogleFonts.ptSans(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold))),
            const SizedBox(width: 15),
            TextButton(
                onPressed: () {},
                child: Text('Tools',
                    style: GoogleFonts.ptSans(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold))),
            const SizedBox(width: 15),
            TextButton(
                onPressed: () {},
                child: Text('Support',
                    style: GoogleFonts.ptSans(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold))),
          ]),
          const Spacer(),
          Row(
            children: [
              const CircleAvatar(
                radius: 10,
                child: Icon(Iconsax.profile),
              ),
              const SizedBox(
                width: 12,
              ),
              DropdownButton(
                underline: Container(),
                style: GoogleFonts.ptSans(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                value: dropdownvalue,
                icon: const Icon(Iconsax.arrow_down_1),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
              const SizedBox(
                width: 12,
              ),
              const Text('|'),
              const SizedBox(
                width: 12,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade900,
                      foregroundColor: Colors.white),
                  child: Text(
                    'Donate',
                    style: GoogleFonts.ptSans(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
