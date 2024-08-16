import 'package:calculator/utils/button_colors.dart';
import 'package:calculator/utils/button_values.dart';
import 'package:calculator/utils/redd_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    Widget buildButtton(value) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Material(
          color: buttonColors(value),
          clipBehavior: Clip.hardEdge,
          shape: OutlineInputBorder(
            gapPadding: 100,
            borderSide: BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(
              100,
            ),
          ),
          child: InkWell(
            onTap: () {},
            child: Center(
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      drawer: ReddDrawer(),
      appBar: AppBar(
        title: const Text('REDD AXE'),
        toolbarHeight: 110,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.all(16),
                alignment: Alignment.bottomRight,
                child: Text(
                  '0'*10,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50),
                ),
              ),
            ),
            Wrap(
              children: Btn.buttonValues
                  .map(
                    (value) => SizedBox(
                      width: value != Btn.n0
                          ? screenSize.width / 4
                          : screenSize.width / 2,
                      height: screenSize.width / 5,
                      child: buildButtton(value),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
