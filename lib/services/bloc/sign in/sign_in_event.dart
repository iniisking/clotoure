import 'package:equatable/equatable.dart';

//definiing a sign in event
abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

//event for user sign in

class SignInWithEmailAndPasswordEvent extends SignInEvent {
  final String email;
  final String password;

  const SignInWithEmailAndPasswordEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
