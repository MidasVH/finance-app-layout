import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_layout_test/model/Expense.dart';
import 'package:finance_layout_test/widgets/expense-item.dart';
import 'package:flutter/material.dart';

final dummySnapshot = [
  {'name' : 'Shopping', 'price': 20.00},
  {'name' : 'Restaurant', 'price': 50.99},
  {'name' : 'Coffee', 'price': 3.95},
];

class ExpensesList extends StatefulWidget {
  @override 
  createState() => _ExpensesListState();
}

class _ExpensesListState extends State<ExpensesList> {
  @override 
  Widget build(BuildContext context){
    return Container(
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('expense').snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data.documents);
      }
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView (
      padding: const EdgeInsets.only(top: 20.00),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final expense = Expense.fromSnapshot(data);
    return Padding(
      key: ValueKey(expense.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.00, vertical: 8.00),
      child: ExpenseItem(expense.name, expense.price)
    );
  }
}