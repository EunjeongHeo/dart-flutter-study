void main(){
  print('필수 문제 1번');
	int score = 84;
	String grade = '';
	
	if(score >= 90 && score < 100){
		grade = 'A';
	} else if(score >= 80 && score < 90){
		grade = 'B';
	} else {
		grade = 'C';
	} 
	print('이 학생의 점수는 $score점 이며, 등급은 $grade등급입니다!');
}
