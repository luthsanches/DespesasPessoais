import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime dataSelecionada;
  final Function(DateTime) onDateChanged;

  AdaptativeDatePicker({
    this.dataSelecionada,
    this.onDateChanged,
  });

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      onDateChanged(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
          height: 180,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            maximumDate: DateTime.now(),
            minimumDate: DateTime(2019),
            initialDateTime: DateTime.now(),
            onDateTimeChanged: onDateChanged,
          ),
        )
        : Container(
            height: 70,
            child: Row(
              children: [
                Text(dataSelecionada == null
                    ? 'Nenhuma data selecionada!'
                    : DateFormat('dd/MM/yyyy').format(dataSelecionada)),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text(
                    'Selecionar Data',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () => _showDatePicker(context),
                ),
              ],
            ),
          );
  }
}
