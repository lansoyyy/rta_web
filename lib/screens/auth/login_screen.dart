import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rta_web/screens/cashier_home_screen.dart';
import 'package:rta_web/screens/home_screen.dart';
import 'package:rta_web/screens/tabs/my_profile_tab.dart';
import 'package:rta_web/utlis/colors.dart';
import 'package:rta_web/widgets/button_widget.dart';
import 'package:rta_web/widgets/text_widget.dart';
import 'package:rta_web/widgets/textfield_widget.dart';
import 'package:rta_web/widgets/toast_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final username = TextEditingController();
  final password = TextEditingController();

  bool isadmin = true;
  bool isuser = false;
  bool iscashier = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/cdo.png',
                    height: 125,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidget(
                        text: 'REPUBLIC OF THE PHILIPPINES',
                        fontSize: 16,
                        fontFamily: 'Medium',
                      ),
                      TextWidget(
                        text: 'CITY OF CAGAYAN DE ORO',
                        fontSize: 16,
                        fontFamily: 'Medium',
                      ),
                      TextWidget(
                        text: 'ROADS AND TRAFFIC ADMINISTRATION',
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
                  width: 370,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isadmin = true;
                                  isuser = false;
                                  iscashier = false;
                                });
                              },
                              child: Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    100,
                                  ),
                                  color: grey.withOpacity(0.5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      TextWidget(
                                        text: 'Admin',
                                        fontSize: 12,
                                        fontFamily: 'Bold',
                                        color: primary,
                                      ),
                                      Icon(
                                        isadmin
                                            ? Icons.radio_button_checked
                                            : Icons.radio_button_off,
                                        color: isadmin ? secondary : primary,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isuser = true;
                                  isadmin = false;
                                  iscashier = false;
                                });
                              },
                              child: Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    100,
                                  ),
                                  color: grey.withOpacity(0.5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      TextWidget(
                                        text: 'Enforcer',
                                        fontSize: 12,
                                        fontFamily: 'Bold',
                                        color: primary,
                                      ),
                                      Icon(
                                        isuser
                                            ? Icons.radio_button_checked
                                            : Icons.radio_button_off,
                                        color: isuser ? secondary : primary,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isuser = false;
                                  isadmin = false;
                                  iscashier = true;
                                });
                              },
                              child: Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    100,
                                  ),
                                  color: grey.withOpacity(0.5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      TextWidget(
                                        text: 'Cashier',
                                        fontSize: 12,
                                        fontFamily: 'Bold',
                                        color: primary,
                                      ),
                                      Icon(
                                        iscashier
                                            ? Icons.radio_button_checked
                                            : Icons.radio_button_off,
                                        color: iscashier ? secondary : primary,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: 'Login',
                                fontSize: 14,
                                fontFamily: 'Bold',
                              ),
                              TextWidget(
                                text: 'Please input admin name and password',
                                fontSize: 12,
                                fontFamily: 'Regular',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: TextFieldWidget(
                            controller: username,
                            label: 'Username',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: TextFieldWidget(
                            showEye: true,
                            isObscure: true,
                            controller: password,
                            label: 'Password',
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Center(
                          child: ButtonWidget(
                            label: 'Enter',
                            onPressed: () {
                              if (isadmin) {
                                if (username.text == 'admin001' &&
                                    password.text == 'admin001') {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                                } else {
                                  showToast('Invalid admin credentials!');
                                }
                              } else {
                                login(context);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  login(context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: '${username.text}@rta.com', password: password.text);
      showToast('Logged in succesfully!');

      if (isuser) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MyProfileTab()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const CashierHomeScreen()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast("No user found with that email.");
      } else if (e.code == 'wrong-password') {
        showToast("Wrong password provided for that user.");
      } else if (e.code == 'invalid-email') {
        showToast("Invalid email provided.");
      } else if (e.code == 'user-disabled') {
        showToast("User account has been disabled.");
      } else {
        showToast("An error occurred: ${e.message}");
      }
    } on Exception catch (e) {
      showToast("An error occurred: $e");
    }
  }
}
