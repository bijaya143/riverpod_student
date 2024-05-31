import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_student/model/student_model.dart';
import 'package:riverpod_student/view_model/student_view_model.dart';

class StudentView extends ConsumerStatefulWidget {
  const StudentView({super.key});

  @override
  ConsumerState<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends ConsumerState<StudentView> {
  final _gap = const SizedBox(height: 20);

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final studentState = ref.watch(studentViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child:  Column(
          children: [
            TextFormField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First Name',
                  hintText: 'Please enter first name.'
              ),
            ),
            _gap,
            TextFormField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                  hintText: 'Please enter last name.'
              ),
            ),
            _gap,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {
                Student student = Student(firstName: _firstNameController.text, lastName: _lastNameController.text);
                ref.read(studentViewModelProvider.notifier).addStudent(student);
              }, child: const Text('Add Student')),
            ),
            _gap,
            studentState.isLoading ? const CircularProgressIndicator() : studentState.lstStudents.isEmpty ? const Text('No Data') :
                Expanded(child: ListView.builder(itemBuilder: (context, index) {
                  final student  = studentState.lstStudents[index];
                  return ListTile(
                    title: Text(student.firstName),
                    subtitle: Text(student.lastName),
                  );
                }, itemCount: studentState.lstStudents.length,))
          ],
        ),
      )
     
    );
  }
}
