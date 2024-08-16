import 'package:calculator/utils/button_values.dart';
import 'package:flutter/material.dart';

Color buttonColors(value) {
  const Color _operationColor = Color.fromARGB(169, 0, 0, 0);
  const Color _digitColor = Color.fromARGB(25, 25, 25, 1);;
  const Color _utilColor = Colors.blueGrey;

  return [Btn.clr, Btn.del].contains(value)
      ? _utilColor
      : [
          Btn.multiply,
          Btn.add,
          Btn.divide,
          Btn.per,
          Btn.calculate,
          Btn.subtract
        ].contains(value)
          ? _operationColor
          : _digitColor;
}
