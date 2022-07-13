import 'package:equatable/equatable.dart';

abstract class AuthorFollowEvent extends Equatable{
  const AuthorFollowEvent();
  @override
  List<Object> get props=>[];
}

class AuthorFollowStarted extends AuthorFollowEvent {}

class FollowAuthor extends AuthorFollowEvent {
  String id;
  FollowAuthor({required this.id});
}