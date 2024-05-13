import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_api_project/features/data/repository/istudent_repository.dart';
import 'package:students_api_project/features/screens/home_screens/add_student_screen/add_student_screen.dart';
import 'package:students_api_project/features/screens/home_screens/home_screen/bloc/home_bloc.dart';
import 'package:students_api_project/features/screens/home_screens/home_screen/widgets/student_card_widget.dart';
import 'package:students_api_project/features/screens/home_screens/home_screen/widgets/student_info_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, AddStudentScreen.id);
        },
        label: const Row(
          children: [
            Text('Add Student'),
            SizedBox(width: 2),
            Icon(Icons.add, size: 18),
          ],
        ),
      ),
      body: BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(studentRepository)..add(HomeStarted()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeSuccess) {
              return ListView.builder(
                itemCount: state.students.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            StudentInfoDialog(student: state.students[index]),
                      );
                    },
                    child: StudentCardWidget(
                      student: state.students[index],
                      index: index,
                    ),
                  );
                },
              );
            } else if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeFailed) {
              return Center(
                child: Text(state.exception.errorMessage),
              );
            } else {
              throw 'state not supported';
            }
          },
        ),
      ),
    );
  }
}
