import 'package:dio/dio.dart';
import 'package:students_api_project/features/data/models/student_model.dart';

abstract class IStudentDataSource {
  Future<List<StudentModel>> getAllStudents();
}

class StudentDataSourceImp extends IStudentDataSource {
  final Dio httpClient;

  StudentDataSourceImp({required this.httpClient});
  @override
  Future<List<StudentModel>> getAllStudents() async {
    final response = await httpClient.get('/experts/student');
    List<StudentModel> students = [];
    for (var element in (response.data as List)) {
      students.add(StudentModel.fromJson(element));
    }
    return students;
  }
}
