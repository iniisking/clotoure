import 'package:cloture/services/bloc/sign%20in/sign_in_event.dart';
import 'package:cloture/services/bloc/sign%20in/sign_in_state.dart';
import 'package:cloture/services/firebase/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Reference your AuthService

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthService authService;

  SignInBloc({required this.authService}) : super(SignInInitial()) {
    // When the SignInEvent is received, trigger the login process
    on<SignInWithEmailAndPasswordEvent>((event, emit) async {
      emit(
        // Emit loading state
        SignInInProgress(),
      );

      try {
        var user = await authService.signInWithEmail(
          // Implement this in your AuthService
          event.email,
          event.password,
        );

        if (user != null) {
          // Emit success state with userId
          emit(
            SignInSuccess(userId: user.uid),
          );
        } else {
          // Emit failure state with error message
          emit(const SignInFailure(error: 'Login failed. Please try again.'));
        }
      } catch (e) {
        emit(
          SignInFailure(
            error: e.toString(),
          ),
        );
      }
    });
  }
}
