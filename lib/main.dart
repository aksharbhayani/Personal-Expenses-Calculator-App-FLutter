import './support.dart';
import './widgets/new_txn.dart';
import './widgets/txn_list.dart';
import './class/transaction.dart';
import './widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses Calculator',
      home: new App(),
    ),
  );
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      title: Text(
        'Personal Expenses',
        style: TextStyle(
          color: Colors.yellow,
          fontSize: 28,
          fontWeight: FontWeight.bold,
          //fontFamily: 'OpenSans-Bold'
        ),
      ),
      backgroundColor: Colors.white,
      image: Image.asset('assets/loading1.gif'),
      loaderColor: Colors.yellow,
      styleTextUnderTheLoader: new TextStyle(),
      loadingText: Text('\n\nfrom\nAKSHAR BHAYANI',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
              letterSpacing: 2.0,
              fontFamily: 'Quicksand')),
      photoSize: 150,
      navigateAfterSeconds: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showChart = false;
  List<Transaction> get _recentTxn {
    return _usertxnlist.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  List<Transaction> _usertxnlist = [];

  void _addtransaction(String title, double amount, DateTime choosedDate) {
    final newTransaction = Transaction(
      title: title,
      amount: amount,
      date: choosedDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _usertxnlist.add(newTransaction);
    });
  }

  bool themeSwitch = false;
  dynamic themeColors() {
    if (themeSwitch) {
      return Colors.grey[850];
    } else {
      return Colors.white;
    }
  }

  dynamic change1() {
    bool switcha = themeSwitch;
    if (switcha) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  dynamic change2() {
    bool switcha = themeSwitch;
    if (switcha) {
      return Colors.grey[800];
    } else {
      return Colors.white;
    }
  }

  dynamic change3() {
    bool switcha = themeSwitch;
    if (switcha) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  dynamic change4() {
    bool switcha = themeSwitch;
    if (switcha) {
      return Colors.grey[800];
    } else {
      return Colors.white;
    }
  }

  dynamic change5() {
    bool switcha = themeSwitch;
    if (switcha) {
      return Colors.white54;
    } else {
      return Colors.grey[800];
    }
  }

  dynamic clippathchange() {
    bool switcha = themeSwitch;
    if (switcha) {
      return Colors.lightBlue[900].withOpacity(0.41);
    } else {
      return Colors.yellowAccent[400];
    }
  }

  dynamic textchange() {
    bool switcha = themeSwitch;
    if (switcha) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  void _startNewTransactiontoadd(BuildContext ctx) {
    showModalBottomSheet(
        backgroundColor: themeColors(),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: ctx,
        isScrollControlled: true,
        builder: (_) {
          return NewTransaction(_addtransaction);
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _usertxnlist.removeWhere((tx) => tx.id == id);
      //_showSnackBar(context, 'Deleted Successfully');
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_usertxnlist == null) {
      _usertxnlist = List<Transaction>();
    }
    final _islandscape =
        (MediaQuery.of(context).orientation == Orientation.landscape);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 26.0,
        backgroundColor: themeSwitch
            ? Colors.lightBlue[900].withOpacity(0.41)
            : Colors.yellowAccent[400].withOpacity(0.9),
        items: [
          themeSwitch
              ? BottomNavigationBarItem(
                  icon: Icon(Icons.wb_sunny, color: Colors.white),
                  title: Text(
                    'Light',
                    style: TextStyle(
                        color: themeSwitch ? Colors.white : Colors.black),
                  ))
              : BottomNavigationBarItem(
                  icon: Icon(Icons.brightness_3, color: Colors.black),
                  title: Text(
                    'Dark',
                    style: TextStyle(
                        color: themeSwitch ? Colors.white : Colors.black),
                  ),
                ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add,
                  color: themeSwitch ? Colors.white : Colors.black),
              title: Text('Add',
                  style: TextStyle(
                      color: themeSwitch ? Colors.white : Colors.black))),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline,
                  color: themeSwitch ? Colors.white : Colors.black),
              title: Text('Support',
                  style: TextStyle(
                      color: themeSwitch ? Colors.white : Colors.black))),
        ],
        onTap: (index) {
          if (index == 0) {
            setState(() {
              themeSwitch = !themeSwitch;
              change1();
              change2();
              change3();
              change4();
              change5();
            });
          } else if (index == 1) {
            _startNewTransactiontoadd(context);
          } else if (index == 2) {
            Navigator.push(context, new MaterialPageRoute(builder: (context) {
              return Support(clippathchange, textchange, change4);
            }));
          }
        },
      ),
      backgroundColor: themeColors(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 270,
                decoration: BoxDecoration(
                    color: themeSwitch
                        ? Colors.lightBlue[900].withOpacity(0.41)
                        : Colors.yellowAccent[400]),
              ),
            ),
          ),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text('PERSONAL EXPENSES',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 1,
                      color: themeSwitch ? Colors.white : Colors.grey[850],
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(4.5),
                child: Text('YOUR EXPENSE CALCULATOR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 1,
                      color: themeSwitch ? Colors.white : Colors.grey[850],
                      fontSize: 14,
                      fontFamily: 'OpenSans',
                    )),
              ),
            ],
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  if (_islandscape)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('       Show Chart',
                            style: TextStyle(fontSize: 18, color: change1())),
                        Switch.adaptive(
                            activeColor:
                                themeSwitch ? Colors.white : Colors.grey[800],
                            value: _showChart,
                            onChanged: (val) {
                              setState(() {
                                _showChart = val;
                              });
                            })
                      ],
                    ),
                  if (!_islandscape)
                    Container(
                        padding: EdgeInsets.only(top: 20),
                        height: (MediaQuery.of(context).size.height -
                                MediaQuery.of(context).padding.top) *
                            0.35,
                        child: Chart(_recentTxn, change2, change3)),
                  _showChart
                      ? Container(
                          height: (MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).padding.top) *
                              0.65,
                          child: Chart(_recentTxn, change2, change3))
                      : Container(
                          height: (MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).padding.top) *
                              0.7,
                          child: TransactionList(_usertxnlist, change1, change4,
                              change5, _deleteTransaction),
                        )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
