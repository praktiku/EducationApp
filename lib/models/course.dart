class Course {
  String name;
  double completedPercentage;
  String author;
  String thumbnail;
  String tag;
  String description;
  int courseId;

  Course(
      {required this.author,
      required this.completedPercentage,
      required this.name,
      required this.thumbnail,
      required this.tag,
      required this.courseId,
      required this.description});

  static List<Course> filteredCoursesByTag(String tag) {
    return courses.where((course) => course.tag == tag).toList();
  }

  static Course findCourseByIdAndTag(int id, String tag) {
    return courses
        .firstWhere((course) => course.courseId == id && course.tag == tag);
  }

  static List<Course> filteredCoursesByCourseId(List<int> ids) {
    List<Course> filteredList =
        courses.where((course) => ids.contains(course.courseId)).toList();
    filteredList.sort((a, b) => b.courseId.compareTo(a.courseId));
    return filteredList;
  }
}

List<Course> courses = [
  Course(
      author: "Team",
      completedPercentage: .00,
      name: "Basic Computer Science",
      thumbnail: "assets/images/CS.jpg",
      tag: "CS",
      description:
          "This introductory course provides a broad overview of the fundamental concepts and principles of computer science.",
      courseId: 1),
  Course(
      author: "Team",
      completedPercentage: .00,
      name: "Advanced Algorithms",
      thumbnail: "assets/images/CS2.jpg",
      tag: "CS",
      description:
          "This introductory course provides a broad overview of the fundamental concepts and principles of computer science.",
      courseId: 2),
  Course(
      author: "Team",
      completedPercentage: .00,
      name: "Data Structures",
      thumbnail: "assets/images/CS3.jpg",
      tag: "CS",
      description:
          "This introductory course provides a broad overview of the fundamental concepts and principles of computer science.",
      courseId: 3),
  Course(
      author: "Team",
      completedPercentage: .00,
      name: "Operating Systems",
      thumbnail: "assets/images/CS4.jpg",
      tag: "CS",
      description:
          "This introductory course provides a broad overview of the fundamental concepts and principles of computer science.",
      courseId: 4),
  Course(
      author: "Team",
      completedPercentage: .00,
      name: "Database Management",
      thumbnail: "assets/images/CS5.jpg",
      tag: "CS",
      description:
          "This introductory course provides a broad overview of the fundamental concepts and principles of computer science.",
      courseId: 5),
  Course(
      author: "Team",
      completedPercentage: .50,
      name: "Basic Economy",
      thumbnail: "assets/images/ECO.jpg",
      tag: "ECO",
      description:
          "This introductory course introduces the basic principles of economics",
      courseId: 1),
  Course(
      author: "Team",
      completedPercentage: .00,
      name: "Macroeconomics",
      thumbnail: "assets/images/ECO2.jpg",
      tag: "ECO",
      description:
          "This course provides a comprehensive understanding of economic principles and their application.",
      courseId: 2),
  Course(
      author: "Team",
      completedPercentage: .00,
      name: "Microeconomics",
      thumbnail: "assets/images/ECO3.jpg",
      tag: "ECO",
      description:
          "This course provides a comprehensive understanding of economic principles and their application.",
      courseId: 3),
  Course(
      author: "Team",
      completedPercentage: .00,
      name: "International Economics",
      thumbnail: "assets/images/ECO4.jpg",
      tag: "ECO",
      description:
          "This course provides a comprehensive understanding of economic principles and their application.",
      courseId: 4),
  Course(
      author: "Team",
      completedPercentage: .00,
      name: "Financial Economics",
      thumbnail: "assets/images/ECO5.jpg",
      tag: "ECO",
      description:
          "This course provides a comprehensive understanding of economic principles and their application.",
      courseId: 5),
  Course(
      author: "Team",
      completedPercentage: .00,
      name: "Development Economics",
      thumbnail: "assets/images/ECO6.jpg",
      tag: "ECO",
      description:
          "This course provides a comprehensive understanding of economic principles and their application.",
      courseId: 6),
  Course(
      author: "Team",
      completedPercentage: .75,
      name: "Basic Psychology",
      thumbnail: "assets/images/PSY.jpg",
      tag: "PSY",
      description:
          "This introductory course provides a general overview of the field of psychology",
      courseId: 1),
  Course(
      author: "Team",
      completedPercentage: .00,
      name: "Introduction to Psychology",
      thumbnail: "assets/images/PSY2.jpg",
      tag: "PSY",
      description:
          "This course provides a comprehensive understanding of psychological principles and their application.",
      courseId: 2),
  Course(
      author: "Team",
      completedPercentage: .00,
      name: "Cognitive Psychology",
      thumbnail: "assets/images/PSY3.jpg",
      tag: "PSY",
      description:
          "This course provides a comprehensive understanding of psychological principles and their application.",
      courseId: 3),
  Course(
      author: "Team",
      completedPercentage: .00,
      name: "Developmental Psychology",
      thumbnail: "assets/images/PSY4.jpg",
      tag: "PSY",
      description:
          "This course provides a comprehensive understanding of psychological principles and their application.",
      courseId: 4),
  Course(
      author: "Team",
      completedPercentage: .00,
      name: "Social Psychology",
      thumbnail: "assets/images/PSY5.jpg",
      tag: "PSY",
      description:
          "This course provides a comprehensive understanding of psychological principles and their application.",
      courseId: 5),
  Course(
      author: "Team",
      completedPercentage: .00,
      name: "Clinical Psychology",
      thumbnail: "assets/images/PSY6.jpg",
      tag: "PSY",
      description:
          "This course provides a comprehensive understanding of psychological principles and their application.",
      courseId: 6),
  Course(
      author: "Team",
      completedPercentage: 1.00,
      name: "Basic Engineering",
      thumbnail: "assets/images/ENG.jpg",
      tag: "ENG",
      description:
          "This introductory course provides a broad overview of the various engineering disciplines",
      courseId: 1),
  Course(
      author: "Team",
      completedPercentage: .00,
      name: "Introduction to Civil Engineering",
      thumbnail: "assets/images/ENG2.jpg",
      tag: "ENG",
      description:
          "This course provides a comprehensive understanding of engineering principles and their application.",
      courseId: 2),
  Course(
      author: "Team",
      completedPercentage: .00,
      name: "Electrical Engineering Basics",
      thumbnail: "assets/images/ENG3.jpg",
      tag: "ENG",
      description:
          "This course provides a comprehensive understanding of engineering principles and their application.",
      courseId: 3),
  Course(
      author: "Team",
      completedPercentage: .00,
      name: "Mechanical Engineering Principles",
      thumbnail: "assets/images/ENG4.jpg",
      tag: "ENG",
      description:
          "This course provides a comprehensive understanding of engineering principles and their application.",
      courseId: 4),
  Course(
      author: "Team",
      completedPercentage: .00,
      name: "Chemical Engineering Fundamentals",
      thumbnail: "assets/images/ENG5.jpg",
      tag: "ENG",
      description:
          "This course provides a comprehensive understanding of engineering principles and their application.",
      courseId: 5),
  Course(
      author: "Team",
      completedPercentage: .00,
      name: "Software Engineering Concepts",
      thumbnail: "assets/images/ENG6.jpg",
      tag: "ENG",
      description:
          "This course provides a comprehensive understanding of engineering principles and their application.",
      courseId: 6),
];
