import 'package:chatapp/Core/utils/color_manager.dart';
import 'package:chatapp/Features/chat/presentation/view/widget/chat_body.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.second,
      body: const SafeArea(
        child: ChatBody(),
      ),
    );
  }
}
