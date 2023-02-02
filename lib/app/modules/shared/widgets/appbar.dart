import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final String upperTitle;
  const CustomAppBar({required this.title, required this.upperTitle, Key? key})
      : super(key: key);
  final primaryColor = const Color(0xff4338CA);
  final secondaryColor = const Color(0xff6D28D9);
  final accentColor = const Color(0xffffffff);
  final backgroundColor = const Color(0xffffffff);
  final errorColor = const Color(0xffEF4444);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: size.height * 0.15,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xfff74c06),
            const Color(0xfff9bc2c),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 40, 0, 0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.normal)),
                Text(upperTitle,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold))
              ],
            ),
            SizedBox(
              width: size.width * 0.2,
            ),
          ],
        ),
      ),
    );
  }
}
