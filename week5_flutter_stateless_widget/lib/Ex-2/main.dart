import "package:flutter/material.dart";

void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomButton(
                label: 'Submit',
                icon: Icons.check,
              ),
              SizedBox(height: 20),

              CustomButton(
                label: 'Time',
                icon: Icons.access_alarm,
                pos: IconPosition.right, 
                type: ButtonType.secondary,
              ),
            ]
          )
        ),
      )
    )
  );
}
enum IconPosition {left, right}
enum ButtonType {primary, secondary, disabled}
extension ButtonTypeExtension on ButtonType {
  Color get color {
    switch (this) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
    }
  }
}
class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition pos;
  final ButtonType type;

  const CustomButton({super.key, required this.label, required this.icon, this.pos = IconPosition.left, this.type = ButtonType.primary});

  @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(
      icon,
      color: Colors.blueGrey,
      size: 20,
    );
    
    final labelWidget = Text(
      label,
      style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
    );

    return Material(
      color: type.color,
      borderRadius: BorderRadius.circular(20),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //ternary
            children: pos == IconPosition.left
                ? [
                    iconWidget,
                    const SizedBox(width: 12),
                    labelWidget,
                  ]
                : [
                    labelWidget,
                    const SizedBox(width: 12),
                    iconWidget,
                  ],
          ),
        ),
      
      );
  }
}