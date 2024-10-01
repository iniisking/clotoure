import 'package:cloture/services/firebase/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthService authService;

  SplashBloc({required this.authService}) : super(SplashInitial()) {
    on<SplashStart>((event, emit) async {
      emit(SplashInitial()); // Emit initial loading state
      await Future.delayed(const Duration(seconds: 5)); // Delay for 7 seconds
      add(CheckAuthenticationEvent()); // After delay, check authentication
    });

    on<CheckAuthenticationEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 5)); // Delay for 7 seconds
      try {
        var user = authService.currentUser; // Get current user

        if (user != null) {
          emit(Authenticated()); // Emit Authenticated state if user exists
        } else {
          emit(
              Unauthenticated()); // Emit Unauthenticated state if no user is found
        }
      } catch (e) {
        emit(Unauthenticated()); // Emit Unauthenticated if any error occurs
      }
    });
  }
}
