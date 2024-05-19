import 'package:flutter/material.dart';
import 'package:students_api_project/config/constants/colors.dart';
import 'package:students_api_project/features/data/models/student_model.dart';
import 'package:students_api_project/utils/media_queries/media_queries.dart';

class NameBoxWithNameAndCourse extends StatelessWidget {
  final StudentModel student;
  const NameBoxWithNameAndCourse({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${student.firstName} ${student.lastName}',
            style: Theme.of(context).textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: MyMediaQueries.instance.getWidthMediaQuery(context, 0.01),
              vertical: MyMediaQueries.instance.getHeightMediaQuery(context, 0.01),
            ),
            decoration: BoxDecoration(
              color: colors.kGreyColorShade100,
              borderRadius: BorderRadius.circular(3),
            ),
            child: Text(
              student.course,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
