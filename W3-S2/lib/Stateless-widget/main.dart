import 'package:flutter/material.dart';

void main() {

//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Column(
//             children: [
//               Container(
//                 width: 300,
//                 margin: EdgeInsets.all(30),
//                 padding: EdgeInsets.all(40),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                   gradient: LinearGradient(
//                   colors: [Colors.blue, Colors.purple])
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'HELLO 1',
//                     style: TextStyle(
//                       fontSize: 35,
//                       color: Colors.white
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 300,
//                 padding: EdgeInsets.all(40),
//                 margin: EdgeInsets.all(30),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                   gradient: LinearGradient(
//                   colors: [Colors.blue, Colors.purple])
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'HELLO 2',
//                     style: TextStyle(
//                       fontSize: 35,
//                       color: Colors.white
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 300,
//                 margin: EdgeInsets.all(30),
//                 padding: EdgeInsets.all(40),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                   gradient: LinearGradient(
//                   colors: [Colors.blue, Colors.purple])
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'HELLO 3',
//                     style: TextStyle(
//                       fontSize: 35,
//                       color: Colors.white
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
 }
//st
class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.text, required this.start, required this.end});
  final String text;
  final Color start;
  final Color end;

  @override
  Widget build(BuildContext context) {
    return Container(
                width: 300,
                margin: EdgeInsets.all(30),
                padding: EdgeInsets.all(40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                  colors: [start, end])
                ),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white
                    ),
                  ),
                ),
              );
  }
}