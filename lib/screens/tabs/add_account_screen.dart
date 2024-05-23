import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rta_web/services/add_user.dart';
import 'package:rta_web/utlis/colors.dart';
import 'package:rta_web/widgets/button_widget.dart';
import 'package:rta_web/widgets/drawer_widget.dart';
import 'package:rta_web/widgets/text_widget.dart';
import 'package:rta_web/widgets/textfield_widget.dart';
import 'package:rta_web/widgets/toast_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AddAccountTab extends StatefulWidget {
  const AddAccountTab({super.key});

  @override
  State<AddAccountTab> createState() => _AddAccountTabState();
}

class _AddAccountTabState extends State<AddAccountTab> {
  String _selectedOption = 'Officer';
  String _selectedOption1 = 'Male';
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

  bool isVerified = false;

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
                            TextWidget(
                              text: 'CREATE USER',
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
                                      text: 'Add New User Account',
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
                                    Row(
                                      children: [
                                        TextFieldWidget(
                                          controller: email,
                                          label: 'Email',
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              text: const TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'User Type',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: 'Bold',
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: ' *',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: 'Bold',
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              width: 275,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: DropdownButton<String>(
                                                  underline: const SizedBox(),
                                                  value: _selectedOption,
                                                  hint: const Text(
                                                      'Select user type'),
                                                  items: <String>[
                                                    'Officer',
                                                    'Cashier'
                                                  ].map((String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      _selectedOption =
                                                          newValue!;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
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
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              text: const TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'Gender',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: 'Bold',
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: ' *',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: 'Bold',
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              width: 275,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: DropdownButton<String>(
                                                  underline: const SizedBox(),
                                                  value: _selectedOption1,
                                                  hint: const Text(
                                                      'Select gender'),
                                                  items: <String>[
                                                    'Male',
                                                    'Female'
                                                  ].map((String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      _selectedOption1 =
                                                          newValue!;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
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
                                    isVerified
                                        ? Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Center(
                                              child: ButtonWidget(
                                                height: 50,
                                                width: 500,
                                                fontSize: 16,
                                                label: 'CONTINUE',
                                                onPressed: () {
                                                  if (password.text ==
                                                      confirmpassword.text) {
                                                    if (isVerified) {
                                                      register(context);
                                                    } else {
                                                      showToast(
                                                          'Please input verification first!');
                                                    }
                                                  } else {
                                                    showToast(
                                                        'Password do not match!');
                                                  }
                                                },
                                                color: green,
                                              ),
                                            ),
                                          )
                                        : const SizedBox(),
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
                                                text: isVerified
                                                    ? 'APPROVED'
                                                    : 'APPROVAL',
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
                                            !isVerified
                                                ? Center(
                                                    child: ButtonWidget(
                                                      label: 'Confirm',
                                                      onPressed: () {
                                                        if (admin.text ==
                                                                'admin001' &&
                                                            code.text ==
                                                                'admin001') {
                                                          showToast(
                                                              'Credentials approved!');
                                                          setState(() {
                                                            isVerified = true;
                                                          });
                                                        } else {
                                                          showToast(
                                                              'Invalied credentials!');
                                                        }
                                                      },
                                                    ),
                                                  )
                                                : const SizedBox(),
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
      ),
    );
  }

  register(context) async {
    try {
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: '${username.text}@rta.com', password: password.text);

      addUser(
          fname.text,
          lname.text,
          email.text,
          _selectedOption,
          badge.text,
          position.text,
          station.text,
          _selectedOption1,
          username.text,
          user.user!.uid);

      showToast('Account created succesfully!');
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const AddAccountTab()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showToast('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        showToast('The email address is not valid.');
      } else {
        showToast(e.toString());
      }
    } on Exception catch (e) {
      showToast("An error occurred: $e");
    }
  }
}
