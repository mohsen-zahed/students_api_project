import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:students_api_project/config/exception/app_exception.dart';
import 'package:students_api_project/features/data/repository/istudent_repository.dart';

part 'add_student_event.dart';
part 'add_student_state.dart';

class AddStudentBloc extends Bloc<AddStudentEvent, AddStudentState> {
  final IStudentRepository iStudentRepository;
  AddStudentBloc(this.iStudentRepository) : super(AddStudentLoading()) {
    on<AddStudentEvent>((event, emit) async {
      if (event is IsStudentAddedButtonClicked) {
        try {
          emit(AddStudentLoading());
          await iStudentRepository.addStudent(
            event.firstName,
            event.lastName,
            event.course,
            event.score,
          );
          await Future.delayed(const Duration(seconds: 2));
          emit(AddStudentSuccess());
        } on DioException catch (e) {
          if (e.type == DioExceptionType.badResponse) {
            emit(AddStudentFailed(
              exception: AppException(
                  errorMessage: 'خطا در اتصال، اینترنت خود را چک کنید!'),
            ));
          } else if (e.type == DioExceptionType.connectionError) {
            emit(AddStudentFailed(
              exception: AppException(errorMessage: 'خطا در اتصال'),
            ));
          } else if (e.type == DioExceptionType.connectionTimeout) {
            emit(AddStudentFailed(
              exception: AppException(errorMessage: 'تلاش دوباره'),
            ));
          } else if (e.type == DioExceptionType.sendTimeout) {
            emit(AddStudentFailed(
              exception: AppException(errorMessage: 'تلاش دوباره'),
            ));
          } else if (e.type == DioExceptionType.unknown) {
            emit(AddStudentFailed(
              exception: AppException(errorMessage: 'خطای نامشخص'),
            ));
          } else {
            emit(AddStudentFailed(
              exception: AppException(errorMessage: 'خطایی نامشخص'),
            ));
          }
        }
      }
    });
  }
}
