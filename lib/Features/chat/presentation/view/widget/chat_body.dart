import 'package:chatapp/Core/constant.dart';
import 'package:chatapp/Core/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/widget/custom_app_bar.dart';
import 'chat_info_body.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({
    super.key,
    required this.receiverModel,
  });
  final UserModel receiverModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(txt: getName(name: receiverModel.email)),
        ChatInfoBody(receiverID: receiverModel.uID),
      ],
    );
  }
}
