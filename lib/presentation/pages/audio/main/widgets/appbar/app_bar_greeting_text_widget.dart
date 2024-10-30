import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_player/base/theme/app_textstyles.dart';

import '../../../../../../logic/greeting/greeting_cubit.dart';

class AppBarGreetingTextWidget extends StatelessWidget {
  const AppBarGreetingTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<GreetingCubit, GreetingState, String>(
      selector: (state) => state.greeting,
      builder: (context, state) {
        return Text(
          state,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.greeting1,
        );
      },
    );
  }
}
