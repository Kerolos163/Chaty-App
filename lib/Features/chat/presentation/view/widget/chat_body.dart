import 'package:chatapp/Core/utils/color_manager.dart';
import 'package:chatapp/Core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(txt: "Chaty"),
        Expanded(
          flex: 9,
          child: Container(
            decoration: BoxDecoration(
              color: ColorManager.primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(26),
                topRight: Radius.circular(26),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
