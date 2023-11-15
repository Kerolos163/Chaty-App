import 'package:flutter/material.dart';

import '../../../../Core/utils/color_manager.dart';
import 'widget/chat_body.dart';

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
