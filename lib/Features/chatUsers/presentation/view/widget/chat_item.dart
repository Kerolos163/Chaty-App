import 'package:chatapp/Core/constant.dart';
import 'package:chatapp/Core/models/user_model.dart';
import 'package:chatapp/Core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.index,
    required this.model,
    this.onTap,
  });
  final int index;
  final UserModel model;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: index % 2 == 0 ? null : ColorManager.second.withOpacity(.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(children: [
          CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(model.image ??
                  "https://i0.wp.com/www.zuckermanlaw.com/wp-content/uploads/whistleblowing/anonymous-sec-whistleblower.jpg?w=1004&ssl=1")),
          const SizedBox(width: 8),
          Text(
            getName(name: model.email),
            style: TextStyle(color: ColorManager.second2, fontSize: 20),
          )
        ]),
      ),
    );
  }


}
