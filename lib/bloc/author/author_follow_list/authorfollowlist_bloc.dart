import 'package:equatable/equatable.dart';

abstract class FollowedAuthorListEvent extends Equatable{
  const FollowedAuthorListEvent();
  @override
  List<Object> get props=>[];
}

class FollowedAuthorListStarted extends FollowedAuthorListEvent {}

class FetchFollowedAuthorList extends FollowedAuthorListEvent {}