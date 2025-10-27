import "package:flutter/material.dart";

void main(){
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue[100]
                ),
              child: Center(
                child: Text(
                  'OOP',
                  style: TextStyle(fontSize: 24, color: Colors.white, decoration: TextDecoration.none)
                  ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(25),
              margin: EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue[300]
                ),
              child: Center(
                child: Text(
                  'DART',
                  style: TextStyle(fontSize: 24, color: Colors.white, decoration: TextDecoration.none)
                  ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue[600]
                ),
              child: Center(
                child: Text(
                  'FLUTTER',
                  style: TextStyle(fontSize: 24, color: Colors.white, decoration: TextDecoration.none)
                  ),
              ),
            )
          ],
        ),
      )
    )
  );
}
