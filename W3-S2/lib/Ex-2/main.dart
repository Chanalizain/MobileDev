import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: Container(
        color: Colors.blue[300],
        padding: EdgeInsets.all(50),
        margin: EdgeInsets.all(40),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue[600],),
          child: Center(
            child: Text(
              'CADT STUDENTS',
              style: TextStyle(
                fontSize: 24, 
                color: Colors.white,
                decoration: TextDecoration.none,
                ),
              )
          )
        )
      )
    )
  );
}