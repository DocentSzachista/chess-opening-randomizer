import 'package:flutter/material.dart';
class FooterButton extends StatelessWidget {
  Color backgroundColor;
  Color textColor;
  final String text;
  final VoidCallback onClick;
  FooterButton({ required this.text, this.backgroundColor=Colors.blueGrey, this.textColor = Colors.white, required this.onClick });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueGrey,
      child: InkWell(
        highlightColor: Colors.white,
        onTap: onClick,
        child: const SizedBox(
          height: kToolbarHeight,
          width: double.infinity,
          child: Center(
            child: Text("Add new opening",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18,),
            ),
          ),
        ),
      ),
    );
  }
}
