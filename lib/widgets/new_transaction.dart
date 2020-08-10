import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();

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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleControler,
            ),
            FlatButton(
              onPressed: () => print(titleControler.text),
              textColor: Colors.purple,
              //padding: EdgeInsets.only(top: 10.0, right: 3.0),
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
