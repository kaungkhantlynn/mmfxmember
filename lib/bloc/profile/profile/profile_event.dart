import 'package:equatable/equatable.dart';
import 'dart:io';

abstract class ProfileEvent extends Equatable{
  const ProfileEvent();
  @override
  List<Object> get props=>[];
}

class ProfileStarted extends ProfileEvent {}

class FetchProfile extends ProfileEvent {}