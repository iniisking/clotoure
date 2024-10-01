import 'package:equatable/equatable.dart';

// Define abstract class for splash events
abstract class SplashEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

//event to trigger the splash screen delay

class SplashStart extends SplashEvent {}

// Event to check if user is authenticated
class CheckAuthenticationEvent extends SplashEvent {}
