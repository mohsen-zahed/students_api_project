part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeLoading extends HomeState {}

final class HomeFailed extends HomeState {
  final AppException exception;

  const HomeFailed({required this.exception});
  @override
  List<Object> get props => [exception];
}

final class HomeSuccess extends HomeState {
  final List<StudentModel> students;
  const HomeSuccess({required this.students});
  @override
  List<Object> get props => [students];
}
