import 'package:equatable/equatable.dart';

abstract class CheckTokenEvent extends Equatable{
  const CheckTokenEvent();
  @override
  List<Object> get props=>[];
}

class CheckTokenStart extends CheckTokenEvent{}