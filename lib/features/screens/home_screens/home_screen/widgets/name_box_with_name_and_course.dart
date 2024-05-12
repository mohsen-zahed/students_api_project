import 'package:flutter/material.dart';
import 'package:students_api_project/config/constants/colors.dart';
import 'package:students_api_project/features/data/models/student_model.dart';
import 'package:students_api_project/utils/media_queries/media_queries.dart';
import 'package:students_api_project/utils/theme_checker/theme_checker.dart';

class NameBoxWithNameAndCourse extends StatelessWidget {
  final StudentModel student;
  const NameBoxWithNameAndCourse({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: mediaQueries.getWidthMediaQuery(context, 0.15),
          height: mediaQueries.getHeightMediaQuery(context, 0.15),
          padding:
              EdgeInsets.all(mediaQueries.getHeightMediaQuery(context, 0.01)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: themeChecker.isLightMode(context)
                ? colors.kPurpleColorShade50
                : colors.kWhiteColor,
          ),
          child: Center(
            child: Text(
              student.firstName.substring(0, 1),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: themeChecker.isLightMode(context)
                        ? colors.kPurpleColor
                        : colors.kBlackColor,
                  ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${student.firstName} ${student.lastName}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 2),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: mediaQueries.getWidthMediaQuery(context, 0.01),
                vertical: mediaQueries.getHeightMediaQuery(context, 0.01),
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
      ],
    );
  }
}
