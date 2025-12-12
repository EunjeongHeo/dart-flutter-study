import '../models/student_score.dart';

double average(List<StudentScore> students) {
  final sum = students.fold(0, (a, b) => a + b.score);
  return sum / students.length;
}

StudentScore topStudent(List<StudentScore> students) {
  students.sort((a, b) => b.score.compareTo(a.score));
  return students.first;
}
