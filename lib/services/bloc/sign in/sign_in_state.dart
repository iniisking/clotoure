import 'package:equatable/equatable.dart';

//define the absatract class for the sign in state

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

//initial state before the user attempts to log in
class SignInInitial extends SignInState {}

// state whhen log in is in progres
class SignInInProgress extends SignInState {}

//state when when sign in is successful
class SignInSuccess extends SignInState {
  final String userId;

  const SignInSuccess({required this.userId});

  @override
  List<Object> get props => [userId];
}

//state when log in fails
class SignInFailure extends SignInState {
  final String error;

  const SignInFailure({required this.error});

  @override
  List<Object> get props => [error];
}
