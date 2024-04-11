import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rta_web/utlis/colors.dart';
import 'package:rta_web/widgets/button_widget.dart';
import 'package:rta_web/widgets/drawer_widget.dart';
import 'package:rta_web/widgets/text_widget.dart';
import 'package:rta_web/widgets/textfield_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class EnforcersTab extends StatefulWidget {
  const EnforcersTab({super.key});

  @override
  State<EnforcersTab> createState() => _EnforcersTabState();
}

class _EnforcersTabState extends State<EnforcersTab> {
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
                  width: 900,
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
                                                text: 'Man',
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
                                                text: 'Woman',
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
                                                text: 'Others',
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
                                                text: 'Admin',
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
                                        text: 'Admin & Officers',
                                        fontSize: 18,
                                        fontFamily: 'Bold',
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 750,
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
                                          width: 750,
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
                                                text: 'Juan Dela Cruz',
                                                fontSize: 18,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              TextWidget(
                                                text: 'Badge #123456',
                                                fontSize: 18,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              TextWidget(
                                                text:
                                                    'November 01, 2023 | 1:35 PM',
                                                fontSize: 18,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              TextWidget(
                                                text: 'Officer',
                                                fontSize: 18,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                            width: 750, child: Divider()),
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
