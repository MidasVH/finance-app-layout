import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget{
  final String name;
  final double price;

  ExpenseItem(this.name, this.price);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.pink,
      ),
      height: 80,
      child: Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0)
        ),
        color: Color(0xff2d2d2d)
      ),
      child: Row(
        children: <Widget>[
          Container(
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
              padding: EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      this.name, 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'You and 2 others',
                      style: TextStyle(
                        color: Colors.white
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 110,
            padding: const EdgeInsets.all(20.0),
            child: Text(
              (this.price).toStringAsFixed(2), 
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0
              ),
              textAlign: TextAlign.right,
            ),  
          ),
        ],
      ),
       )
     );
    //   decoration: BoxDecoration(
    //     color: Color(0xff2d2d2d),
    //     //borderRadius: BorderRadius.all(Radius.circular(20.0)),
    //     boxShadow: [BoxShadow(
    //       color: Colors.pink,
    //       spreadRadius: 3
    //     )]
    //   ),
    //   height: 85,
    //   child: Row(
    //     children: <Widget>[
    //       Container(
    //         child: Icon(
    //           Icons.shopping_cart,
    //           color: Colors.white,
    //           size: 30.0,
    //         ),
    //         width: 75.0,
    //         padding: const EdgeInsets.all(5.0),
    //       ),
    //       Expanded(
    //         child: Container(
    //           padding: EdgeInsets.only(left: 10.0),
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: <Widget>[
    //               Align(
    //                 alignment: Alignment.centerLeft,
    //                 child: Text(
    //                   this.name, 
    //                   style: TextStyle(
    //                     color: Colors.white,
    //                     fontSize: 20.0,
    //                   ),
    //                   textAlign: TextAlign.left,
    //                 ),
    //               ),
    //               Align(
    //                 alignment: Alignment.centerLeft,
    //                 child: Text(
    //                   'You and 2 others',
    //                   style: TextStyle(
    //                     color: Colors.white
    //                   ),
    //                   textAlign: TextAlign.left,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       Container(
    //         width: 110,
    //         padding: const EdgeInsets.all(20.0),
    //         child: Text(
    //           (this.price).toStringAsFixed(2), 
    //           style: TextStyle(
    //             color: Colors.white,
    //             fontSize: 20.0
    //           ),
    //           textAlign: TextAlign.right,
    //         ),  
    //       ),
    //     ],
    //   ),
    // );
  }

}