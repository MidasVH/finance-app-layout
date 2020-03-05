import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget{
  final String name;
  //final String amount;
  //final String category;
  //final Color color;

  //const ExpenseItem(this.name, this.amount, this.category, this.color);
  const ExpenseItem(this.name);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      height: 85,
      child: Row(
        children: <Widget>[
          Container(
            color: Colors.blue,
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 30.0,
            ),
            width: 75.0,
            padding: const EdgeInsets.all(5.0),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    
                    'Restaurant', 
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'You and 2 others',
                    style: TextStyle(
                      color: Colors.white
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.red,
            width: 110,
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '€30,00', 
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0
              ),
              textAlign: TextAlign.right,
            ),  
          ),
        ],
      ),
    );
  }

}