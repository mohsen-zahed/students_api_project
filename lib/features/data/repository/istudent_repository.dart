import 'package:students_api_project/features/data/models/student_model.dart';
import 'package:students_api_project/features/data/source/istudent_data_source.dart';
import 'package:students_api_project/packages/dio_package/dio.dart';

final studentRepository = StudentRepositoryImp(
    iStudentDataSource: StudentDataSourceImp(httpClient: MyDio.httpClient));

abstract class IStudentRepository {
  Future<List<StudentModel>> getAllStudents();
}

class StudentRepositoryImp extends IStudentRepository {
  final IStudentDataSource iStudentDataSource;

  StudentRepositoryImp({required this.iStudentDataSource});
  @override
  Future<List<StudentModel>> getAllStudents() =>
      iStudentDataSource.getAllStudents();
}
