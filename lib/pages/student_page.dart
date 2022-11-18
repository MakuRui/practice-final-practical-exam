import 'package:flutter/material.dart';
import 'package:practice/custom_widgets/custom_text.dart';

class StudentPage extends StatelessWidget {
  final studentModel;
  const StudentPage({Key? key, required this.studentModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${studentModel.name.toString()} Profile',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: ListView(
        children: [
          CustomText(
              textTitle: 'Name',
              textDetails: ': ${studentModel.name.toString()}'
          ),
          CustomText(
              textTitle: 'Id',
              textDetails: ': ${studentModel.id.toString()}'
          ),
          CustomText(
              textTitle: 'Age',
              textDetails: ': ${studentModel.age.toString()}'
          ),
          CustomText(
              textTitle: 'Gender',
              textDetails: ': ${studentModel.gender.toString()}'
          ),
          CustomText(
              textTitle: 'Year level',
              textDetails: ': ${studentModel.year.toString()}'
          ),
          CustomText(
              textTitle: 'Course',
              textDetails: ': ${studentModel.course.toString()}'
          ),
        ],
      ),
    );
  }
}
