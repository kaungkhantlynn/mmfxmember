import 'package:equatable/equatable.dart';

import '../../../models/auth/profile_info.dart';

abstract class ProfileState extends Equatable{
  ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitialized extends ProfileState {}

class ProfileLoading extends ProfileState {
}

class ProfileSuccess extends ProfileState {
  final ProfileInfo profileInfo;
  ProfileSuccess({required this.profileInfo});
}

class ProfileError extends ProfileState {
  final String errorMessage;
  ProfileError({required this.errorMessage});
}