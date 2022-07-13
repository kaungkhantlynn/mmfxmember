import 'package:equatable/equatable.dart';
import 'dart:io';

abstract class PublicPostsEvent extends Equatable{
  const PublicPostsEvent();
  @override
  List<Object> get props=>[];
}

class PulbicPostsStarted extends PublicPostsEvent {}

class FetchPublicPosts extends PublicPostsEvent {}