import 'package:equatable/equatable.dart';

abstract class CheckTokenState extends Equatable{
  @override
  List<Object> get props => [];
}

class CheckTokenInitialize extends CheckTokenState {}
class CheckTokenLoading extends CheckTokenState{}

class CheckTokenLoaded extends CheckTokenState{
  final bool success;
  CheckTokenLoaded({required this.success});
}