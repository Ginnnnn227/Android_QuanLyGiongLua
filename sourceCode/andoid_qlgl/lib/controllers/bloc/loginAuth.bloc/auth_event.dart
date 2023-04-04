part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent{}

class Login extends AuthEvent{
  final String userName;
  final String passWord;
  Login(this.userName, this.passWord);
}