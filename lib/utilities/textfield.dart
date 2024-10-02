import 'package:cloture/utilities/colors.dart';
import 'package:flutter/material.dart';

Widget authTextField({
  required hintText,
  required controller,
  Widget? suffixIcon,
  bool? obscureText,
  TextInputAction? textInputAction,
  TextInputType? keyboardType,
  String? Function(String?)? validator,
}) {
  return TextFormField(
    obscureText: obscureText ?? false,
    textInputAction: textInputAction,
    keyboardType: keyboardType,
    controller: controller,
    validator: validator,
    cursorColor: primary200,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        color: black50,
      ),
      fillColor: bgLight2,
      filled: true,
      contentPadding:
          const EdgeInsets.symmetric(vertical: 20, horizontal: 12.0),
      border: OutlineInputBorder(
        borderSide: BorderSide.none, // No border
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: primary200,
          width: 2,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.red),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
      suffixIcon: suffixIcon,
    ),
  );
}

// Widget ageDropDown() {
//   return Container(
//     decoration: BoxDecoration(
//       color: bgLight2,
//       borderRadius: BorderRadius.circular(10),
//     ),
//     child: DropdownButton<String>(
//       items: <String>[
//         '18',
//         '19',
//         '20',
//         '21',
//         '22',
//         '23',
//         '24',
//         '25',
//         '26',
//         '27',
//         '28',
//         '29',
//         '30'
//       ].map((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//       onChanged: (_) {},
//     ),
//   );
// }
