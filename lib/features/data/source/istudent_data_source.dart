import 'package:dio/dio.dart';
import 'package:students_api_project/features/data/models/student_model.dart';

abstract class IStudentDataSource {
  Future<List<StudentModel>> getAllStudents();
  Future<void> addStudent(
      String firstName, String lastName, String course, int score);
}

class StudentDataSourceImp extends IStudentDataSource {
  final Dio httpClient;

  StudentDataSourceImp({required this.httpClient});
  @override
  Future<List<StudentModel>> getAllStudents() async {
    final response = await httpClient.get('experts/student');
    List<StudentModel> students = [];
    for (var element in (response.data as List)) {
      students.add(StudentModel.fromJson(element));
    }
    return students;
  }

  @override
  Future<StudentModel> addStudent(
      String firstName, String lastName, String course, int score) async {
    final response = await httpClient.post('experts/student', data: {
      'first_name': firstName,
      'last_name': lastName,
      'course': course,
      'score': score,
    });
    return StudentModel.fromJson(response.data);
  }
}
