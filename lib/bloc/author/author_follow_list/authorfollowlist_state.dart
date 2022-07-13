import 'package:equatable/equatable.dart';

import '../../../models/author/followed_author_list.dart';

abstract class FollowedAuthorListState extends Equatable{
  FollowedAuthorListState();

  @override
  List<Object> get props => [];
}

class FollowedAuthorListInitialized extends FollowedAuthorListState {}

class FollowedAuthorListLoading extends FollowedAuthorListState {}

class FollowedAuthorListSuccess extends FollowedAuthorListState {
  final FollowedAuthorList followedAuthorList;
  FollowedAuthorListSuccess({required this.followedAuthorList});
}

class FollowedAuthorListError extends FollowedAuthorListState {
  final String errorMessage;
  FollowedAuthorListError({required this.errorMessage});
}