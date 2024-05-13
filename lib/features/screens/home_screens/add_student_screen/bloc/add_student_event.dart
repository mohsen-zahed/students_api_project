part of 'add_student_bloc.dart';

sealed class AddStudentEvent extends Equatable {
  const AddStudentEvent();

  @override
  List<Object> get props => [];
}

final class IsStudentAddedButtonClicked extends AddStudentEvent {
  final String firstName;
  final String lastName;
  final String course;
  final int score;
  const IsStudentAddedButtonClicked(
      this.firstName, this.lastName, this.course, this.score);
  @override
  List<Object> get props => [firstName, lastName, course, score];
}
