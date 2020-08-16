import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();

  void inputData() {
    final inputText = titleControler.text;
    final inputAmount = double.parse(amountControler.text);

    if (inputText.isEmpty || inputAmount <= 0) {
      return;
    }

    widget.addNewTransaction(
      inputText,
      inputAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountControler,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => inputData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleControler,
              onSubmitted: (_) => inputData(),
            ),
            FlatButton(
              onPressed: inputData,
              textColor: Theme.of(context).primaryColor,
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
