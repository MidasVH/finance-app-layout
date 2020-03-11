import 'package:cloud_firestore/cloud_firestore.dart';
class Expense {
  final String name;
  final double price;
  final DocumentReference reference;

  Expense.fromMap(Map<String, dynamic> map, {this.reference})
    : assert(map['name'] != null),
      assert(map['price'] != null),
      name = map['name'],
      price = map['price'];
  Expense.fromSnapshot(DocumentSnapshot snapshot)
    : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override 
  String toString() => "Expense<$name:$price>";
}