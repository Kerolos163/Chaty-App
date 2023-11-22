import 'package:chatapp/Core/models/messagemodel.dart';
import 'package:chatapp/Features/chat/presentation/view/widget/selected_chat_image.dart';
import 'package:chatapp/Features/chat/presentation/viewModel/ChatCubit/cubit.dart';
import 'package:chatapp/Features/chat/presentation/viewModel/ChatCubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../Core/constant.dart';
import '../../../../../Core/utils/color_manager.dart';
import 'custom_text_field.dart';

class ChatInfoBody extends StatefulWidget {
  const ChatInfoBody({super.key, required this.receiverID});
  final String receiverID;

  @override
  State<ChatInfoBody> createState() => _ChatInfoBodyState();
}

class _ChatInfoBodyState extends State<ChatInfoBody> {
  late TextEditingController? _controller;
  late ScrollController _scrollcontroller;
  @override
  void initState() {
    _controller = TextEditingController();
    _scrollcontroller = ScrollController();
    super.initState();
  }

  @override
  void deactivate() {
    _controller!.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Expanded(
          flex: 9,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 16, left: 10, right: 10),
            decoration: BoxDecoration(
              color: ColorManager.primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _scrollcontroller,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: myID ==
                                ChatCubit.get(context).messages[index].senderid
                            ? senderMessage(context,
                                model: ChatCubit.get(context).messages[index])
                            : reciverMessage(context,
                                model: ChatCubit.get(context).messages[index]),
                      );
                    },
                    itemCount: ChatCubit.get(context).messages.length,
                  ),
                ),
                if (ChatCubit.get(context).galleryImage != null)
                  const SelectedChatImage(),
                CustomTextField(
                  onPressed2: () {
                    ChatCubit.get(context)
                        .getGalleryImage(source: ImageSource.gallery);
                  },
                  controller: _controller,
                  onPressed: () {
                    if (_controller!.text.isNotEmpty && _controller != null) {
                      ChatCubit.get(context).sendMessage(
                        receiverId: widget.receiverID,
                        dateTime: DateTime.now().toString(),
                        text: _controller!.text,
                      );
                      _controller!.clear();
                      scrollDown();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void scrollDown() {
    Future.delayed(const Duration(milliseconds: 300)).then((value) {
      _scrollcontroller.animateTo(
        0,
        duration: const Duration(milliseconds: 600),
        curve: Curves.fastOutSlowIn,
      );
    });
  }

  Align reciverMessage(BuildContext context, {required MessageModel model}) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, top: 14, bottom: 14, right: 10),
        constraints: BoxConstraints(maxWidth: MyDevice.getWidth(context) / 1.5),
        decoration: BoxDecoration(
          color: ColorManager.primaryFont,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        child: Text(
          model.text!,
          style: TextStyle(color: ColorManager.primary, fontSize: 16),
        ),
      ),
    );
  }

  Align senderMessage(BuildContext context, {required MessageModel model}) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, top: 14, bottom: 14, right: 10),
        constraints: BoxConstraints(maxWidth: MyDevice.getWidth(context) / 1.5),
        decoration: BoxDecoration(
          color: ColorManager.second,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            Text(
              model.text!,
              style: TextStyle(color: ColorManager.primaryFont, fontSize: 16),
            ),
            Text(model.datetime!,
                style: TextStyle(color: ColorManager.primaryFont, fontSize: 8))
          ],
        ),
      ),
    );
  }
}
