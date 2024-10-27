import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_player/logic/theme_cubit/theme_cubit.dart';

import '../../../../../../logic/theme_cubit/theme_state.dart';

class AppBarThemeModeButtonWidget extends StatelessWidget {
  const AppBarThemeModeButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30,
      onPressed: () {
        context.read<ThemeCubit>().toggleThemeMode();
      },
      icon: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return Icon(state.isDarkMode
              ? Icons.sunny
              : Icons.dark_mode);
        },
      ),
    );
  }
}