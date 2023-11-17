import 'package:chatapp/Core/constant.dart';
import 'package:chatapp/Core/transition/page_slide_transition.dart';
import 'package:chatapp/Features/chat/presentation/view/chat_view.dart';
import 'package:chatapp/Features/chatUsers/presentation/view/widget/chat_item.dart';
import 'package:chatapp/Features/chatUsers/presentation/viewmodel/ChatUsersCubit/cubit.dart';
import 'package:chatapp/Features/chatUsers/presentation/viewmodel/ChatUsersCubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersChatsView extends StatelessWidget {
  const UsersChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatUsersCubit()..getUsers(),
      child: BlocBuilder<ChatUsersCubit, ChatUsers>(
        builder: (context, state) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => ChatItem(
              index: index,
              model: ChatUsersCubit.get(context).users[index],
              onTap: () {
                Navigator.of(context).push(
                  PageSlide(
                    ChatView(
                      userName: getName(
                        name: ChatUsersCubit.get(context).users[index].email,
                      ),
                    ),
                  ),
                );
              },
            ),
            itemCount: ChatUsersCubit.get(context).users.length,
          );
        },
      ),
    );
  }
}
