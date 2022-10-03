import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:m_hany_store/core/model/authentication/user.dart';
import 'package:m_hany_store/core/repositories/common/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  // ignore: unused_field
  StreamSubscription<User>? _userSubscription;

  AuthBloc({required AuthRepository authRepository }) : _authRepository = authRepository, super(
    authRepository.currentUser.isNotEmpty ?
      AuthState.authenticated(authRepository.currentUser):const AuthState.unAuthenticated(),
    ){
    on<AuhtUserChangeEvent>(_onUserChangeEvent);
    on<AuhtLogoutRequestEvent>(onLogoutRequestEvent);
  }

  void _onUserChangeEvent(
    AuhtUserChangeEvent event , Emitter<AuthState> emit,
  ){
    emit(event.user.isNotEmpty ?
      AuthState.authenticated(event.user) : const AuthState.unAuthenticated());

  }
  
  void onLogoutRequestEvent(
    AuhtLogoutRequestEvent event , Emitter<AuthState> emit,
  ){
    unawaited(_authRepository.logOut());
  }

}
