import 'package:equatable/equatable.dart';

// Define abstract class for sign-up states
abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object?> get props => [];
}

// Initial state before anything happens
class SignUpInitial extends SignUpState {}

// State when sign-up is in progress
class SignUpLoading extends SignUpState {}

// State when sign-up is successful
class SignUpSuccess extends SignUpState {
  final String userId;

  const SignUpSuccess({required this.userId});

  @override
  List<Object?> get props => [userId];
}

// State when sign-up fails
class SignUpFailure extends SignUpState {
  final String error;

  const SignUpFailure(this.error);

  @override
  List<Object?> get props => [error];
}
