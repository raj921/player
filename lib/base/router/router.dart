import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:open_player/presentation/pages/players/audio/view/audio_player.dart';
import 'package:open_player/presentation/pages/players/video/view/video_player.dart';
import 'package:open_player/presentation/pages/settings/change_accent_color/view/change_accent_color_page.dart';
import 'package:open_player/presentation/pages/settings/language/view/language_page.dart';
import 'package:open_player/presentation/pages/settings/setting/privacy_policy/view/privacy_policy_page.dart';
import 'package:open_player/presentation/pages/settings/user_profile/view/user_profile_page.dart';
import 'package:open_player/presentation/pages/splash/view/splash_page.dart';
import 'package:open_player/presentation/pages/view_directory/view/view_directory_page.dart';
import '../../presentation/pages/main/view/main_page.dart';
import '../../presentation/pages/search/audio/view/search_audio_page.dart';
import '../../presentation/pages/search/videos/view/search_videos_page.dart';
import '../../presentation/pages/settings/setting/view/setting_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.splashRoute,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: AppRoutes.mainRoute,
      builder: (context, state) => MainPage(),
    ),
    GoRoute(
      path: AppRoutes.settingsRoute,
      builder: (context, state) => const SettingPage(),
    ),
    GoRoute(
      path: AppRoutes.userProfileRoute,
      name: AppRoutes.userProfileRoute,
      builder: (context, state) => const UserProfilePage(),
    ),
    GoRoute(
      path: AppRoutes.changeThemeRoute,
      builder: (context, state) => ChangeAccentColorPage(),
    ),
    GoRoute(
      name: AppRoutes.languageRoute,
      path: AppRoutes.languageRoute,
      builder: (context, state) => const LanguagePage(),
    ),

     GoRoute(
      name: AppRoutes.privacyPolicyRoute,
      path: AppRoutes.privacyPolicyRoute,
      builder: (context, state) => const PrivacyPolicyPage(),
    ),
    GoRoute(
        name: AppRoutes.audioPlayerRoute,
        path: AppRoutes.audioPlayerRoute,
        builder: (context, state) {
          return const AudioPlayerPage();
        }),
    GoRoute(
        name: AppRoutes.videoPlayerRoute,
        path: AppRoutes.videoPlayerRoute,
        builder: (context, state) {
          return VideoPlayerPage(
            
              );
        }),
    GoRoute(
      name: AppRoutes.searchAudiosRoute,
      path: AppRoutes.searchAudiosRoute,
      builder: (context, state) => const SearchAudioPage(),
    ),
    GoRoute(
      name: AppRoutes.searchVideosRoute,
      path: AppRoutes.searchVideosRoute,
      builder: (context, state) => const SearchVideosPage(),
    ),
    GoRoute(
      name: AppRoutes.viewDirectoryRoute,
      path: AppRoutes.viewDirectoryRoute,
      builder: (context, state) => const ViewDirectoryPage(),
    ),
  ],
  errorBuilder: (context, state) {
    return Scaffold(
      body: Center(
        child: Text(' ${state.error}'),
      ),
    );
  },
);



class AppRoutes {
  static const splashRoute = "/";
  static const mainRoute = '/main';
  static const homeRoute = "/home";
  static const settingsRoute = "/settings";
  static const aboutRoute = "/about";
  static const userProfileRoute = "/profile";
  static const privacyPolicyRoute = "/privacy_policy";
  static const changeThemeRoute = "/change_theme";
  static const languageRoute = "/language";
  static const audioPlayerRoute = "/audio_player";
  static const videoPlayerRoute = "/video_player";
  static const searchVideosRoute = "/search_video";
  static const searchAudiosRoute = "/search_audio";
  static const viewDirectoryRoute = "/view_directory";
}