import 'package:flutter/material.dart';
import 'package:rta_web/screens/home_screen.dart';
import 'package:rta_web/screens/tabs/add_account_screen.dart';
import 'package:rta_web/screens/tabs/alltickets_tab.dart';
import 'package:rta_web/screens/tabs/enforcers_tab.dart';
import 'package:rta_web/screens/tabs/my_profile_tab.dart';

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
              leading: const Icon(Icons.person_2_outlined),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const MyProfileTab()));
              },
              title: TextWidget(
                text: 'My Profile',
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
              onTap: () {
                // Navigator.of(context).pushReplacement(MaterialPageRoute(
                //     builder: (context) => const HomeScreen()));
              },
              title: TextWidget(
                text: 'Code & Violations',
                fontSize: 14,
                fontFamily: 'Bold',
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info_outline),
              onTap: () {
                // Navigator.of(context).pushReplacement(MaterialPageRoute(
                //     builder: (context) => const HomeScreen()));
              },
              title: TextWidget(
                text: 'About us',
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
