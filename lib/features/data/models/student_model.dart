class StudentModel {
  int id;
  String firstName;
  String lastName;
  String course;
  int score;
  String createdAt;
  String updatedAt;

  StudentModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        firstName = json['first_name'],
        lastName = json['last_name'],
        course = json['course'],
        score = json['score'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];
}
