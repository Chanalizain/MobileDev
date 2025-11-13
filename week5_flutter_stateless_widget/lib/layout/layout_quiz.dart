import 'package:flutter/material.dart'; 

 

void main() { 

  runApp( 

    MaterialApp( 

      debugShowCheckedModeBanner: false, 

      home: Scaffold( 

        backgroundColor: Colors.grey[300], 

        body: Column(  
          children: [
            Container(
              height: 50,
              padding: EdgeInsets.only(left: 50, right: 50),
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.yellow,
                    width: 100,
                  ),
                  Container(
                    color: Colors.yellow,
                    width: 100,
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.green,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.white,
                            width: 60,
                            height: 60,
                          ),
                          Container(
                            color: Colors.white,
                            width: 60,
                            height: 60,
                          ),
                          Container(
                            color: Colors.white,
                            width: 60,
                            height: 60,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.orange,
                      
                    ),
                  )
                ],
              ),
            )
          ],
          

// YOUR CODE 

), 

      ), 

    ), 

  ); 

} 