class StudentModel {
  int id;
  String firstName;
  String lastName;
  String course;
  int score;
  String createdAt;
  String updatedAt;

  StudentModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.course,
    required this.score,
    required this.createdAt,
    required this.updatedAt,
  });

  StudentModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        firstName = json['first_name'],
        lastName = json['last_name'],
        course = json['course'],
        score = json['score'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];
}

