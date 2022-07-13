import 'package:equatable/equatable.dart';
import 'dart:io';

abstract class AuthorListEvent extends Equatable{
  const AuthorListEvent();
  @override
  List<Object> get props=>[];
}

class AuthorListStarted extends AuthorListEvent {}

class FetchAuthorList extends AuthorListEvent {}