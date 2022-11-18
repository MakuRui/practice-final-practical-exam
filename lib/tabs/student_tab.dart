// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:practice/forms/student_form.dart';
import 'package:practice/pages/student_page.dart';

class StudentTab extends StatefulWidget {
  final studentModel;
  const StudentTab({Key? key, required this.studentModel}) : super(key: key);

  @override
  State<StudentTab> createState() => _StudentTabState();
}

class _StudentTabState extends State<StudentTab> {

  var studentDetails;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: widget.studentModel.length,
            itemBuilder: (context, index){
            final studentDetails = widget.studentModel[index];
            return Card(
              elevation: 15.0,
              child: Dismissible(
                direction: DismissDirection.endToStart,
                  key: UniqueKey(),
                  child: ListTile(
                    leading: const Icon(Icons.account_circle),
                    contentPadding: const EdgeInsets.only(
                        left: 20,
                        right: 20
                    ),
                    title: Text(studentDetails.name),
                    subtitle: Text('${studentDetails.year} '
                        '${studentDetails.course}'),
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context) => StudentPage(
                              studentModel: studentDetails)));
                    },
                  ),
                onDismissed: (direction){
                  setState(() {
                    widget.studentModel.removeAt(index);
                  });
                },
              ),
            );
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            studentDetails = await Navigator.push(
                context, MaterialPageRoute(
                builder: (context) => const StudentForm()));
            setState(() {
              widget.studentModel.add(studentDetails);
            });
          },
          child: const Icon(Icons.person_add_alt_1),
      ),
    );
  }
}
