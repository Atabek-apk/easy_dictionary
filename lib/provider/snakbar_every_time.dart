import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnakBarEveryTime extends StatelessWidget {
  final String titleee;
  const SnakBarEveryTime({Key? key, required this.titleee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: BorderRadius.all(
              Radius.circular(10))),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [
          Text(titleee,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontFamily: "Regu"),
          ),
          CircleAvatar(
            child: IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .hideCurrentSnackBar();
                },
                icon: Icon(Icons.clear)),
          )
        ],
      ),
    );
  }
}