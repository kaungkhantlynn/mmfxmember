import 'package:equatable/equatable.dart';

import '../../../models/author/author_follow_model.dart';

abstract class AuthorFollowState extends Equatable{
  AuthorFollowState();

  @override
  List<Object> get props => [];
}

class AuthorFollowInitialized extends AuthorFollowState {}

class AuthorFollowLoading extends AuthorFollowState {
}

class AuthorFollowSuccess extends AuthorFollowState {
  final AuthorFollowModel authorFollowModel;
  AuthorFollowSuccess({required this.authorFollowModel});
}

class AuthorFollowError extends AuthorFollowState {
  final String errorMessage;
  AuthorFollowError({required this.errorMessage});
}