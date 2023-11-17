import 'package:chatapp/Features/chatUsers/presentation/view/widget/chat_item.dart';
import 'package:flutter/material.dart';

class UsersChatsView extends StatelessWidget {
  const UsersChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => ChatItem(
        img:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Cristiano_Ronaldo_playing_for_Al_Nassr_FC_against_Persepolis%2C_September_2023_%28cropped%29.jpg/800px-Cristiano_Ronaldo_playing_for_Al_Nassr_FC_against_Persepolis%2C_September_2023_%28cropped%29.jpg",
        name: "Wesso",
        index: index,
      ),
      itemCount: 5,
    );
  }
}
