import 'package:flutter/material.dart';

import '../../../../../Core/widget/custom_app_bar.dart';
import 'chat_info_body.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key, required this.userName});
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(txt: userName),
        const ChatInfoBody(),
      ],
    );
  }
}
