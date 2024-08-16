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
  String number1 = '';
  String operand = '';
  String number2 = '';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    void appendValue(value) {
      if (![Btn.del, Btn.clr, Btn.calculate].contains(value)) {
        if (value != Btn.dot && int.tryParse(value) == null) {
          // if (operand.isNotEmpty && number2.isNotEmpty) {}
          operand = value;
        } else if (number1.isEmpty || operand.isEmpty) {
          if (value == Btn.dot && number1.contains(Btn.dot)) return;
          if (value == Btn.dot && number1.isEmpty || number1 == Btn.n0) {
            value = '0.';
          }
          number1 += value;
        } else if (number2.isEmpty || operand.isNotEmpty) {
          if (value == Btn.dot && number2.contains(Btn.dot)) return;
          if (value == Btn.dot && number2.isEmpty || number2 == Btn.n0) {
            value = '0.';
          }
          number2 += value;
        }
      }
    }

    void delete() {
      if (number2.isNotEmpty) {
        number2 = number2.substring(0, number2.length - 1);
        return;
      } else if (number2.isEmpty && operand.isEmpty && number1.isNotEmpty) {
        number1 = number1.substring(0, number1.length - 1);
        return;
      } else if (number2.isEmpty && operand.isNotEmpty) {
        operand = '';
        return;
      }
      ;
    }

    void onButtonTap(value) {
      setState(() {
        appendValue(value);
        if (value == Btn.del) {
          delete();
          return;
        } else if (value == Btn.clr) {
          number1 = '';
          number2 = '';
          operand = '';
          return;
        } else if (value == Btn.calculate) {
        }
      });
    }

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
            onTap: () => onButtonTap(value),
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
                  '$number1$operand$number2'.isEmpty
                      ? "0"
                      : '$number1$operand$number2'.trim(),
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
