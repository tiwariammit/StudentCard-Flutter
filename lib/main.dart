import 'package:flutter/material.dart';
import 'package:student_card/StudentCardEdit.dart';
import 'package:student_card/Module/StudentData.dart';

void main() {
  runApp(const MaterialApp(
    home: StudentCard(),
  ));
}


class StudentCard extends StatefulWidget {
  const StudentCard({Key? key}) : super(key: key);

  @override
  State<StudentCard> createState() => _StudentCardState();

  static _StudentCardState of(BuildContext context) =>
      context.findAncestorStateOfType<_StudentCardState>()!;
}

class _StudentCardState extends State<StudentCard> {
  String level = "10";
  String name = "Amrit Tiwari";
  String email = "tiwariammit@gmail.com";
  String profileImageUrl = "assets/images/amrit.jpeg";

  StudentData? _studentData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: const Text("Student ID Card"),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage(profileImageUrl),
                  radius: 80,
                ),
              ),
              Divider(
                height: 30,
                color: Colors.grey[200],
              ),
              const Text(
                "NAME",
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 10,),
              Text(
                _studentData?.name ?? name,
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30,),
              const Text(
                "CURRENT STUDENT LEVEL",
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 10,),
              Text(
                _studentData?.level ?? level,
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30,),
              Row(
                children: const [
                  Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 10,),
                  Text(
                    "EMAIL",
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Text(
                _studentData?.email ?? email,
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40,),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                    onPressed: (){
                      // _studentData?.imageUrl = profileImageUrl;
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StudentCardEdit(
                        studentData: getStudentData(),
                        studentDataClosure: (val) => setState(() => _studentData = val)
                      )),
                    );
                    },
                    child: const Text("Update"),
                ),
              ),
            ],
          ),
        )
    );
  }

  StudentData getStudentData(){
    StudentData studentData = StudentData(
        name: _studentData?.name ?? name,
        level: _studentData?.level ?? level,
        imageUrl: _studentData?.imageUrl ?? profileImageUrl,
        email: _studentData?.email ?? email
    );
    return studentData;
  }
}
