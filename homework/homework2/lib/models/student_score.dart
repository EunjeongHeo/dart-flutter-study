import 'score.dart';

class StudentScore extends Score {
  final String name;

  StudentScore(this.name, int score) : super(score);

  @override
  void showInfo() {
    print('이름: $name, 점수: $score');
  }
}
