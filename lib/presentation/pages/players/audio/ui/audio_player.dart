import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:open_player/base/assets/fonts/app_fonts.dart';
import 'package:open_player/base/assets/images/app-images.dart';
import 'package:open_player/logic/now_playing_media_cubit/now_playing_media_cubit.dart';
import 'package:open_player/presentation/common/glassophate_widget.dart';
import 'package:open_player/presentation/pages/players/audio/widgets/audio_player_actions_buttons_widget.dart';
import 'package:open_player/presentation/pages/players/audio/widgets/audio_player_background_blur_image_widget.dart';
import 'package:open_player/presentation/pages/players/audio/widgets/audio_player_position_and_duration_widget.dart';
import 'package:open_player/presentation/pages/players/audio/widgets/audio_player_seek_bar_widget.dart';
import 'package:open_player/presentation/pages/players/audio/widgets/audio_player_thumbnail_widget.dart';
import 'package:open_player/presentation/pages/players/audio/widgets/audio_player_title_artist_favorite_button_row_widget.dart';
import 'package:open_player/presentation/pages/players/audio/widgets/audio_player_top_bar_widget.dart';

import '../../../../../logic/audio_player_bloc/audio_player_bloc.dart';
import '../../../../common/nothing_widget.dart';

class AudioPlayerPage extends StatelessWidget {
  const AudioPlayerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          //-------- Background Blur Image ---------//
          const AudioPlayerBackgroundBlurImageWidget(),

          //--------------- TopBar ------------//
          const AudioPlayerTopBarWidget(),

          //----------------- Thumbnail Image ---------------//

          const AudioPlayerThumbnailWidget(),

          //------------- Player Glassophate ----------------//
          Positioned(
            bottom: mq.height * 0.06,
            height: mq.height * 0.3,
            width: mq.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: mq.width * 0.05),
              child: const GlassophateWidget(
                child: Column(
                  children: [
                    //------------   Music Title & Artist And Favorite Button Row
                    AudioPlayerTitleArtistFavoriteButtonRowWidget(),

                    //------------ Seek Bar
                    AudioPlayerSeekBarWidget(),

                    //------------ Position & Duration
                    AudioPlayerPositionAndDurationWidget(),

                    //----- Buttons ----//
                    AudioPlayerActionsButtonsWidget()
                  ],
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}