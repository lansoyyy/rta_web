import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:rta_web/screens/auth/login_screen.dart';
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

  final searchController = TextEditingController();
  String nameSearched = '';

  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot> userData = FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
    return Scaffold(
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
                    const SizedBox(
                      width: 50,
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
                      padding: const EdgeInsets.fromLTRB(50, 10, 20, 20),
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
                    IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text(
                                    'Logout Confirmation',
                                    style: TextStyle(
                                        fontFamily: 'QBold',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  content: const Text(
                                    'Are you sure you want to Logout?',
                                    style: TextStyle(fontFamily: 'QRegular'),
                                  ),
                                  actions: <Widget>[
                                    MaterialButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      child: const Text(
                                        'Close',
                                        style: TextStyle(
                                            fontFamily: 'QRegular',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    MaterialButton(
                                      onPressed: () async {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginScreen()));
                                      },
                                      child: const Text(
                                        'Continue',
                                        style: TextStyle(
                                            fontFamily: 'QRegular',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ));
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
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
                    height: 575,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StreamBuilder<DocumentSnapshot>(
                                    stream: userData,
                                    builder: (context,
                                        AsyncSnapshot<DocumentSnapshot>
                                            snapshot) {
                                      if (!snapshot.hasData) {
                                        return const Center(
                                            child: Text('Loading'));
                                      } else if (snapshot.hasError) {
                                        return const Center(
                                            child:
                                                Text('Something went wrong'));
                                      } else if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      }
                                      dynamic data = snapshot.data;
                                      return Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                                      text:
                                                          'CITY OF CAGAYAN DE ORO',
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
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
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
                                                        text:
                                                            'Mr. ${data['fname']} ${data['lname']}',
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
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              TextWidget(
                                                                text:
                                                                    'Email Address',
                                                                fontSize: 14,
                                                                color: primary,
                                                                fontFamily:
                                                                    'Bold',
                                                              ),
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              TextWidget(
                                                                text:
                                                                    'Badge Number',
                                                                fontSize: 14,
                                                                color: primary,
                                                                fontFamily:
                                                                    'Bold',
                                                              ),
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              TextWidget(
                                                                text:
                                                                    'Position',
                                                                fontSize: 14,
                                                                color: primary,
                                                                fontFamily:
                                                                    'Bold',
                                                              ),
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              TextWidget(
                                                                text: 'Station',
                                                                fontSize: 14,
                                                                color: primary,
                                                                fontFamily:
                                                                    'Bold',
                                                              ),
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              TextWidget(
                                                                text: 'Gender',
                                                                fontSize: 14,
                                                                color: primary,
                                                                fontFamily:
                                                                    'Bold',
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
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                height: 35,
                                                                width: 300,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  border: Border
                                                                      .all(
                                                                    color:
                                                                        primary,
                                                                  ),
                                                                ),
                                                                child: Center(
                                                                  child:
                                                                      TextWidget(
                                                                    text: data[
                                                                        'email'],
                                                                    fontSize:
                                                                        14,
                                                                    color:
                                                                        primary,
                                                                    fontFamily:
                                                                        'Bold',
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
                                                                  color: Colors
                                                                      .white,
                                                                  border: Border
                                                                      .all(
                                                                    color:
                                                                        primary,
                                                                  ),
                                                                ),
                                                                child: Center(
                                                                  child:
                                                                      TextWidget(
                                                                    text: data[
                                                                        'badge'],
                                                                    fontSize:
                                                                        14,
                                                                    color:
                                                                        primary,
                                                                    fontFamily:
                                                                        'Bold',
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
                                                                  color: Colors
                                                                      .white,
                                                                  border: Border
                                                                      .all(
                                                                    color:
                                                                        primary,
                                                                  ),
                                                                ),
                                                                child: Center(
                                                                  child:
                                                                      TextWidget(
                                                                    text: data[
                                                                        'position'],
                                                                    fontSize:
                                                                        14,
                                                                    color:
                                                                        primary,
                                                                    fontFamily:
                                                                        'Bold',
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
                                                                  color: Colors
                                                                      .white,
                                                                  border: Border
                                                                      .all(
                                                                    color:
                                                                        primary,
                                                                  ),
                                                                ),
                                                                child: Center(
                                                                  child:
                                                                      TextWidget(
                                                                    text: data[
                                                                        'station'],
                                                                    fontSize:
                                                                        14,
                                                                    color:
                                                                        primary,
                                                                    fontFamily:
                                                                        'Bold',
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
                                                                  color: Colors
                                                                      .white,
                                                                  border: Border
                                                                      .all(
                                                                    color:
                                                                        primary,
                                                                  ),
                                                                ),
                                                                child: Center(
                                                                  child:
                                                                      TextWidget(
                                                                    text: data[
                                                                        'gender'],
                                                                    fontSize:
                                                                        14,
                                                                    color:
                                                                        primary,
                                                                    fontFamily:
                                                                        'Bold',
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
                                      );
                                    }),
                                const SizedBox(
                                  width: 50,
                                ),
                                StreamBuilder<QuerySnapshot>(
                                    stream: FirebaseFirestore.instance
                                        .collection('Tickets')
                                        .where('uid',
                                            isEqualTo: FirebaseAuth
                                                .instance.currentUser!.uid)
                                        .where('refno',
                                            isGreaterThanOrEqualTo:
                                                toBeginningOfSentenceCase(
                                                    nameSearched))
                                        .where('refno',
                                            isLessThan:
                                                '${toBeginningOfSentenceCase(nameSearched)}z')
                                        .snapshots(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (snapshot.hasError) {
                                        print(snapshot.error);
                                        return const Center(
                                            child: Text('Error'));
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
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {},
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
                                                width: 50,
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
                                          for (int i = 0;
                                              i < data.docs.length;
                                              i++)
                                            Builder(builder: (context) {
                                              return Column(
                                                children: [
                                                  SizedBox(
                                                    width: 575,
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
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
                                                                    ? Colors
                                                                        .blue
                                                                    : data.docs[i]['status'] ==
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
                                                            fontSize: 12,
                                                          ),
                                                          const SizedBox(
                                                            width: 20,
                                                          ),
                                                          TextWidget(
                                                            text:
                                                                '${data.docs[i]['name']}',
                                                            fontSize: 12,
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
                                                            fontSize: 12,
                                                          ),
                                                          const SizedBox(
                                                            width: 20,
                                                          ),
                                                          TextWidget(
                                                            text:
                                                                'P${data.docs[i]['violations'].fold(0.0, (prev, element) {
                                                              String fine = element[
                                                                      'fine']
                                                                  .replaceAll(
                                                                      ',',
                                                                      ''); // Remove commas
                                                              return prev +
                                                                  double.parse(
                                                                      fine);
                                                            })}',
                                                            fontSize: 12,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                      width: 575,
                                                      child: Divider()),
                                                ],
                                              );
                                            }),
                                        ],
                                      );
                                    }),
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
      ),
    );
  }
}
