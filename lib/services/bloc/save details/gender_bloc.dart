import 'package:flutter_bloc/flutter_bloc.dart';

class GenderState {
  final String selectedGender;
  GenderState({required this.selectedGender});
}

class GenderCubit extends Cubit<GenderState> {
  GenderCubit() : super(GenderState(selectedGender: 'Male')); // Default to Male

  void selectGender(String gender) {
    emit(GenderState(selectedGender: gender));
  }
}
