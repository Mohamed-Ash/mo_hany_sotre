import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:m_hany_store/core/model/authentication/user.dart';

class AuthRepository{
  final firebase_auth.FirebaseAuth _firebaseAuth;

  AuthRepository({firebase_auth.FirebaseAuth? firebaseAuth})
   : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance; 
  
  var currentUser = User.empty;

  Stream<User> get user{
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      currentUser = user;
      return user;
    });
  }

  Future<void> signUp({
    required String email , 
    required String password
  }) async {
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } catch(e){
      debugPrint(e.toString());
    }
  }
  
  Future<void> loginWithEmailAndPassword({
    required String email , 
    required String password
  }) async {
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      debugPrint(e.toString());  
    }
  }

 Future<void> logOut() async {
  try{
    await Future.wait([_firebaseAuth.signOut()]);
  }catch (e){
    debugPrint(e.toString());
  }
 }
}
extension on firebase_auth.User{
  User get toUser{
    return User(id: uid , email: email, name: displayName, photo:  photoURL);
  }
} 