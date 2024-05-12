import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:students_api_project/config/exception/app_exception.dart';
import 'package:students_api_project/features/data/models/student_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_api_project/features/data/repository/istudent_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IStudentRepository iStudentRepository;
  HomeBloc(this.iStudentRepository) : super(HomeLoading()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeStarted) {
        try {
          emit(HomeLoading());
          final result = await iStudentRepository.getAllStudents();
          emit(HomeSuccess(students: result));
        } on DioException catch (e) {
          if (e.type == DioExceptionType.badResponse) {
            emit(HomeFailed(
              exception: AppException(
                  errorMessage: 'خطا در اتصال، اینترنت خود را چک کنید!'),
            ));
          } else if (e.type == DioExceptionType.connectionError) {
            emit(HomeFailed(
              exception: AppException(errorMessage: 'خطا در اتصال'),
            ));
          } else if (e.type == DioExceptionType.connectionTimeout) {
            emit(HomeFailed(
              exception: AppException(errorMessage: 'تلاش دوباره'),
            ));
          } else if (e.type == DioExceptionType.sendTimeout) {
            emit(HomeFailed(
              exception: AppException(errorMessage: 'تلاش دوباره'),
            ));
          } else if (e.type == DioExceptionType.unknown) {
            emit(HomeFailed(
              exception: AppException(errorMessage: 'خطای نامشخص'),
            ));
          } else {
            emit(HomeFailed(
              exception: AppException(errorMessage: 'خطایی نامشخص'),
            ));
          }
        }
      }
    });
  }
}
