import 'package:equatable/equatable.dart';

// Define abstract class for splash states
abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object?> get props => [];
}

// Initial state (loading state)
class SplashInitial extends SplashState {}

class SplashInProgress extends SplashState {}

// State when the user is authenticated
class Authenticated extends SplashState {}

// State when the user is unauthenticated
class Unauthenticated extends SplashState {}

//state for when splash screen is done
class SplashDone extends SplashState {}
