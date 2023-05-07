import 'package:essai/mixins/loading_mixin.dart';
import 'package:essai/pages/app/essay/new_essay.dart';
import 'package:essai/pages/app/essay/all_essays.dart';
import 'package:essai/pages/app/essays.dart';
import 'package:essai/pages/app/navigation/footer.dart';
import 'package:essai/pages/app/navigation/header.dart';
import 'package:essai/pages/app/widgets/popular_tools.dart';
import 'package:essai/pages/app/widgets/recent_essays.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> with LoadingMixin {
  final String user = 'Joe';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var padding = width * 0.05;

    isLoading(false, context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            //Top Bar
            const Header(),
            //Body
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.topLeft,
                  padding:
                      EdgeInsets.only(top: 30, left: padding, right: padding),
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
                            Row(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Get.to(const NewEssay());
                                    },
                                    style: TextButton.styleFrom(
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
                                  onPressed: () {
                                    Get.to(const AllEssays());
                                  },
                                  child: Text(
                                    'CONTINUE',
                                    style: GoogleFonts.lora(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
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
                            onPressed: () {
                              Get.to(const Essays());
                            },
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
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),

                      //Recent Essays List
                      const RecentEssays(),
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
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),

                      //Popular Tools List
                      const PopularTools(),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
