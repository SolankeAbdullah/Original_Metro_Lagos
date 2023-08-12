import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final Function validator;
  final Function? onTap;
  final bool readOnly;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;

  TextFieldWidget({
    super.key,
    required this.title,
    this.hintText = '',
    required this.validator,
    this.onTap,
    this.readOnly = false,
    this.borderRadius = 0.0,
    this.borderWidth = 0.0,
    this.borderColor = Colors.transparent,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 6,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                readOnly: readOnly,
                onTap: onTap != null ? () => onTap!() : null,
                validator: (input) => validator(input),
                controller: controller,
                style: TextStyle(
                    fontSize: 13.3,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF3A3A3A)),
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
