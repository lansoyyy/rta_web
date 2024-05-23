import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rta_web/utlis/colors.dart';
import 'package:rta_web/widgets/button_widget.dart';
import 'package:rta_web/widgets/drawer_widget.dart';
import 'package:rta_web/widgets/text_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Color> colors = [
    Colors.blue,
    Colors.purple,
    Colors.green,
    Colors.amber,
    Colors.teal,
    Colors.red,
    Colors.brown,
    Colors.blue,
    Colors.purple,
    Colors.green,
    Colors.amber,
    Colors.teal,
    Colors.red,
    Colors.brown,
    Colors.blue,
    Colors.purple,
    Colors.green,
    Colors.amber,
    Colors.teal,
    Colors.red,
  ];

  final scroll = ScrollController();
  @override
  Widget build(BuildContext context) {
    final List<SalesData> chartData = [
      SalesData(DateTime(2010), 35),
      SalesData(DateTime(2011), 28),
      SalesData(DateTime(2012), 34),
      SalesData(DateTime(2013), 32),
      SalesData(DateTime(2014), 40)
    ];
    return Scaffold(
      drawer: const DrawerWidget(),
      backgroundColor: Colors.brown[50],
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/back.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Scrollbar(
                  controller: scroll,
                  child: SingleChildScrollView(
                    controller: scroll,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i < violations.length; i++)
                          cardWidget1(
                            violations[i],
                            '301',
                            colors[i],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Tickets')
                          .orderBy('dateTime', descending: true)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          print(snapshot.error);
                          return const Center(child: Text('Error'));
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: Center(
                                child: CircularProgressIndicator(
                              color: Colors.black,
                            )),
                          );
                        }

                        final data = snapshot.requireData;
                        return Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: SizedBox(
                            width: 1000,
                            height: 350,
                            child: SfCartesianChart(
                                primaryXAxis: DateTimeAxis(),
                                series: <CartesianSeries>[
                                  // Renders line chart
                                  LineSeries<SalesData, DateTime>(
                                      dataSource: [
                                        for (int i = 0;
                                            i < data.docs.length;
                                            i++)
                                          SalesData(
                                              data.docs[i]['dateTime'].toDate(),
                                              data.docs.length.toDouble())
                                      ],
                                      xValueMapper: (SalesData sales, _) =>
                                          sales.year,
                                      yValueMapper: (SalesData sales, _) =>
                                          sales.sales)
                                ]),
                          ),
                        );
                      }),
                  const SizedBox(
                    width: 20,
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Tickets')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          print(snapshot.error);
                          return const Center(child: Text('Error'));
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: Center(
                                child: CircularProgressIndicator(
                              color: Colors.black,
                            )),
                          );
                        }

                        final data = snapshot.requireData;
                        return Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: SizedBox(
                            width: 350,
                            height: 350,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextWidget(
                                    text: 'TOTAL ISSUED TICKET',
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: 100,
                                  ),
                                  TextWidget(
                                    text: data.docs.length.toString(),
                                    fontSize: 75,
                                    color: Colors.black,
                                    fontFamily: 'Bold',
                                    decoration: TextDecoration.underline,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < 4; i++)
                    cardWidget(
                      i == 0
                          ? 'Paid'
                          : i == 1
                              ? 'Standby'
                              : i == 2
                                  ? 'Warning'
                                  : 'Unpaid',
                      i == 0
                          ? 'Paid'
                          : i == 1
                              ? 'Standby'
                              : i == 2
                                  ? 'Warning'
                                  : 'Unpaid',
                      colors[i],
                    ),
                  Builder(builder: (context) {
                    return ButtonWidget(
                      height: 75,
                      width: 350,
                      fontSize: 24,
                      label: 'MENU',
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      color: green,
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardWidget1(String label, String numbers, Color color) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Tickets').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(child: Text('Error'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              )),
            );
          }

          final data = snapshot.requireData;

          int count = 0; // Initialize count

          for (int i = 0; i < data.docs.length; i++) {
            var violations = data.docs[i]['violations'];
            for (int j = 0; j < violations.length; j++) {
              if (violations[j]['desc'] == label) {
                count += 1;
              }
            }
          }
          return count > 0
              ? Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 175,
                        height: 125,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: TextWidget(
                                  text: label,
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextWidget(
                                text: count.toString(),
                                fontSize: 48,
                                color: Colors.black,
                                fontFamily: 'Bold',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 175,
                        height: 10,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(
                              10,
                            ),
                            bottomRight: Radius.circular(
                              10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox();
        });
  }

  Widget cardWidget(String label, String numbers, Color color) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Tickets')
            .where('status', isEqualTo: numbers)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(child: Text('Error'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              )),
            );
          }

          final data = snapshot.requireData;
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 175,
                  height: 125,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: TextWidget(
                            text: label,
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextWidget(
                          text: data.docs.length.toString(),
                          fontSize: 48,
                          color: Colors.black,
                          fontFamily: 'Bold',
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 175,
                  height: 10,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(
                        10,
                      ),
                      bottomRight: Radius.circular(
                        10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  List<String> violations = [
    'RECKLESS DRIVING',
    'OBSTRUCTION',
    'Illegal Parking Physical Apprehension',
    'DISREGARDING TRAFFIC SIGNS',
    'DRIVING UNDER INFLUENCE OF DRUGS',
    'DRIVING UNDER INFLUENCE OF Liquor',
    'Overspeeding Physical Apprehension',
    'NO MOTORCYCLE HELMET',
    'NO DRIVER\'S ID',
    'CR/OR NOT CARRIED',
    'Dress Code for Riders',
    'DRIVING AGAINST TRAFFIC',
    'DRIVING IN A PLACE NOT FOR TRAFFIC',
    'EMPLOYING DISCOURTEOUS/ARROGANT DRIVER/CONDUCTOR',
    'FAILURE TO USE SEATBELT',
    'FAKE DRIVER\'S LICENSE/SPURIOUS DRIVER\'S LICENSE',
    'FAKE NUMBER PLATES',
    'NO BRAKE LIGHTS',
    'NO/CUT MUFFLER',
    'CHILDREN\'S SAFETY ON MOTORCYCLE ACT OF 2015',
  ];
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
