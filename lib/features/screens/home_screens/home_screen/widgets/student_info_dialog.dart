import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:students_api_project/config/constants/colors.dart';
import 'package:students_api_project/config/constants/paths.dart';
import 'package:students_api_project/features/data/models/student_model.dart';
import 'package:students_api_project/utils/media_queries/media_queries.dart';

class StudentInfoDialog extends StatelessWidget {
  final StudentModel student;
  const StudentInfoDialog({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: colors.kPurpleColorShade50,
      content: SizedBox(
        width: mediaQueries.getWidthMediaQuery(context),
        height: mediaQueries.getHeightMediaQuery(context, 0.45),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: colors.kPurpleColorOpacity5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: paths.profilePlaceHolder,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ID: ${student.id}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'FullName: ${student.firstName} ${student.lastName}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Course: ${student.course}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Score: ${student.score}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Created At: ${student.createdAt}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Updated At: ${student.updatedAt}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
