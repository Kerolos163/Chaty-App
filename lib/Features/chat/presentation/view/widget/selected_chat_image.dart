import 'dart:io';

import 'package:chatapp/Core/utils/color_manager.dart';
import 'package:chatapp/Features/chat/presentation/viewModel/ChatCubit/cubit.dart';
import 'package:flutter/material.dart';

class SelectedChatImage extends StatelessWidget {
  const SelectedChatImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: FileImage(ChatCubit.get(context).galleryImage as File),
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: ColorManager.second,
          radius: 14,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              ChatCubit.get(context).removeImage();
            },
            icon: Center(
              child: Icon(Icons.close, color: ColorManager.primary, size: 16),
            ),
          ),
        )
      ],
    );
  }
}
