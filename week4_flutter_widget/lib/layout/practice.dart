import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 100),
            Container(
              color: Colors.blue,
              height: 400,
              ),
            Container(
              height: 100,
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.green)),
                  Container(color: Colors.pinkAccent, width: 100)
                ],
              ),
            ),
            Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(color: Colors.yellow, width: 100,),
                  Container(color: Colors.yellow, width: 100,),
                  Container(color: Colors.yellow, width: 100,)
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(child: Container(color: Colors.purple,))
            

          ],
        ),
      ),
    )
  );
}