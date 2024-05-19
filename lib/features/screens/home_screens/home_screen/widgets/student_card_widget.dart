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
        MyMediaQueries.instance.getWidthMediaQuery(context, 0.03),
        index == 0 ? MyMediaQueries.instance.getHeightMediaQuery(context, 0.02) : 0,
        MyMediaQueries.instance.getWidthMediaQuery(context, 0.03),
        MyMediaQueries.instance.getWidthMediaQuery(context, 0.02),
      ),
      padding: EdgeInsets.fromLTRB(
        MyMediaQueries.instance.getWidthMediaQuery(context, 0.01),
        MyMediaQueries.instance.getHeightMediaQuery(context, 0.01),
        MyMediaQueries.instance.getHeightMediaQuery(context, 0.025),
        MyMediaQueries.instance.getHeightMediaQuery(context, 0.01),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: themeChecker.isLightMode(context) ? colors.kWhiteColor : colors.kGreyColorShade100,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MyMediaQueries.instance.getWidthMediaQuery(context, 0.15),
            height: MyMediaQueries.instance.getHeightMediaQuery(context, 0.15),
            padding: EdgeInsets.all(MyMediaQueries.instance.getHeightMediaQuery(context, 0.01)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: themeChecker.isLightMode(context) ? colors.kPurpleColorShade50 : colors.kWhiteColor,
            ),
            child: Center(
              child: Text(
                student.firstName.substring(0, 1),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: themeChecker.isLightMode(context) ? colors.kPurpleColor : colors.kBlackColor,
                    ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          NameBoxWithNameAndCourse(student: student),
          ScoreAndDateWidgets(student: student),
        ],
      ),
    );
  }
}
