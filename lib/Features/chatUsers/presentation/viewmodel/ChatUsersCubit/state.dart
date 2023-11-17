class ChatUsers {}

class InitState extends ChatUsers {}

class GetUsersLoadingState extends ChatUsers {}

class GetUsersSuccessState extends ChatUsers {}

class GetUsersFailureState extends ChatUsers {
  final String error;

  GetUsersFailureState({required this.error});
}
