import 'package:flutter/material.dart';

import '../../../../Core/utils/color_manager.dart';
import 'widget/chat_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key, required this.userName});
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.second,
      body: SafeArea(
        child: ChatBody(userName: userName),
      ),
    );
  }
}
