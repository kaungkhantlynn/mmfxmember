import 'package:equatable/equatable.dart';

abstract class LogInEvent extends Equatable{
  const LogInEvent();
  @override
  List<Object> get props=>[];
}

class LogInStarted extends LogInEvent {
}

class LogInPressedButton extends LogInEvent {
  final String phone;
  final String password;

  LogInPressedButton({required this.phone,required this.password});
}