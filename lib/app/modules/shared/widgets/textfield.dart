import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      this.controller,
      this.onTap,
      this.labelText,
      this.keyboardType = TextInputType.number,
      this.inputFormatters,
      this.height,
      this.titleInput,
      this.fontSizeTitle,
      this.colorTitleInput,
      this.inputColor,
      this.colorFillInput,
      this.suffixIcon,
      this.isFinal = false,
      this.onChanged})
      : super(key: key);

  final TextEditingController? controller;
  final onTap;
  final String? labelText;
  final String? titleInput;
  final Color? colorTitleInput;
  final double? fontSizeTitle;
  final Color? colorFillInput;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final double? height;
  final Widget? suffixIcon;
  final Color? inputColor;
  final bool? isFinal;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            titleInput!,
            style: TextStyle(
              color: colorTitleInput,
              fontSize: fontSizeTitle,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1,
          height: MediaQuery.of(context).size.height / 10,
          child: TextFormField(
            onChanged: onChanged,
            keyboardType: keyboardType,
            controller: controller,
            onTap: onTap,
            inputFormatters: inputFormatters,
            style: TextStyle(color: inputColor),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: "Digite um valor",
                fillColor: Colors.white70),
          ),
        ),
      ],
    );
  }
}
