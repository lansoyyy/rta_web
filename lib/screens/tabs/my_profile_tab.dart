import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rta_web/utlis/colors.dart';
import 'package:rta_web/widgets/button_widget.dart';
import 'package:rta_web/widgets/drawer_widget.dart';
import 'package:rta_web/widgets/text_widget.dart';
import 'package:rta_web/widgets/textfield_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyProfileTab extends StatefulWidget {
  const MyProfileTab({super.key});

  @override
  State<MyProfileTab> createState() => _MyProfileTabState();
}

class _MyProfileTabState extends State<MyProfileTab> {
  final fname = TextEditingController();
  final lname = TextEditingController();
  final email = TextEditingController();
  final badge = TextEditingController();
  final position = TextEditingController();
  final station = TextEditingController();
  final gender = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();

  final admin = TextEditingController();
  final code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      backgroundColor: Colors.brown[50],
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              color: primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Builder(builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    );
                  }),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    'assets/images/rta.png',
                    height: 50,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TextWidget(
                    text: 'ROADS AND TRAFFIC ADMINISTRATION',
                    fontSize: 18,
                    fontFamily: 'Bold',
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
              child: Card(
                elevation: 5,
                child: Container(
                  width: double.infinity,
                  height: 600,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/cdo.png',
                                          height: 125,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            TextWidget(
                                              text:
                                                  'REPUBLIC OF THE PHILIPPINES',
                                              fontSize: 16,
                                              fontFamily: 'Medium',
                                            ),
                                            TextWidget(
                                              text: 'CITY OF CAGAYAN DE ORO',
                                              fontSize: 16,
                                              fontFamily: 'Medium',
                                            ),
                                            TextWidget(
                                              text:
                                                  'ROADS AND TRAFFIC ADMINISTRATION',
                                              fontSize: 16,
                                              fontFamily: 'Medium',
                                            ),
                                            TextWidget(
                                              text: 'OFFICIAL SYSTEM',
                                              fontSize: 16,
                                              fontFamily: 'Medium',
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Image.asset(
                                          'assets/images/rta.png',
                                          height: 125,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Card(
                                      elevation: 10,
                                      child: Container(
                                        width: 450,
                                        height: 475,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: primary,
                                            width: 2,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Icon(
                                                Icons.account_circle,
                                                size: 150,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              TextWidget(
                                                text: 'OFFICER. JUAN DELA CRUZ',
                                                fontSize: 24,
                                                fontFamily: 'Bold',
                                                color: primary,
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      TextWidget(
                                                        text: 'Email Address',
                                                        fontSize: 14,
                                                        color: primary,
                                                        fontFamily: 'Bold',
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      TextWidget(
                                                        text: 'Badge Number',
                                                        fontSize: 14,
                                                        color: primary,
                                                        fontFamily: 'Bold',
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      TextWidget(
                                                        text: 'Position',
                                                        fontSize: 14,
                                                        color: primary,
                                                        fontFamily: 'Bold',
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      TextWidget(
                                                        text: 'Station',
                                                        fontSize: 14,
                                                        color: primary,
                                                        fontFamily: 'Bold',
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      TextWidget(
                                                        text: 'Gender',
                                                        fontSize: 14,
                                                        color: primary,
                                                        fontFamily: 'Bold',
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        height: 35,
                                                        width: 300,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                            color: primary,
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: TextWidget(
                                                            text:
                                                                'juandelacruz@gmail.com',
                                                            fontSize: 14,
                                                            color: primary,
                                                            fontFamily: 'Bold',
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 35,
                                                        width: 300,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                            color: primary,
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: TextWidget(
                                                            text: '1234qwerty',
                                                            fontSize: 14,
                                                            color: primary,
                                                            fontFamily: 'Bold',
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 35,
                                                        width: 300,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                            color: primary,
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: TextWidget(
                                                            text: 'Team Leader',
                                                            fontSize: 14,
                                                            color: primary,
                                                            fontFamily: 'Bold',
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 35,
                                                        width: 300,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                            color: primary,
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: TextWidget(
                                                            text:
                                                                'USTP Highway',
                                                            fontSize: 14,
                                                            color: primary,
                                                            fontFamily: 'Bold',
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 35,
                                                        width: 300,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                            color: primary,
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: TextWidget(
                                                            text: 'Male',
                                                            fontSize: 14,
                                                            color: primary,
                                                            fontFamily: 'Bold',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.refresh),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.more_vert),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.circle,
                                                color: green,
                                                size: 15,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              TextWidget(
                                                text: 'Paid',
                                                fontSize: 14,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.circle,
                                                color: Colors.blue,
                                                size: 15,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              TextWidget(
                                                text: 'Standby',
                                                fontSize: 14,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.circle,
                                                color: Colors.amber,
                                                size: 15,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              TextWidget(
                                                text: 'Warning',
                                                fontSize: 14,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.circle,
                                                color: Colors.red,
                                                size: 15,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              TextWidget(
                                                text: 'Unpaid',
                                                fontSize: 14,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 100,
                                      ),
                                      TextWidget(
                                        text: 'Tickets Issued by You',
                                        fontSize: 18,
                                        fontFamily: 'Bold',
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 575,
                                    child: Divider(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  for (int i = 0; i < 100; i++)
                                    Column(
                                      children: [
                                        SizedBox(
                                          width: 575,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.circle,
                                                color: green,
                                                size: 15,
                                              ),
                                              TextWidget(
                                                text: 'No. TCT 2023 - 45790',
                                                fontSize: 12,
                                              ),
                                              TextWidget(
                                                text: 'Badge #12345',
                                                fontSize: 12,
                                              ),
                                              TextWidget(
                                                text:
                                                    'November 01, 2023 | 1:35 PM',
                                                fontSize: 12,
                                              ),
                                              TextWidget(
                                                text: '₱500',
                                                fontSize: 12,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                            width: 575, child: Divider()),
                                      ],
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
