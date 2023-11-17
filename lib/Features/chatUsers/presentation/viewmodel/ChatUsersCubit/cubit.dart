import 'dart:developer';

import 'package:chatapp/Core/models/user_model.dart';
import 'package:chatapp/Features/chatUsers/presentation/viewmodel/ChatUsersCubit/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatUsersCubit extends Cubit<ChatUsers> {
  ChatUsersCubit() : super(InitState());
  static ChatUsersCubit get(context) => BlocProvider.of(context);
  List<UserModel> users = [];
  getUsers() {
    emit(GetUsersLoadingState());
    FirebaseFirestore.instance.collection("Users").get().then((value) {
      for (var user in value.docs) {
        users.add(UserModel.fromJson(user.data()));
      }
      log(users[0].toString());
      emit(GetUsersSuccessState());
    }).catchError((error) {
      log(error.toString());
      emit(GetUsersFailureState(error: error.toString()));
    });
  }
}
