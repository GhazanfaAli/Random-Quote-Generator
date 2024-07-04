import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  final bool loading;

  const RoundButton({
    Key? key,
    required this.title,
    required this.ontap,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 6, 130, 231),
            Color.fromARGB(255, 7, 56, 219),
            Color.fromARGB(255, 6, 56, 165),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: ontap,
          borderRadius: BorderRadius.circular(10),
          child: Center(
            child: loading
                ? CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
