import '../../../../../Core/utils/color_manager.dart';
import '../../viewmodel/LayOutCubit/cubit.dart';
import '../../viewmodel/LayOutCubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.house), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.star), label: "Story"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.idCard), label: "Info"),
          ],
          currentIndex: LayoutCubit.get(context).currentScreen,
          onTap: (value) {
            LayoutCubit.get(context).changeScreen(index: value);
          },
          backgroundColor: ColorManager.second,
          selectedIconTheme: const IconThemeData(size: 28),
          selectedItemColor: ColorManager.primary,
        );
      },
    );
  }
}
