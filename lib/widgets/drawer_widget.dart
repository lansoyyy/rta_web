import 'package:flutter/material.dart';
import 'package:rta_web/screens/auth/login_screen.dart';
import 'package:rta_web/screens/home_screen.dart';
import 'package:rta_web/screens/tabs/add_account_screen.dart';
import 'package:rta_web/screens/tabs/alltickets_tab.dart';
import 'package:rta_web/screens/tabs/enforcers_tab.dart';
import 'package:rta_web/screens/tabs/my_profile_tab.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../utlis/colors.dart';
import 'text_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 250,
      color: Colors.white,
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Expanded(
                  child: SizedBox(),
                ),
                Builder(builder: (context) {
                  return IconButton(
                    onPressed: () {
                      Scaffold.of(context).closeDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 32,
                    ),
                  );
                }),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.dashboard),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
              title: TextWidget(
                text: 'Dashboard',
                fontSize: 14,
                fontFamily: 'Bold',
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.local_police_outlined),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const EnforcersTab()));
              },
              title: TextWidget(
                text: 'Enforcer List',
                fontSize: 14,
                fontFamily: 'Bold',
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.group_add_outlined),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const AddAccountTab()));
              },
              title: TextWidget(
                text: 'Add admin/officer/cashier',
                fontSize: 14,
                fontFamily: 'Bold',
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.list),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const AllTicketsTab()));
              },
              title: TextWidget(
                text: 'Ticket list',
                fontSize: 14,
                fontFamily: 'Bold',
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.warning_amber_outlined),
              onTap: () async {
                await launchUrlString(
                    'https://mmda.gov.ph/images/pdf/Home/REVISED-FINES-and-PENALTIES-by-alphabet-new-4-11-2019-01.pdf');
              },
              title: TextWidget(
                text: 'Code & Violations',
                fontSize: 14,
                fontFamily: 'Bold',
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              onTap: () {
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
                              onPressed: () => Navigator.of(context).pop(true),
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
              title: TextWidget(
                text: 'Logout',
                fontSize: 14,
                fontFamily: 'Bold',
              ),
            ),
            const Divider(),
          ],
        ),
      )),
    );
  }
}
