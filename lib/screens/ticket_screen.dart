import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rta_web/screens/auth/login_screen.dart';
import 'package:rta_web/utlis/colors.dart';
import 'package:rta_web/widgets/button_widget.dart';

import 'package:rta_web/widgets/text_widget.dart';
import 'package:rta_web/widgets/textfield_widget.dart';
import 'package:rta_web/widgets/toast_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TicketScreen extends StatefulWidget {
  dynamic data;

  TicketScreen({
    super.key,
    required this.data,
  });

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
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
    final Stream<DocumentSnapshot> userData = FirebaseFirestore.instance
        .collection('Users')
        .doc(widget.data['uid'])
        .snapshots();
    return Scaffold(
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
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
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
                  const Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ButtonWidget(
                      color: Colors.amber,
                      label: 'Update Status',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ButtonWidget(
                                    color: Colors.green,
                                    label: 'Mark as Paid',
                                    onPressed: () async {
                                      await FirebaseFirestore.instance
                                          .collection('Tickets')
                                          .doc(widget.data.id)
                                          .update({'status': 'Paid'});

                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      showToast('Ticket status updated!');
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ButtonWidget(
                                    color: Colors.red,
                                    label: 'Mark as Unpaid',
                                    onPressed: () async {
                                      await FirebaseFirestore.instance
                                          .collection('Tickets')
                                          .doc(widget.data.id)
                                          .update({'status': 'Unpaid'});

                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      showToast('Ticket status updated!');
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ButtonWidget(
                                    color: Colors.blue,
                                    label: 'Mark as Standby',
                                    onPressed: () async {
                                      await FirebaseFirestore.instance
                                          .collection('Tickets')
                                          .doc(widget.data.id)
                                          .update({'status': 'Standby'});

                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      showToast('Ticket status updated!');
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ButtonWidget(
                                    color: Colors.amber,
                                    label: 'Mark as Warning',
                                    onPressed: () async {
                                      await FirebaseFirestore.instance
                                          .collection('Tickets')
                                          .doc(widget.data.id)
                                          .update({'status': 'Warning'});

                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      showToast('Ticket status updated!');
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
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
                              Card(
                                elevation: 10,
                                child: Container(
                                  width: 550,
                                  height: 550,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextWidget(
                                              text:
                                                  'Ticket Apprehension Issued',
                                              fontSize: 18,
                                              color: Colors.red,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                TextWidget(
                                                  text: 'Time & Date Issued:',
                                                  fontSize: 13,
                                                  color: Colors.red,
                                                ),
                                                TextWidget(
                                                  text: DateFormat.yMMMd()
                                                      .add_jm()
                                                      .format(widget
                                                          .data['dateTime']
                                                          .toDate()),
                                                  fontSize: 13,
                                                  color: Colors.red,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Divider(),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 250,
                                              height: 400,
                                              child: Column(
                                                children: [
                                                  Center(
                                                    child: TextWidget(
                                                      text:
                                                          'No. ${widget.data['refno']}',
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/immigration-officer.png',
                                                        height: 50,
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      StreamBuilder<
                                                              DocumentSnapshot>(
                                                          stream: userData,
                                                          builder: (context,
                                                              AsyncSnapshot<
                                                                      DocumentSnapshot>
                                                                  snapshot) {
                                                            if (!snapshot
                                                                .hasData) {
                                                              return const Center(
                                                                  child: Text(
                                                                      'Loading'));
                                                            } else if (snapshot
                                                                .hasError) {
                                                              return const Center(
                                                                  child: Text(
                                                                      'Something went wrong'));
                                                            } else if (snapshot
                                                                    .connectionState ==
                                                                ConnectionState
                                                                    .waiting) {
                                                              return const Center(
                                                                  child:
                                                                      CircularProgressIndicator());
                                                            }
                                                            dynamic data =
                                                                snapshot.data;
                                                            return Container(
                                                              height: 115,
                                                              width: 175,
                                                              color: Colors
                                                                  .blue[100],
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        5.0),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    TextWidget(
                                                                      text:
                                                                          'Ticket issued by:',
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    TextWidget(
                                                                      text:
                                                                          'Badge #: ${data['badge']}',
                                                                      fontSize:
                                                                          11,
                                                                    ),
                                                                    TextWidget(
                                                                      text:
                                                                          'Name: ${data['fname']} ${data['lname']}',
                                                                      fontSize:
                                                                          11,
                                                                    ),
                                                                    TextWidget(
                                                                      text:
                                                                          'Stationed: ${data['station']}',
                                                                      fontSize:
                                                                          11,
                                                                    ),
                                                                    TextWidget(
                                                                      text:
                                                                          'Position: ${data['position']}',
                                                                      fontSize:
                                                                          11,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          }),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  const Divider(),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextWidget(
                                                    maxLines: 5,
                                                    text: '''
SCAN VIA QR CODE TO PAY or PAY CASH IN AUTHORIZED RTA OFFICER IN CITY HALL
''',
                                                    fontSize: 11,
                                                    color: Colors.grey,
                                                  ),
                                                  SizedBox(
                                                    width: 200,
                                                    height: 150,
                                                    child: QrImageView(
                                                      data: widget.data.id,
                                                      version: QrVersions.auto,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            SizedBox(
                                              width: 250,
                                              height: 450,
                                              child: Column(
                                                children: [
                                                  Center(
                                                    child: TextWidget(
                                                      text:
                                                          'TRAFFIC VIOLATIONS AND PENALTIES',
                                                      fontSize: 13,
                                                      fontFamily: 'Bold',
                                                    ),
                                                  ),
                                                  const Divider(),
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        TextWidget(
                                                          text:
                                                              'FINES/PENALTIES',
                                                          fontSize: 14,
                                                          fontFamily: 'Bold',
                                                        ),
                                                        TextWidget(
                                                          text:
                                                              'OFFENSE FREQUENCY',
                                                          fontSize: 10,
                                                          color: Colors.grey,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Divider(),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      TextWidget(
                                                        text: 'CODE',
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                      TextWidget(
                                                        text: 'VIOLATION',
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                      TextWidget(
                                                        text: 'Fine',
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                    ],
                                                  ),
                                                  for (int i = 0;
                                                      i <
                                                          widget
                                                              .data[
                                                                  'violations']
                                                              .length;
                                                      i++)
                                                    Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            TextWidget(
                                                              text: widget.data[
                                                                      'violations']
                                                                  [i]['code'],
                                                              fontSize: 11,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                            TextWidget(
                                                              text: widget.data[
                                                                      'violations']
                                                                  [i]['desc'],
                                                              fontSize: 11,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                            TextWidget(
                                                              text:
                                                                  'P${widget.data['violations'][i]['fine']}',
                                                              fontSize: 11,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          ],
                                                        ),
                                                        const Divider(),
                                                      ],
                                                    ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      TextWidget(
                                                        text: 'Total:',
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                      TextWidget(
                                                        text: '',
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                      TextWidget(
                                                        text:
                                                            'P${widget.data['violations'].fold(0.0, (prev, element) {
                                                          String fine = element[
                                                                  'fine']
                                                              .replaceAll(',',
                                                                  ''); // Remove commas
                                                          return prev +
                                                              double.parse(
                                                                  fine);
                                                        })}',
                                                        fontSize: 18,
                                                        color: Colors.red,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
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
                                      height: 20,
                                    ),
                                    Column(
                                      children: [
                                        Card(
                                          elevation: 10,
                                          child: Container(
                                            width: 550,
                                            height: 320,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: primary,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  TextWidget(
                                                    text:
                                                        'VIOLATOR INFORMATION',
                                                    fontSize: 18,
                                                    fontFamily: 'Bold',
                                                    color: primary,
                                                  ),
                                                  const Divider(),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.account_circle,
                                                        size: 50,
                                                      ),
                                                      const SizedBox(
                                                          height: 140,
                                                          child:
                                                              VerticalDivider()),
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
                                                          Row(
                                                            children: [
                                                              TextWidget(
                                                                text:
                                                                    widget.data[
                                                                        'name'],
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'Medium',
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              width: 300,
                                                              child: Divider()),
                                                          TextWidget(
                                                            text:
                                                                'Address: ${widget.data['address']}',
                                                            fontSize: 13,
                                                            fontFamily:
                                                                'Regular',
                                                            color: Colors.black,
                                                          ),
                                                          const SizedBox(
                                                              width: 300,
                                                              child: Divider()),
                                                          TextWidget(
                                                            text:
                                                                'License Number: ${widget.data['licenseno']}',
                                                            fontSize: 13,
                                                            fontFamily:
                                                                'Regular',
                                                            color: Colors.black,
                                                          ),
                                                          const SizedBox(
                                                              width: 300,
                                                              child: Divider()),
                                                          Row(
                                                            children: [
                                                              TextWidget(
                                                                text:
                                                                    'Expiry: ${widget.data['expiry']}',
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'Regular',
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              const SizedBox(
                                                                width: 100,
                                                              ),
                                                              TextWidget(
                                                                text: 'Prof',
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    'Regular',
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              const SizedBox(
                                                                width: 5,
                                                              ),
                                                              Icon(
                                                                widget.data['licensetype'] ==
                                                                        'Prof'
                                                                    ? Icons
                                                                        .check_box
                                                                    : Icons
                                                                        .check_box_outline_blank,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              TextWidget(
                                                                text:
                                                                    'Non-Prof',
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    'Regular',
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              const SizedBox(
                                                                width: 5,
                                                              ),
                                                              Icon(
                                                                widget.data['licensetype'] ==
                                                                        'Non Prof'
                                                                    ? Icons
                                                                        .check_box
                                                                    : Icons
                                                                        .check_box_outline_blank,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              TextWidget(
                                                                text: 'SP',
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    'Regular',
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              const SizedBox(
                                                                width: 5,
                                                              ),
                                                              Icon(
                                                                widget.data['licensetype'] ==
                                                                        'SP'
                                                                    ? Icons
                                                                        .check_box
                                                                    : Icons
                                                                        .check_box_outline_blank,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              width: 300,
                                                              child: Divider()),
                                                          Row(
                                                            children: [
                                                              TextWidget(
                                                                text:
                                                                    'Birthday: ${widget.data['bday']}',
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'Regular',
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              const SizedBox(
                                                                width: 85,
                                                              ),
                                                              TextWidget(
                                                                text:
                                                                    'Nationality: ${widget.data['nationality']}',
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'Regular',
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              width: 300,
                                                              child: Divider()),
                                                          Row(
                                                            children: [
                                                              TextWidget(
                                                                text:
                                                                    'Height: ${widget.data['height']}cm',
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'Regular',
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              const SizedBox(
                                                                width: 96,
                                                              ),
                                                              TextWidget(
                                                                text:
                                                                    'Weight: ${widget.data['weight']}kg',
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'Regular',
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              width: 300,
                                                              child: Divider()),
                                                          Row(
                                                            children: [
                                                              TextWidget(
                                                                text:
                                                                    'Gender: ${widget.data['gender']}',
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'Regular',
                                                                color: Colors
                                                                    .black,
                                                              ),
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
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Card(
                                          elevation: 10,
                                          child: Container(
                                            width: 500,
                                            height: 250,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: primary,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  TextWidget(
                                                    text: 'VEHICLE INFORMATION',
                                                    fontSize: 18,
                                                    fontFamily: 'Bold',
                                                    color: primary,
                                                  ),
                                                  const Divider(),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.account_circle,
                                                        size: 50,
                                                      ),
                                                      const SizedBox(
                                                          height: 140,
                                                          child:
                                                              VerticalDivider()),
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
                                                          Row(
                                                            children: [
                                                              TextWidget(
                                                                text:
                                                                    '${widget.data['plateno']}',
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'Medium',
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              width: 300,
                                                              child: Divider()),
                                                          TextWidget(
                                                            text:
                                                                'Ownder: ${widget.data['owner']}',
                                                            fontSize: 13,
                                                            fontFamily:
                                                                'Regular',
                                                            color: Colors.black,
                                                          ),
                                                          const SizedBox(
                                                              width: 300,
                                                              child: Divider()),
                                                          TextWidget(
                                                            text:
                                                                'Address: ${widget.data['owneraddress']}',
                                                            fontSize: 13,
                                                            fontFamily:
                                                                'Regular',
                                                            color: Colors.black,
                                                          ),
                                                          const SizedBox(
                                                              width: 300,
                                                              child: Divider()),
                                                          TextWidget(
                                                            text:
                                                                'Color: ${widget.data['color']}',
                                                            fontSize: 13,
                                                            fontFamily:
                                                                'Regular',
                                                            color: Colors.black,
                                                          ),
                                                          const SizedBox(
                                                              width: 300,
                                                              child: Divider()),
                                                          TextWidget(
                                                            text:
                                                                'Model: ${widget.data['model']}',
                                                            fontSize: 13,
                                                            fontFamily:
                                                                'Regular',
                                                            color: Colors.black,
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
                                  ],
                                ),
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
