import 'package:flutter/material.dart';
import '../class/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function ltd;
  final Function ltd2;
  final Function ltd3;
  final Function deletetx;
  TransactionList(
      this.transactions, this.ltd, this.ltd2, this.ltd3, this.deletetx);

  void _showSnackBar(BuildContext context, String msg) {
    final snackBar = SnackBar(content: Text(msg));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        child: transactions.isEmpty
            ? Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      height: constraints.maxHeight * 0.4,
                      child: Image.asset('assets/images/noTrans.gif')),
                  Text(
                    '\nNo Transactions yet!',
                    style: TextStyle(fontSize: 26, color: ltd()),
                  )
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 05,
                    margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    color: ltd2(),
                    child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.purple,
                          radius: 30,
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: FittedBox(
                              child: Text(
                                  '₹ ${transactions[index].amount.round()}',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                        title: Text(transactions[index].title,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 21,
                                letterSpacing: 1.2,
                                color: ltd())),
                        subtitle: Text(
                          DateFormat.yMMMEd().format(transactions[index].date),
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 18, color: ltd3()),
                        ),
                        trailing: MediaQuery.of(context).size.width > 460
                            ? FlatButton.icon(
                                icon: Icon(Icons.delete),
                                label: Text('Delete',
                                    style: TextStyle(color: ltd())),
                                onPressed: () =>
                                    deletetx(transactions[index].id),
                              )
                            : IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: ltd(),
                                ),
                                onPressed: () {
                                  deletetx(transactions[index].id);
                                  _showSnackBar(
                                      context, 'Deleted Successfully');
                                })),
                  );
                },
                itemCount: transactions.length,
              ),
      );
    });
  }
}
