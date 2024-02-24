class Endpoints {
  static const String baseUrl = 'https://djangos-y0gf.onrender.com/';
// auth
  static const String login = 'user/login';
  // student
  static const String student = 'student';
  static const String getAllStudents = student + '/get-all-students';
  static const String addStudent = student + '/create-student';
  static const String updateStudent = student + '/update-student/2';
  static const String deleteStudent = student + '/delete-student/1';
  // user
  static const String teachers = '/teachers';
  static const String courses = '/courses';
}
