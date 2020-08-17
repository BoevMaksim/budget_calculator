import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './widgets/chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget Calculator',
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   amount: 30.45,
    //   date: DateTime.now(),
    //   title: 'New Shoes',
    // ),
    // Transaction(
    //   id: 't2',
    //   amount: 100.00,
    //   date: DateTime.now(),
    //   title: 'New iPhone',
    // )
  ];

  List<Transaction> get _recentTransaction {
    return _userTransactions.where(
      (tx) {
        return tx.date.isAfter(DateTime.now().subtract(
          Duration(days: 7),
        ));
      },
    ).toList();
  }
  
  void _addNewTransaction(String inputTitle, double inputAmount) {
    final newTx = Transaction(
      amount: inputAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
      title: inputTitle,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Budget Calculator',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            // Container(
            //   width: double.infinity,
            //   child: Card(
            //     child: Container(
            //       width: double.infinity,
            //       color: Colors.blue,
            //       child: Text('Chart!'),
            //     ),
            //     elevation: 5,
            //   ),
            // ),
            Chart(_recentTransaction),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
