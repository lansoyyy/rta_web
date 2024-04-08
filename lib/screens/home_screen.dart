import 'package:flutter/material.dart';
import 'package:rta_web/utlis/colors.dart';
import 'package:rta_web/widgets/button_widget.dart';
import 'package:rta_web/widgets/text_widget.dart';

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
    Colors.brown
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                  ),
                ),
                TextWidget(
                  text: 'DASHBOARD',
                  fontSize: 18,
                  fontFamily: 'Bold',
                ),
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < 7; i++)
                  cardWidget(
                    'NO HELMET',
                    '301',
                    colors[i],
                  ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: const SizedBox(
                    width: 1000,
                    height: 350,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: const SizedBox(
                    width: 350,
                    height: 350,
                  ),
                ),
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
                    'PAID',
                    '301',
                    colors[i],
                  ),
                ButtonWidget(
                  height: 75,
                  width: 350,
                  fontSize: 24,
                  label: 'MENU',
                  onPressed: () {},
                  color: green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget cardWidget(String label, String numbers, Color color) {
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
                  TextWidget(
                    text: label,
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_upward,
                        color: green,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextWidget(
                        text: numbers,
                        fontSize: 32,
                        color: Colors.black,
                        fontFamily: 'Bold',
                      ),
                    ],
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
  }
}
