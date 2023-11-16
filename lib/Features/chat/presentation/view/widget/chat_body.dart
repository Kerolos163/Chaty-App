import 'package:flutter/material.dart';

import '../../../../../Core/widget/custom_app_bar.dart';
import 'chat_info_body.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(txt: "Chaty"),
        ChatInfoBody(),
      ],
    );
  }
}
