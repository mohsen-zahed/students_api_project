part of 'add_student_bloc.dart';

sealed class AddStudentState extends Equatable {
  const AddStudentState();

  @override
  List<Object> get props => [];
}

final class AddStudentLoading extends AddStudentState {}

final class AddStudentSuccess extends AddStudentState {}

final class AddStudentFailed extends AddStudentState {
  final AppException exception;

  const AddStudentFailed({required this.exception});
  @override
  List<Object> get props => [exception];
}
