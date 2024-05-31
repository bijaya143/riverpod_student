import 'package:riverpod_student/model/student_model.dart';

class StudentState {
  final List<Student> lstStudents;
  final bool isLoading;

  // Constructor
  StudentState({required this.lstStudents, required this.isLoading});

  // Factory Constructor
  factory StudentState.initial(){
    return StudentState(lstStudents: [], isLoading: false);
  }

  // Copy with
  StudentState copyWith({
    Student? student,
    bool? isLoading
}){
    return StudentState(lstStudents: student != null ? [...lstStudents, student] : lstStudents, isLoading: isLoading ?? this.isLoading);
  }
}