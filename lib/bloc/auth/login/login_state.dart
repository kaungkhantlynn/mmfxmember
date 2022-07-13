import 'package:equatable/equatable.dart';

import '../../../models/auth/login_data.dart';


abstract class LogInState extends Equatable{
  const LogInState();

  @override
  List<Object> get props => [];
}

class LogInInitialized extends LogInState {}

class LogInLoading extends LogInState {
}

class LogInSuccess extends LogInState {
  final LogInData logInData;
  LogInSuccess({required this.logInData});
}

class LogInError extends LogInState {
  final String errorMessage;
  LogInError({required this.errorMessage});
}