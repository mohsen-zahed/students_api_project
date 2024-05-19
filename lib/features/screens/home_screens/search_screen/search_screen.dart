import 'package:flutter/material.dart';
import 'package:students_api_project/config/constants/colors.dart';
import 'package:students_api_project/features/data/models/student_model.dart';
import 'package:students_api_project/features/data/repository/istudent_repository.dart';
import 'package:students_api_project/features/screens/home_screens/home_screen/widgets/student_card_widget.dart';
import 'package:students_api_project/utils/media_queries/media_queries.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static const String id = '/search_screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ValueNotifier<String> studentSearchTermNotifier = ValueNotifier('');
  final TextEditingController searchTextEditingController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    studentSearchTermNotifier.dispose();
    searchTextEditingController.dispose();
    searchFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MyMediaQueries.instance.getHeightMediaQuery(context, 0.15),
              padding: EdgeInsets.symmetric(horizontal: MyMediaQueries.instance.getWidthMediaQuery(context, 0.05)),
              decoration: BoxDecoration(
                color: colors.kWhiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: TextField(
                  focusNode: searchFocusNode,
                  controller: searchTextEditingController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        searchTextEditingController.clear();
                        searchFocusNode.unfocus();
                      },
                      icon: Icon(
                        Icons.close,
                        size: MyMediaQueries.instance.getHeightMediaQuery(context, 0.05),
                      ),
                    ),
                    hintText: 'Search students...',
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    studentSearchTermNotifier.value = searchTextEditingController.text;
                  },
                ),
              ),
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: studentSearchTermNotifier,
                builder: (context, student, child) {
                  final List<StudentModel> items;
                  var students = StudentRepositoryImp.studentsList;
                  if (searchTextEditingController.text.isEmpty) {
                    items = students;
                  } else {
                    items = students.where((element) => element.firstName.contains(searchTextEditingController.text.toLowerCase())).toList();
                  }
                  if (items.isEmpty) {
                    return Center(
                        child: Text(
                      'No record found!',
                      style: Theme.of(context).textTheme.titleMedium,
                    ));
                  } else {
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return StudentCardWidget(student: items[index], index: index);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
