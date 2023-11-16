import 'state.dart';
import '../../../../chatUsers/presentation/view/chat_users.dart';
import '../../../../info/presentation/view/info_view.dart';
import '../../../../story/presentation/view/story_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(InitState());
  static LayoutCubit get(context) => BlocProvider.of(context);
  List screens = const [
    UsersChatsView(),
    StoryView(),
    InfoView(),
  ];
  int currentScreen=0;
  changeScreen({required int index})
  {
    currentScreen=index;
    emit(ChangeScreenState());
  }
}
