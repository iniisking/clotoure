import 'package:equatable/equatable.dart';

//define the abstract class for the sign up event

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

// Event triggered when the user submits the sign up form

class SignUpSubmitted extends SignUpEvent {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  const SignUpSubmitted({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  @override
  List<Object> get props => [email, password, firstName, lastName];
}
