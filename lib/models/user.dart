import 'package:ulearn/utils/encrypt.dart';

class User {
  String email;
  String name;
  String password;
  String image;
  String role;
  bool isLogin;
  List<int> recentCourseId;
  List<int> enrolledCourseId;

  User({
    required this.email,
    required this.name,
    required this.password,
    required this.isLogin,
    required this.role,
    String? image,
    List<int>? recentCourseId,
    List<int>? enrolledCourseId,
  })  : image = image ?? "",
        recentCourseId = recentCourseId ?? [],
        enrolledCourseId = enrolledCourseId ?? [];

  static void addUser(String email, String password) {
    listUser.add(User(
        email: email,
        name: "Team A",
        role: "Student",
        password: encryptPassword(password),
        isLogin: false));
  }

  static User? findUserByEmail(String email) {
    try {
      return listUser.firstWhere((user) => user.email == email);
    } catch (e) {
      return null;
    }
  }

  static void updateUserState(String email) {
    int userIndex = listUser.indexWhere((user) => user.email == email);
    listUser[userIndex].isLogin = true;
  }

  static void updateUserCourseByType(String type, int value) {
    final loggedInUser = listUser.firstWhere((user) => user.isLogin);

    if (type == 'RECENT') {
      if (!loggedInUser.recentCourseId.contains(value)) {
        print("updateUserCourseByType - RECENT - SUCCESS");
        loggedInUser.recentCourseId.add(value);
      }
    } else {
      if (!loggedInUser.enrolledCourseId.contains(value)) {
        print("updateUserCourseByType - ENROLLED - SUCCESS");
        loggedInUser.enrolledCourseId.add(value);
      }
    }
  }

  static User getUserByLoggInStatus() {
    return listUser.firstWhere((user) => user.isLogin == true);
  }
}

List<User> listUser = [
  User(
      email: 'admin@gmail.com',
      password: encryptPassword('123'),
      name: "Team A",
      image: "assets/icons/flutter.jpg",
      role: "Student",
      isLogin: false,
      recentCourseId: [1, 2, 3],
      enrolledCourseId: [1, 2, 3, 4]),
];
