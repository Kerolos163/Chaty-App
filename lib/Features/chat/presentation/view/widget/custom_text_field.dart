import 'package:flutter/material.dart';

import '../../../../../Core/utils/color_manager.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.onPressed, this.controller, this.onPressed2});
  final void Function()? onPressed;
  final void Function()? onPressed2;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextField(
        controller: controller,
        cursorColor: ColorManager.primaryFont,
        decoration: InputDecoration(
          suffixIcon: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: onPressed2,
                  icon: Icon(
                    Icons.image,
                    color: ColorManager.second,
                  )),
              IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    Icons.send,
                    color: ColorManager.second,
                  )),
            ],
          ),
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
