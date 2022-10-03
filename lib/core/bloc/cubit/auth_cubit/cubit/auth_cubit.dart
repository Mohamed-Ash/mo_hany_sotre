// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:m_hany_store/core/repositories/common/auth_repository.dart';

part 'auth_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(LoginState.initial());

  void emailChange(String value){
    emit(state.copyWith(email: value,status:  LoginStatus.initial));
  }

  void passwordChange(String value){
    emit(state.copyWith(password: value, status:  LoginStatus.initial));
  }
  
  Future<void> loginWithCredentials()async{
    if(state.status == LoginStatus.submitting ) return;
    emit(state.copyWith(status:LoginStatus.submitting ));
    try{
      await _authRepository.loginWithEmailAndPassword(email: state.email, password: state.password);
      emit(state.copyWith(status: LoginStatus.success));
    }catch(e){
      print(e);
    }
  }
}
