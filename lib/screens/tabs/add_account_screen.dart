import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rta_web/utlis/colors.dart';
import 'package:rta_web/widgets/button_widget.dart';
import 'package:rta_web/widgets/drawer_widget.dart';
import 'package:rta_web/widgets/text_widget.dart';
import 'package:rta_web/widgets/textfield_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AddAccountTab extends StatefulWidget {
  const AddAccountTab({super.key});

  @override
  State<AddAccountTab> createState() => _AddAccountTabState();
}

class _AddAccountTabState extends State<AddAccountTab> {
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
            Row(
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
                    ),
                  );
                }),
                TextWidget(
                  text: 'USER MANAGEMENT',
                  fontSize: 18,
                  fontFamily: 'Bold',
                ),
              ],
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
                          TextWidget(
                            text: 'CREATE CASHIER',
                            fontSize: 28,
                            fontFamily: 'Bold',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: 'Add New Cashier Account',
                                    fontSize: 22,
                                    fontFamily: 'Bold',
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextWidget(
                                    text: 'Information',
                                    fontSize: 18,
                                    fontFamily: 'Bold',
                                    decoration: TextDecoration.underline,
                                  ),
                                  Row(
                                    children: [
                                      TextFieldWidget(
                                        controller: fname,
                                        label: 'Firstname',
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      TextFieldWidget(
                                        controller: lname,
                                        label: 'Lastname',
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFieldWidget(
                                    width: 500,
                                    controller: email,
                                    label: 'Email',
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      TextFieldWidget(
                                        controller: badge,
                                        label: 'Badge No.',
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      TextFieldWidget(
                                        controller: position,
                                        label: 'Position',
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      TextFieldWidget(
                                        controller: station,
                                        label: 'Station',
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      TextFieldWidget(
                                        controller: gender,
                                        label: 'Gender',
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextWidget(
                                    text: 'Username & Password',
                                    fontSize: 18,
                                    fontFamily: 'Bold',
                                    decoration: TextDecoration.underline,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFieldWidget(
                                    width: 500,
                                    controller: username,
                                    label: 'Username',
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      TextFieldWidget(
                                        isObscure: true,
                                        showEye: true,
                                        controller: password,
                                        label: 'Password',
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      TextFieldWidget(
                                        isObscure: true,
                                        showEye: true,
                                        controller: confirmpassword,
                                        label: 'Confirm Password',
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Center(
                                      child: ButtonWidget(
                                        height: 50,
                                        width: 500,
                                        fontSize: 16,
                                        label: 'CONTINUE',
                                        onPressed: () {},
                                        color: green,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 100, top: 50),
                                child: Card(
                                  elevation: 10,
                                  child: Container(
                                    width: 450,
                                    height: 400,
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
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: TextWidget(
                                              text: 'APPROVAL',
                                              fontSize: 18,
                                              fontFamily: 'Bold',
                                              color: primary,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Center(
                                            child: TextFieldWidget(
                                              width: 350,
                                              controller: admin,
                                              label: 'Special admin',
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Center(
                                            child: TextFieldWidget(
                                              width: 350,
                                              showEye: true,
                                              isObscure: true,
                                              controller: code,
                                              label: 'Code',
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 50,
                                          ),
                                          Center(
                                            child: TextWidget(
                                              text:
                                                  'This action can solely be approved by the special',
                                              fontSize: 10,
                                              color: Colors.grey,
                                              fontFamily: 'Regular',
                                            ),
                                          ),
                                          Center(
                                            child: TextWidget(
                                              text:
                                                  'administrator incritely woven into the system.',
                                              fontSize: 10,
                                              color: Colors.grey,
                                              fontFamily: 'Regular',
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Center(
                                            child: ButtonWidget(
                                              label: 'Confirm',
                                              onPressed: () {},
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
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
