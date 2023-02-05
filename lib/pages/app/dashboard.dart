import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Row(children: [
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Essai',
                    style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Blanka',
                        color: Color.fromARGB(255, 2, 21, 80)),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: Container(color: const Color.fromARGB(255, 226, 240, 255)))
        ]));
  }
}
