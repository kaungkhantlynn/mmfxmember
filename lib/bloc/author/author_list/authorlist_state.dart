import 'package:equatable/equatable.dart';

import '../../../models/author/author_list_model.dart';

abstract class AuthorListState extends Equatable{
  AuthorListState();

  @override
  List<Object> get props => [];
}

class AuthorListInitialized extends AuthorListState {}

class AuthorListLoading extends AuthorListState {
}

class AuthorListSuccess extends AuthorListState {
  final AuthorListModel authorListModel;
  AuthorListSuccess({required this.authorListModel});
}

class AuthorListError extends AuthorListState {
  final String errorMessage;
  AuthorListError({required this.errorMessage});
}