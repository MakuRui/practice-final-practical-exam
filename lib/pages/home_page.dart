import 'package:flutter/material.dart';
import 'package:practice/models/student_model.dart';
import 'package:practice/tabs/attendance_tab.dart';
import 'package:practice/tabs/student_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  List <StudentModel> studentModel = [

  ];

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Student Records',
          style: TextStyle(fontSize: 25),
        ),
        bottom: TabBar(
            controller: tabController,
            tabs: const [
              Tab(
                icon: Icon(Icons.account_circle),
                text: 'Student List',

              ),
              Tab(
                icon: Icon(Icons.check_circle_outline),
                text: 'Attendance List',
              ),
            ]),
      ),
      body: TabBarView(
          controller: tabController,
          children: [
            StudentTab(studentModel: studentModel,),
            const AttendanceTab(),
          ]),
    );
  }
}
