import 'package:flutter/material.dart';
import 'package:students_api_project/features/data/models/student_model.dart';
import 'package:students_api_project/features/data/source/istudent_data_source.dart';
import 'package:students_api_project/packages/dio_package/dio.dart';

final studentRepository = StudentRepositoryImp(iStudentDataSource: StudentDataSourceImp(httpClient: MyDio.httpClient));

abstract class IStudentRepository extends ChangeNotifier {
  Future<List<StudentModel>> getAllStudents();
  Future<void> addStudent(String firstName, String lastName, String course, int score);
}

class StudentRepositoryImp extends IStudentRepository {
  final IStudentDataSource iStudentDataSource;
  static List<StudentModel> studentsList = [];

  StudentRepositoryImp({required this.iStudentDataSource});
  @override
  Future<List<StudentModel>> getAllStudents() async {
    studentsList = await iStudentDataSource.getAllStudents();
    return studentsList;
  }

  @override
  Future<void> addStudent(String firstName, String lastName, String course, int score) async {
    return await iStudentDataSource.addStudent(firstName, lastName, course, score);
  }
}
