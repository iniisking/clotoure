import 'package:cloture/services/firebase/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthService authService;

  SignUpBloc({required this.authService}) : super(SignUpInitial()) {
    on<SignUpSubmitted>((event, emit) async {
      emit(SignUpLoading()); // Emit loading state

      try {
        // Call the AuthService to register the user
        var user = await authService.registerWithEmail(
          event.email,
          event.password,
          event.firstName,
          event.lastName,
        );

        if (user != null) {
          emit(
            SignUpSuccess(userId: user.uid),
          ); // Emit success state if user is registered
        } else {
          emit(const SignUpFailure(
              'Sign up failed')); // Emit failure if something went wrong
        }
      } catch (e) {
        emit(
          SignUpFailure(
            e.toString(),
          ),
        ); // Emit failure state if an error occurs
      }
    });
  }
}
