import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:rta_web/utlis/colors.dart';
import 'package:rta_web/widgets/button_widget.dart';
import 'package:rta_web/widgets/drawer_widget.dart';
import 'package:rta_web/widgets/text_widget.dart';
import 'package:rta_web/widgets/textfield_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AllTicketsTab extends StatefulWidget {
  const AllTicketsTab({super.key});

  @override
  State<AllTicketsTab> createState() => _AllTicketsTabState();
}

class _AllTicketsTabState extends State<AllTicketsTab> {
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

  final searchController = TextEditingController();
  String nameSearched = '';

  @override
  Widget build(BuildContext context) {
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
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 10, 50, 20),
                      child: Container(
                        height: 50,
                        width: 350,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                            style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Regular',
                                fontSize: 14),
                            onChanged: (value) {
                              setState(() {
                                nameSearched = value;
                              });
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.grey[200],
                                labelStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                                hintText: 'Search Reference Number',
                                hintStyle: const TextStyle(
                                    fontFamily: 'Bold', color: Colors.black),
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                )),
                            controller: searchController,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Tickets')
                      .where('refno',
                          isGreaterThanOrEqualTo:
                              toBeginningOfSentenceCase(nameSearched))
                      .where('refno',
                          isLessThan:
                              '${toBeginningOfSentenceCase(nameSearched)}z')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
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
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                      child: Card(
                        elevation: 5,
                        child: Container(
                          width: 950,
                          height: 600,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              opacity: 0.05,
                              image: AssetImage(
                                'assets/images/rta.png',
                              ),
                              fit: BoxFit.fitHeight,
                            ),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  setState(() {});
                                                },
                                                icon: const Icon(Icons.refresh),
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
                                                        CrossAxisAlignment
                                                            .center,
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
                                                        CrossAxisAlignment
                                                            .center,
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
                                                        CrossAxisAlignment
                                                            .center,
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
                                                        CrossAxisAlignment
                                                            .center,
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
                                                text: 'All Tickets Issued',
                                                fontSize: 18,
                                                fontFamily: 'Bold',
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 800,
                                            child: Divider(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          for (int i = 0;
                                              i < data.docs.length;
                                              i++)
                                            Builder(builder: (context) {
                                              return Column(
                                                children: [
                                                  SizedBox(
                                                    width: 800,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Icon(
                                                          Icons.circle,
                                                          color: data.docs[i][
                                                                      'status'] ==
                                                                  'Paid'
                                                              ? green
                                                              : data.docs[i][
                                                                          'status'] ==
                                                                      'Standby'
                                                                  ? Colors.blue
                                                                  : data.docs[i]
                                                                              [
                                                                              'status'] ==
                                                                          'Warning'
                                                                      ? Colors
                                                                          .orange
                                                                      : Colors
                                                                          .red,
                                                          size: 15,
                                                        ),
                                                        TextWidget(
                                                          text:
                                                              'No. ${data.docs[i]['refno']}',
                                                          fontSize: 18,
                                                        ),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        TextWidget(
                                                          text:
                                                              '${data.docs[i]['name']}',
                                                          fontSize: 18,
                                                        ),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        TextWidget(
                                                          text: DateFormat
                                                                  .yMMMd()
                                                              .add_jm()
                                                              .format(data
                                                                  .docs[i][
                                                                      'dateTime']
                                                                  .toDate()),
                                                          fontSize: 18,
                                                        ),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        TextWidget(
                                                          text:
                                                              'P${data.docs[i]['violations'].fold(0.0, (prev, element) {
                                                            String fine = element[
                                                                    'fine']
                                                                .replaceAll(',',
                                                                    ''); // Remove commas
                                                            return prev +
                                                                double.parse(
                                                                    fine);
                                                          })}',
                                                          fontSize: 18,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                      width: 800,
                                                      child: Divider()),
                                                ],
                                              );
                                            }),
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
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
