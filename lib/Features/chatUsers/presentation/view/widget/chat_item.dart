import 'package:chatapp/Core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.img,
    required this.name,
    required this.index,
  });
  final String img;
  final String name;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: index % 2 == 0 ? null : ColorManager.second.withOpacity(.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(children: [
        CircleAvatar(radius: 35, backgroundImage: NetworkImage(img)),
        const SizedBox(width: 8),
        Text(
          name,
          style: TextStyle(color: ColorManager.second2, fontSize: 20),
        )
      ]),
    );
  }
}
