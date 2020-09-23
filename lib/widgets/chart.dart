import '../class/transaction.dart';
import './chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTxn;
  final Function ab;
  final Function abc;
  Chart(this.recentTxn, this.ab, this.abc);

  List<Map<String, Object>> get charttxn {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalAmount = 0;
      for (var i = 0; i < recentTxn.length; i++) {
        if (recentTxn[i].date.day == weekDay.day &&
            recentTxn[i].date.month == weekDay.month &&
            recentTxn[i].date.year == weekDay.year) {
          totalAmount += recentTxn[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalAmount
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return charttxn.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        color: ab(),
        margin: EdgeInsets.only(top: 55, left: 17, right: 17),
        child: Row(
          children: charttxn.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: Chartbar(
                  data['day'],
                  data['amount'],
                  totalSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalSpending,
                  abc),
            );
          }).toList(),
        ),
      ),
    );
  }
}
