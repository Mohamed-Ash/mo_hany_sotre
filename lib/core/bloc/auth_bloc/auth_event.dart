part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuhtLogoutRequestEvent extends AuthEvent{}

class AuhtUserChangeEvent extends AuthEvent{
  final User user ;

  const AuhtUserChangeEvent(this.user);

  @override
  List<Object> get props => [user];
}