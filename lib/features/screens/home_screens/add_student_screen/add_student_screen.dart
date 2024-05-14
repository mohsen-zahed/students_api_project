import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_api_project/config/constants/colors.dart';
import 'package:students_api_project/features/data/repository/istudent_repository.dart';
import 'package:students_api_project/features/screens/home_screens/add_student_screen/bloc/add_student_bloc.dart';
import 'package:students_api_project/features/screens/home_screens/add_student_screen/widgets/custom_text_field_widget.dart';
import 'package:students_api_project/utils/media_queries/media_queries.dart';

class AddStudentScreen extends StatefulWidget {
  static const String id = 'add_student_screen';
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final TextEditingController _firstNameController =
      TextEditingController(text: 'Amir Mohsen');
  final TextEditingController _lastNameController =
      TextEditingController(text: 'Zahed');
  final TextEditingController _courseController =
      TextEditingController(text: 'Flutter');
  final TextEditingController _scoreController =
      TextEditingController(text: '1000');

  StreamSubscription? streamSubscription;

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _courseController.dispose();
    _scoreController.dispose();
    streamSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddStudentBloc>(
      create: (BuildContext context) {
        final bloc = AddStudentBloc(studentRepository);
        streamSubscription = bloc.stream.listen((state) {
          if (state is AddStudentSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Student added successfully'),
            ));
            Navigator.pop(context);
          } else if (state is AddStudentFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.exception.errorMessage),
            ));
          }
        });
        return bloc;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Student'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFieldWidget(
                labelText: 'First Name',
                hintText: 'First Name',
                onChanged: (value) {},
                textEditingController: _firstNameController,
              ),
              const SizedBox(height: 20),
              CustomTextFieldWidget(
                labelText: 'Last Name',
                hintText: 'Last Name',
                onChanged: (value) {},
                textEditingController: _lastNameController,
              ),
              const SizedBox(height: 20),
              CustomTextFieldWidget(
                labelText: 'Course',
                hintText: 'Course',
                onChanged: (value) {},
                textEditingController: _courseController,
              ),
              const SizedBox(height: 20),
              CustomTextFieldWidget(
                labelText: 'Score',
                hintText: 'Score',
                onChanged: (value) {},
                textEditingController: _scoreController,
              ),
              const SizedBox(height: 50),
              BlocBuilder<AddStudentBloc, AddStudentState>(
                builder: (context, state) {
                  return SizedBox(
                    width: mediaQueries.getWidthMediaQuery(context, 0.9),
                    height: mediaQueries.getHeightMediaQuery(context, 0.15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: colors.kBlackColor,
                        foregroundColor: colors.kWhiteColor,
                      ),
                      onPressed: () {
                        BlocProvider.of<AddStudentBloc>(context).add(
                          IsStudentAddedButtonClicked(
                            _firstNameController.text,
                            _lastNameController.text,
                            _courseController.text,
                            int.parse(_scoreController.text),
                          ),
                        );
                      },
                      child: (state is AddStudentLoading)
                          ? const Center(child: CupertinoActivityIndicator())
                          : const Text('Submit Student'),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
