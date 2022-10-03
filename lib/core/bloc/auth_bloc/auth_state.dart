part of 'auth_bloc.dart';
enum AuthAstaus{ authenticated, unAuthenticated}

 class AuthState extends Equatable {
  final AuthAstaus staus;
  final User user;

  const AuthState._({
    required this.staus,
    this.user = User.empty
  });

  const AuthState.authenticated(User user) : this._(
    staus: AuthAstaus.authenticated,
    user: user
  );

  const AuthState.unAuthenticated() : this._(
    staus: AuthAstaus.unAuthenticated,
  );
  // const AuthState.AuthAstaus(User user);
  
  @override
  List<Object> get props => [staus,user];
}

// class AuthInitial extends AuthState {}
