studentGrade(String studentName, int testScore) {
  if (testScore < 0 || testScore > 100) {
    return "Invalid Grade";
  } else if (testScore >= 90) {
    return "A";
  } else if (testScore >= 80) {
    return "B";
  } else if (testScore >= 70) {
    return "C";
  } else if (testScore >= 60) {
    return "D";
  } else {
    return "F";
  }
}

void main() {

  String studentName = "Mir Faris";
  int testScore = 78;
  String grade = studentGrade(studentName, testScore);
  print("$studentName's grade: $grade");


}

