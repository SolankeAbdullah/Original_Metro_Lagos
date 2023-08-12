import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.title,
      required this.hintText,
      this.isPasswordField = false,
      required this.suffixIcon})
      : super(key: key);

  final String title;
  final String hintText;
  final bool isPasswordField;
  final TextEditingController controller;
  final IconButton? suffixIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool textObscured = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPasswordField ? textObscured : false,
          decoration: InputDecoration(
            suffixIcon: widget.isPasswordField
                ? InkWell(
                    onTap: () {
                      setState(() {
                        textObscured = !textObscured;
                      });
                    },
                    child: textObscured
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  )
                : const SizedBox(),
            suffixIconColor: const Color(0xFF6A6A6A),
            hintText: widget.hintText,
            filled: true,
            fillColor: const Color.fromARGB(255, 79, 79, 91).withOpacity(0.2),
            enabled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Color(0xFFF7F7F9),
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Color(0xFFF7F7F9),
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Colors.green,
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Colors.purple,
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Colors.amber,
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
          ),
        )
      ],
    );
  }
}
