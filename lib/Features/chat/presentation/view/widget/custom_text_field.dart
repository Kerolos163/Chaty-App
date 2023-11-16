import 'package:chatapp/Core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextField(
        cursorColor: ColorManager.primaryFont,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.send,
                color: ColorManager.second,
              )),
          hintText: "Send Message...",
          border: outlineInputBorder(),
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder(color: ColorManager.primaryFont),
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color ?? ColorManager.second, width: 1.5),
    );
  }
}
