import 'package:equatable/equatable.dart';

import '../../../models/auth/profile_info.dart';

abstract class UpdateProfileState extends Equatable{
  const UpdateProfileState();

  @override
  List<Object> get props => [];
}

class UpdateProfileInitialized extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  final ProfileInfo profileInfo;
  UpdateProfileSuccess({required this.profileInfo});
}

class UpdateProfileError extends UpdateProfileState {
  final String errorMessage;
  UpdateProfileError({required this.errorMessage});
}