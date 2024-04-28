import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/firebase/firebase_function.dart';
import 'package:untitled1/firebase/task_modle.dart';

class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({super.key});
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Text(
              'Add New Task',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
                onChanged: (text) {
                  title = text;
                },
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'please enter task title';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text('Title'),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                )),
            SizedBox(
              height: 25,
            ),
            TextFormField(
                onChanged: (text) {
                  description = text;
                },
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'please enter task description';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text('task description'),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                )),
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select Time',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                showCalendar();
              },
              child: Text(
                '${selectedDate.toString().substring(0,10)}',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w100),
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    TaskModle modle = TaskModle(
                      userId:FirebaseAuth.instance.currentUser!.uid ,
                        title: title,
                        data: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch,
                        description: description);
                    FirebaseFunction.addTask(modle).then((value) {
                      Navigator.pop(context);
                      print(selectedDate);
                    });
                    addTask();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5D9CEC),
                      shape: StadiumBorder()),
                  child: Text(
                    'Add Task',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                  )),
            )
          ],
        ),
      ),
    );
  }

  void showCalendar() async {
    var chosendDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosendDate != null) {
      selectedDate = chosendDate;
      setState(() {});
    }
  }

  void addTask() {
    if (formKey.currentState?.validate() == true) {}
  }
}
