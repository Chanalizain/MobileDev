import 'package:flutter/material.dart';

void main () {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            DiscountCard(initialPrice: 100, discoutRate: 0.25),

          ],
        ),
      ),
    )
  );
}

class DiscountCard extends StatefulWidget {
  const DiscountCard({super.key, required this.initialPrice, required this.discoutRate});

  final int initialPrice;
  final double discoutRate;//from 0 to 1

  @override
  State<DiscountCard> createState() => _DiscountCardState();
}

class _DiscountCardState extends State<DiscountCard> {
  bool discoutApplied = false;
  Color get backgroundColor => discoutApplied ? Colors.pink : Colors.black;
  String get discountLabel => discoutApplied ? "Discount!" : "No Discount";

  int get effectivePrice => discoutApplied 
  ? (widget.initialPrice*(1-widget.discoutRate)).floor() 
  : widget.initialPrice;

  String get effectivePriceLabel => '$effectivePrice \$';

  void onPressDiscount() {
    setState(() {
      discoutApplied = !discoutApplied;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          Text(effectivePriceLabel, style: TextStyle(color: Colors.white),),
          SizedBox(height: 20,),
          Text(discountLabel, style: TextStyle(color: Colors.white),),
          SizedBox(height: 20,),

          ElevatedButton(
            onPressed: onPressDiscount, 
            child: Text('Apply Discount')
            )
        ],
      ),
    );
  }
}