import 'package:flutter/material.dart';
import 'package:student_card/Module/StudentData.dart';
import 'package:photo_manager/photo_manager.dart';
import 'dart:io';

typedef void StudentDataClosure(StudentData studentData);

class StudentCardEdit extends StatefulWidget {
  final StudentData? studentData;
  final StudentDataClosure? studentDataClosure;

  const StudentCardEdit({Key? key, this.studentData, this.studentDataClosure}) : super(key: key);

  @override
  State<StudentCardEdit> createState() => _StudentCardEditState();
}

class _StudentCardEditState extends State<StudentCardEdit> {

  String? profileImageUrl;

  TextEditingController nameTFC = TextEditingController();
  TextEditingController levelTFC = TextEditingController();
  TextEditingController emailTFC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: const Text("Update your details"),
          backgroundColor: Colors.grey[850],
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage(widget.studentData?.imageUrl ?? ""),
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
                TextField(
                  controller: nameTFC..text = (widget.studentData?.name ?? ""),
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  // onEditingComplete: (() => focusNode.requestFocus()),
                  style: const TextStyle(color: Colors.grey, letterSpacing: 2),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    focusColor: Colors.red,
                  ),
                ),

                const Text(
                  "CURRENT STUDENT LEVEL",
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2,
                  ),
                ),

                TextField(
                  textInputAction: TextInputAction.next,
                  controller: levelTFC..text = (widget.studentData?.level ?? "").toString(),
                  style: const TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2
                  ),

                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    focusColor: Colors.red,
                  ),
                ),

                const SizedBox(
                  height: 0,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "EMAIL",
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),

                TextField(
                  controller: emailTFC..text = (widget.studentData?.email ?? ""),
                  style: const TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2
                  ),

                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    focusColor: Colors.red,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      widget.studentDataClosure!(getStudentData());
                      Navigator.pop(context);
                    },
                    child: const Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  StudentData getStudentData(){
    StudentData studentData = StudentData(
        name: nameTFC.text,
        level: levelTFC.text,
        email: emailTFC.text,
        imageUrl: profileImageUrl ?? widget.studentData?.imageUrl);
    return studentData;
  }
}
