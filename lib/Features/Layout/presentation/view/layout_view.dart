import 'widget/bottom_navigation_bar.dart';
import '../viewmodel/LayOutCubit/cubit.dart';
import '../viewmodel/LayOutCubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          return Scaffold(
            body: LayoutCubit.get(context)
                .screens[LayoutCubit.get(context).currentScreen],
            bottomNavigationBar: const BottomNavigationBarWidget(),
          );
        },
      ),
    );
  }
}
