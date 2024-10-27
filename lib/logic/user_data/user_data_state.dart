import 'package:equatable/equatable.dart';

import '../../base/db/hive/hive.dart';

/// Represents the state of user data
class UserDataState extends Equatable {
  final String username;
  final String? profileImagePath;
  final bool isLoggedIn;

  const UserDataState({
    required this.username,
    this.profileImagePath,
    required this.isLoggedIn,
  });

  /// Creates initial state with default values
  factory UserDataState.initial() =>  UserDataState(
        username: MyHiveBoxes.userBox.get(MyHiveKeys.userUsername)?? 'User',
        profileImagePath:
            MyHiveBoxes.userBox.get(MyHiveKeys.userProfilePicture),
        isLoggedIn: MyHiveBoxes.userBox.get(MyHiveKeys.userIsLoggedIn) ?? false,
      );

  /// Creates a copy of the current state with optional new values
  UserDataState copyWith({
    String? username,
    String? profileImagePath,
    bool? isLoggedIn,
  }) {
    return UserDataState(
      username: username ?? this.username,
      profileImagePath: profileImagePath ?? this.profileImagePath,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }

  @override
  List<Object?> get props => [username, profileImagePath, isLoggedIn];
}