import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:open_player/logic/volume_cubit/volume_cubit.dart';
import 'package:open_player/presentation/pages/players/audio/widgets/audio_player_actions_buttons_widget.dart';
import 'package:open_player/presentation/pages/players/audio/widgets/audio_player_next_button_widget.dart';
import 'package:open_player/presentation/pages/players/audio/widgets/audio_player_position_and_duration_widget.dart';
import 'package:open_player/presentation/pages/players/audio/widgets/audio_player_previous_button_widget.dart';
import 'package:open_player/presentation/pages/players/audio/widgets/audio_player_seek_bar_widget.dart';
import 'package:open_player/utils/duration/formatDuration.dart';

import '../../../base/assets/fonts/app_fonts.dart';
import '../../../base/assets/images/app-images.dart';
import '../../../logic/audio_player_bloc/audio_player_bloc.dart';
import '../nothing_widget.dart';
import '../../pages/players/audio/ui/audio_player.dart';
import '../../pages/players/audio/widgets/audio_player_play_pause_button_widget.dart';

class MiniAudioPlayerWidget extends StatelessWidget {
  const MiniAudioPlayerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size mq = MediaQuery.sizeOf(context);
    return BlocSelector<AudioPlayerBloc, AudioPlayerState,
        AudioPlayerSuccessState?>(
      selector: (state) => state is AudioPlayerSuccessState ? state : null,
      builder: (context, playerState) {
        if (playerState == null) return nothing;
        return FadeInDown(
          duration: const Duration(milliseconds: 500),
          child: SizedBox(
            height: mq.height * 0.16,
            width: mq.width,
            child: StreamBuilder(
                stream: playerState.audioPlayerCombinedStream,
                builder: (context, snapshot) {
                  int? currentIndex = snapshot.data?.currentIndex ??
                      playerState.audioPlayer.currentIndex;
                  String title = currentIndex != null
                      ? playerState.audios[currentIndex].title
                      : "...";
                  return GestureDetector(
                    onTap: () {
                      ///!-----Show Player Screen ----///
                      showModalBottomSheet(
                        showDragHandle: false,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => const AudioPlayerPage(),
                      );
                    },
                    onVerticalDragUpdate: (details) {
                      context
                          .read<VolumeCubit>()
                          .changeAudioPlayerVolume(details: details);
                    },
                    child: Card(
                      color: Theme.of(context).colorScheme.primary,
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: mq.height * 0.05,
                          left: 10,
                          right: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //----- Thumbnail ----------//
                                if (!playerState.isSeeking)
                                  const CircleAvatar(
                                    maxRadius: 23,
                                    minRadius: 20,
                                    backgroundImage:
                                        AssetImage(AppImages.defaultProfile),
                                  ),
          
                                ///------------ Seeking Position --------//
                                if (playerState.isSeeking)
                                  CircleAvatar(
                                    radius: 23,
                                    child: Text(
                                      formatDuration(
                                        Duration(
                                          seconds:
                                              playerState.seekingPosition.toInt(),
                                        ),
                                      ),
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                  ),
          
                                const Gap(10),
          
                                ///--------------- Music Title ------------------//
                                Expanded(
                                  child: Text(
                                    title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontFamily: AppFonts.poppins,
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
          
                                ///------------- Buttons -------------///
                                const Gap(10),
                                AudioPlayerPreviousButtonWidget(),
                                AudioPlayerPlayPauseButtonWidget(
                                  iconSize: 30,
                                  pauseIcon: CupertinoIcons.pause_circle,
                                  playIcon: CupertinoIcons.play_circle,
                                ),
                                AudioPlayerNextButtonWidget(),
                              ],
                            ),
          
                            //--------- Next Section
                            const Expanded(
                              child: Row(
                                children: [
                                  //------ Position
                                  AudioPlayerPositionAndDurationWidget(
                                    showDuration: false,
                                    enablePadding: false,
                                  ),
          
                                  //----------- Slider
                                  Expanded(
                                    child: SliderTheme(
                                        data: SliderThemeData(
                                          activeTrackColor: Colors.white,
                                          thumbColor: Colors.white,
                                        ),
                                        child: AudioPlayerSeekBarWidget()),
                                  ),
          
                                  //------- Duration
                                  AudioPlayerPositionAndDurationWidget(
                                    showPosition: false,
                                    enablePadding: false,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        );
      },
    );
  }
}
