import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class PasswordVisibilityEvent {}

class TogglePasswordVisibility extends PasswordVisibilityEvent {}

// States
class PasswordVisibilityState {
  final bool isPasswordVisible;
  PasswordVisibilityState({required this.isPasswordVisible});
}

// BLoC
class PasswordVisibilityBloc
    extends Bloc<PasswordVisibilityEvent, PasswordVisibilityState> {
  PasswordVisibilityBloc()
      : super(PasswordVisibilityState(isPasswordVisible: false));

  Stream<PasswordVisibilityState> mapEventToState(
      PasswordVisibilityEvent event) async* {
    if (event is TogglePasswordVisibility) {
      yield PasswordVisibilityState(
          isPasswordVisible: !state.isPasswordVisible);
    }
  }
}
