import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:students_api_project/config/exception/app_exception.dart';
import 'package:students_api_project/features/data/repository/istudent_repository.dart';

part 'add_student_event.dart';
part 'add_student_state.dart';

class AddStudentBloc extends Bloc<AddStudentEvent, AddStudentState> {
  final IStudentRepository iStudentRepository;
  AddStudentBloc(this.iStudentRepository) : super(AddStudentLoading()) {
    on<AddStudentEvent>((event, emit) {
      if (event is IsStudentAddedButtonClicked) {
        try {
          emit(AddStudentLoading());
          final result = iStudentRepository.addStudent(
            event.firstName,
            event.lastName,
            event.course,
            event.score,
          );
        } catch (e) {}
      }
    });
  }
}
