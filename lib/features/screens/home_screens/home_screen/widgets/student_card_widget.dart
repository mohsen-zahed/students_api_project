import 'package:flutter/material.dart';
import 'package:students_api_project/config/constants/colors.dart';
import 'package:students_api_project/features/data/models/student_model.dart';
import 'package:students_api_project/features/screens/home_screens/home_screen/widgets/name_box_with_name_and_course.dart';
import 'package:students_api_project/features/screens/home_screens/home_screen/widgets/score_and_date_widgets.dart';
import 'package:students_api_project/utils/media_queries/media_queries.dart';
import 'package:students_api_project/utils/theme_checker/theme_checker.dart';

class StudentCardWidget extends StatelessWidget {
  final StudentModel student;
  final int index;
  const StudentCardWidget({
    super.key,
    required this.student,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(
        mediaQueries.getWidthMediaQuery(context, 0.03),
        index == 0 ? mediaQueries.getHeightMediaQuery(context, 0.02) : 0,
        mediaQueries.getWidthMediaQuery(context, 0.03),
        mediaQueries.getWidthMediaQuery(context, 0.02),
      ),
      padding: EdgeInsets.fromLTRB(
        mediaQueries.getWidthMediaQuery(context, 0.01),
        mediaQueries.getHeightMediaQuery(context, 0.01),
        mediaQueries.getHeightMediaQuery(context, 0.025),
        mediaQueries.getHeightMediaQuery(context, 0.01),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: themeChecker.isLightMode(context)
            ? colors.kWhiteColor
            : colors.kGreyColorShade100,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NameBoxWithNameAndCourse(student: student),
          ScoreAndDateWidgets(student: student),
        ],
      ),
    );
  }
}
