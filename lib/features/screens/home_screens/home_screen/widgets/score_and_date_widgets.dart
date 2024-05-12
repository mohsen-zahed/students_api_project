import 'package:flutter/material.dart';
import 'package:students_api_project/features/data/models/student_model.dart';

class ScoreAndDateWidgets extends StatelessWidget {
  final StudentModel student;
  const ScoreAndDateWidgets({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          student.score.toString(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 5),
        Text(
          student.createdAt,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
