import 'package:flutter/material.dart';
import 'package:practice/models/student_model.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({Key? key}) : super(key: key);

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {

  TextEditingController nameCon = TextEditingController();
  TextEditingController idCon = TextEditingController();
  TextEditingController ageCon = TextEditingController();
  var genderVal = '';
  var yearVal = '';
  var courseVal = '';
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Adding Student Profile',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Form(
          key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              children: [
                TextFormField(
                  controller: nameCon,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    hintText: 'Ex. : Mark Louie N. Bontia',
                    labelText: 'Enter your name'
                  ),
                  validator: (value){
                    return value == null
                        || value.isEmpty ? 'Name is required' : null;
                  },
                ),
                TextFormField(
                  controller: idCon,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Ex. : 2020300845',
                    labelText: 'Enter your id number'
                  ),
                  validator: (value){
                    return value == null
                        || value.isEmpty ? 'Id number is required' : null;
                  },
                ),
                TextFormField(
                  controller: ageCon,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Ex. : 20',
                    labelText: 'Enter your age'
                  ),
                  validator: (value){
                    return value == null
                        || value.isEmpty ? 'Age is required' : null;
                  },
                ),
                DropdownButtonFormField(
                  hint: Text('Gender'),
                    items: const [
                     DropdownMenuItem(
                       value: 'Male',
                         child: Text('Male')
                     ),
                      DropdownMenuItem(
                          value: 'Female',
                          child: Text('Female')
                      ),
                      DropdownMenuItem(
                          value: 'Other',
                          child: Text('Other')
                      ),
                    ],
                    onChanged: (value){
                      genderVal = value.toString();
                    },
                  validator: (value) => value == null ? 'Gender required' : null,
                ),
                DropdownButtonFormField(
                  hint: Text('Year Level'),
                    items: const [
                      DropdownMenuItem(
                        value: '1st Year',
                          child: Text('1st Year')
                      ),
                      DropdownMenuItem(
                          value: '2nd Year',
                          child: Text('2nd Year')
                      ),
                      DropdownMenuItem(
                          value: '3rd Year',
                          child: Text('3rd Year')
                      ),
                      DropdownMenuItem(
                          value: '4th Year',
                          child: Text('4th Year')
                      ),
                      DropdownMenuItem(
                          value: '5th Year',
                          child: Text('5th Year')
                      ),
                    ],
                    onChanged: (value){
                      yearVal = value.toString();
                    },
                  validator: (value) => value == null ? 'Year required' : null,
                ),
                DropdownButtonFormField(
                  hint: Text('Course'),
                    items: const [
                      DropdownMenuItem(
                        value: 'BSCE',
                          child: Text('BSCE')
                      ),
                      DropdownMenuItem(
                          value: 'BSIT',
                          child: Text('BSIT')
                      ),
                      DropdownMenuItem(
                          value: 'BSEE',
                          child: Text('BSEE')
                      ),
                      DropdownMenuItem(
                          value: 'BSGE',
                          child: Text('BSGE')
                      ),
                    ],
                    onChanged: (value){
                      courseVal = value.toString();
                    },
                  validator: (value) => value == null ? 'Course required' : null,
                ),
                ElevatedButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        var studentDetails = StudentModel(
                            name: nameCon.text,
                            id: int.parse(idCon.text),
                            age: int.parse(ageCon.text),
                            gender: genderVal,
                            year: yearVal,
                            course: courseVal
                        );
                        Navigator.pop(context, studentDetails);
                      }
                    },
                    child: const Text('Submit Student Profile',
                      style: TextStyle(fontSize: 25),
                    )
                )
              ],
            )
        ),
      ),
    );
  }
}
