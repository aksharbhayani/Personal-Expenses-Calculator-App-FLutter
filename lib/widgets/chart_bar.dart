import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Chartbar extends StatelessWidget {
  final String label;
  final double spendingamount;
  final double spendpercentage;
  final Function abc;

  Chartbar(this.label, this.spendingamount, this.spendpercentage, this.abc);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: [
          Padding(padding: EdgeInsets.only(right: 50, top: 10)),
          Container(
            height: constraints.maxHeight * 0.1,
            child: FittedBox(
              child: Text('₹ ${spendingamount.toStringAsFixed(0)}',
                  style: TextStyle(color: abc())),
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            height: constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(220, 220, 220, 1),
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(10)),
                ),
                FractionallySizedBox(
                  heightFactor: spendpercentage,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10))),
                ),
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
              height: constraints.maxHeight * 0.1,
              child: FittedBox(
                  child: Text(label, style: TextStyle(color: abc())))),
          //Padding(padding: EdgeInsets.only(bottom: 10)),
        ],
      );
    });
  }
}
