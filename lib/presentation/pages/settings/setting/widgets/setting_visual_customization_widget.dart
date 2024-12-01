import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_player/logic/theme_cubit/theme_cubit.dart';
import 'package:open_player/presentation/pages/settings/setting/widgets/setting_bottom_navigation_bar_customization_widget.dart';
import 'package:open_player/presentation/pages/settings/setting/widgets/setting_change_app_bar_color_background_tile_widget.dart';
import 'package:open_player/presentation/pages/settings/setting/widgets/setting_change_scaffold_color_tile_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../logic/theme_cubit/theme_state.dart';

class SettingVisualCustomizationWidget extends StatelessWidget {
  const SettingVisualCustomizationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Visibility(
          visible: !state.defaultTheme,
          child: ExpansionTile(
              title: "Customization".text.make(),
              children: [
                ExpansionTile(
                  title: "Colors".text.bold.make(),
                  children: [
                    //--------- Change Scaffold Color
                    SettingChangeScaffoldColorTileWidget(),
          
                    //--------- Change App Bar Color
                    SettingChangeAppBarColorBackgroundTileWidget(),
                  ],
                ),
          
                //----------- Bottom Navigation Bar
                SettingBottomNavigationBarCustomizationWidget(),
              ]),
        );
      },
    );
  }
}
