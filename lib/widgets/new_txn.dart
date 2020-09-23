import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTxn;

  NewTransaction(this.addTxn);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate;

  void submitData() {
    if (amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTxn(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void choosedate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1999),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Where did you spent?'),
                controller: titleController,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration:
                    InputDecoration(labelText: 'How much did you spent?'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    _selectedDate == null
                        ? 'Choose your date'
                        : DateFormat.yMMMEd().format(_selectedDate),
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 180),
                    child: IconButton(
                      icon: Icon(
                        Icons.date_range,
                        size: 35,
                      ),
                      onPressed: choosedate,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              RaisedButton(
                  onPressed: () {
                    submitData();
                  },
                  child: Text(
                    'Add Transaction',
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Colors.purple, fontSize: 18),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
