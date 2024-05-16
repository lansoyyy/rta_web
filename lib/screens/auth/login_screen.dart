import 'package:flutter/material.dart';
import 'package:rta_web/screens/home_screen.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                width: 350,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: primary.withOpacity(0.2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextWidget(
                                text: 'ADMIN',
                                fontSize: 14,
                                fontFamily: 'Bold',
                                color: primary,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          TextWidget(
                            text: 'ENFORCER',
                            fontSize: 14,
                            fontFamily: 'Bold',
                            color: green,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
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
                          label: 'Admin username',
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
                            if (username.text == 'admin001' &&
                                password.text == 'admin001') {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                            } else {
                              showToast('Invalid admin credentials!');
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
    );
  }
}
