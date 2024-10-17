import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:open_player/presentation/common/texty.dart';
import 'package:open_player/presentation/pages/settings/setting/widgets/setting_black_mode_switch_list_tile_widget.dart';
import 'package:open_player/presentation/pages/settings/setting/widgets/setting_bottom_navigation_bar_customization_widget.dart';
import 'package:open_player/presentation/pages/settings/setting/widgets/setting_change_app_bar_color_background_tile_widget.dart';
import 'package:open_player/presentation/pages/settings/setting/widgets/setting_change_bottom_nav_bar_bg_color_tile_widget.dart';
import 'package:open_player/presentation/pages/settings/setting/widgets/setting_change_scaffold_color_tile_widget.dart';
import 'package:open_player/presentation/pages/settings/setting/widgets/setting_change_theme_list_tile_widget.dart';
import 'package:open_player/presentation/pages/settings/setting/widgets/setting_contrast_level_widget.dart';
import 'package:open_player/presentation/pages/settings/setting/widgets/setting_dark_mode_button_widget.dart';
import 'package:open_player/presentation/pages/settings/setting/widgets/setting_material3_switch_list_tile_widget.dart';
import 'package:open_player/presentation/pages/settings/setting/widgets/setting_restore_to_default_setting_widget.dart';
import 'package:open_player/presentation/pages/settings/setting/widgets/setting_toggle_default_theme_switch_list_tile_widget.dart';
import 'package:open_player/presentation/pages/settings/setting/widgets/setting_visual_customization_widget.dart';

import '../../../../../base/assets/fonts/app-fonts.dart';
import '../../../../../logic/theme_cubit/theme_cubit.dart';
import '../../../../../logic/theme_cubit/theme_state.dart';
// import 'package:open_player/presentation/pages/settings/setting/widgets/setting_visual_customization_widget.dart';

class SettingAppearanceSectionWidget extends StatelessWidget {
  const SettingAppearanceSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: Row(
        children: [
          const Texty(
            en: "APPEARANCE",
            ar: "مظهر",
            es: "APARIENCIA",
            fr: "APPARENCE",
            hi: "दिखावट",
            ur: "ظاہری",
            zh: "外观",
            ps: "ظاهر",
            kr: "외관",
            ru: "ВИД",
            style: TextStyle(fontSize: 20, letterSpacing: 1),
          ),
          Icon(
            CupertinoIcons.color_filter,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
      children: const [
        //!-------------------- Restore To Default Setting----------------///
        SettingRestoreToDefaultSettingWidget(),

        ///!-------------------Default/Custom Theme Switch Tile-----------------------------///
        SettingToggleDefaultThemeSwitchListTileWidget(),

        //!-------------------Change Theme Switch Tile-----------------------------///
        SettingChangeThemeSwitchListTileWidget(),

        //!-------------------- Use Material Switch Tile -------------------------//
        SettingMaterial3SwitchListTileWidget(),

        //!-------------------Dark Mode Switch Tile-----------------------------///
        SettingDarkModeButtonWidget(),

        //!-------------------Black Mode Switch Tile-----------------------------///
        SettingBlackModeSwitchListTileWidget(),

        //!-------------------Visual Customization-----------------------------///

        SettingVisualCustomizationWidget()
      ],
    );
  }
}
