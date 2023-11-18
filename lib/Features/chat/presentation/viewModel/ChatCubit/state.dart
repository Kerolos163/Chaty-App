class ChatState {}

class IniteState extends ChatState {}

class SendMessageLoadingState extends ChatState {}

class SendMessageSuccessState extends ChatState {}

class SendMessageFailureState extends ChatState {
  final String error;

  SendMessageFailureState({required this.error});
}
class GetMessageSuccessState extends ChatState {}