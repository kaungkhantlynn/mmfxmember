import 'package:equatable/equatable.dart';
import 'dart:io';

abstract class UpdateProfileEvent extends Equatable{
  const UpdateProfileEvent();
  @override
  List<Object> get props=>[];
}

class UpdateProfileStarted extends UpdateProfileEvent {
}

class UpdateProfilePressedButton extends UpdateProfileEvent {
  final String name;
  final String bio;
  final File photo;

  UpdateProfilePressedButton({required this.name, required this.bio, required this.photo});
}