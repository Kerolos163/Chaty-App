import 'dart:developer';
import 'dart:io';

import 'package:chatapp/Core/constant.dart';
import 'package:chatapp/Core/models/messagemodel.dart';
import 'package:chatapp/Features/chat/presentation/viewModel/ChatCubit/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(IniteState());
  static ChatCubit get(context) => BlocProvider.of(context);
  sendMessage({
    required String receiverId,
    required String dateTime,
    required String text,
    String? image,
  }) {
    MessageModel model = MessageModel(
      senderid: myID,
      datetime: dateTime,
      receiverid: receiverId,
      text: text,
      image: image,
    );
    emit(SendMessageLoadingState());
    FirebaseFirestore.instance
        .collection("Users")
        .doc(myID)
        .collection("Chats")
        .doc(receiverId)
        .collection("Messages")
        .add(model.tomap())
        .then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error) {
      emit(SendMessageFailureState(error: error.toString()));
    });
    FirebaseFirestore.instance
        .collection("Users")
        .doc(receiverId)
        .collection("Chats")
        .doc(myID)
        .collection("Messages")
        .add(model.tomap())
        .then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error) {
      emit(SendMessageFailureState(error: error.toString()));
    });
  }

  List<MessageModel> messages = [];
  void getMessage({required String receiverId}) {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(myID)
        .collection("Chats")
        .doc(receiverId)
        .collection("Messages")
        .orderBy('datetime', descending: true)
        .snapshots()
        .listen((event) {
      messages = [];
      for (var element in event.docs) {
        messages.add(MessageModel.fromJson(element.data()));
        log(messages.toString());
      }
      emit(GetMessageSuccessState());
    });
  }

  File? galleryImage;
  final ImagePicker _picker = ImagePicker();
  Future<void> getGalleryImage({required ImageSource source }) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      galleryImage = File(image.path);
      print('Get SendImage Done <----------------------------->');
      print(galleryImage);

      emit(GetSendImageSuccessState());
    } else {
      print("No Image Selected !");
      emit(GetSendImageErrorState());
    }
  }

  removeImage() {
    galleryImage = null;
    emit(RemoveMessageSuccessState());
  }
}
