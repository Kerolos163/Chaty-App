import 'package:chatapp/Core/models/user_model.dart';
import 'package:chatapp/Features/chat/presentation/viewModel/ChatCubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/utils/color_manager.dart';
import 'widget/chat_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key, required this.receiverModel});
  final UserModel receiverModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit()..getMessage(receiverId: receiverModel.uID),
      child: Scaffold(
        backgroundColor: ColorManager.second,
        body: SafeArea(
          child: ChatBody(receiverModel: receiverModel),
        ),
      ),
    );
  }
}
