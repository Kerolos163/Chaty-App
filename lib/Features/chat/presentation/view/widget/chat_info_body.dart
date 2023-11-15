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
            topLeft: Radius.circular(26),
            topRight: Radius.circular(26),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            reciverMessage(context,
                message: "Welcome Wesso Welcome Wesso o Welcome Wesso"),
                const SizedBox(height: 16,),
            senderMessage(context,
                message: "Welcome Wesso Welcome Wesso o Welcome Wesso")
          ],
        ),
      ),
    );
  }

  Container reciverMessage(BuildContext context, {required String message}) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 14, bottom: 14, right: 10),
      constraints: BoxConstraints(maxWidth: MyDevice.getWidth(context) / 1.5),
      decoration: BoxDecoration(
        color: ColorManager.primaryFont,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
          bottomRight: Radius.circular(18),
        ),
      ),
      child: Text(
        message,
        style: TextStyle(color: ColorManager.primary, fontSize: 16),
      ),
    );
  }

  Align senderMessage(BuildContext context, {required String message}) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        padding: const EdgeInsets.only(left: 16, top: 14, bottom: 14, right: 10),
        constraints: BoxConstraints(maxWidth: MyDevice.getWidth(context) / 1.5),
        decoration: BoxDecoration(
          color: ColorManager.second,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
            bottomLeft: Radius.circular(18),
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
