import 'package:chatapp/Features/chat/presentation/view/widget/custom_text_field.dart';

import '../../../../../Core/constant.dart';
import '../../../../../Core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class ChatInfoBody extends StatelessWidget {
  const ChatInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 16, left: 10, right: 10),
        decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: reciverMessage(context,
                        message: "Wesso Wesso Wesso Wesso Wesso Wesso"),
                  );
                },
                itemCount: 5,
              ),
            ),
            const CustomTextField(),
          ],
        ),
      ),
    );
  }

  Align reciverMessage(BuildContext context, {required String message}) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, top: 14, bottom: 14, right: 10),
        constraints: BoxConstraints(maxWidth: MyDevice.getWidth(context) / 1.5),
        decoration: BoxDecoration(
          color: ColorManager.primaryFont,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(color: ColorManager.primary, fontSize: 16),
        ),
      ),
    );
  }

  Align senderMessage(BuildContext context, {required String message}) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, top: 14, bottom: 14, right: 10),
        constraints: BoxConstraints(maxWidth: MyDevice.getWidth(context) / 1.5),
        decoration: BoxDecoration(
          color: ColorManager.second,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(color: ColorManager.primaryFont, fontSize: 16),
        ),
      ),
    );
  }
}
