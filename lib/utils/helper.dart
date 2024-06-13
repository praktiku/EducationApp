import 'package:ulearn/models/course.dart';
import 'package:ulearn/models/lesson.dart';

void getCurrentCompletedLesson(String tag, int courseId) {
  int courseIndex = courses
      .indexWhere((course) => course.tag == tag && course.courseId == courseId);

  List<Lesson> lessons = Lesson.filteredLessonByTag(tag);

  int totalLesson = lessons.length;
  int completedLesson = lessons.where((lesson) => lesson.isCompleted).length;

  double percentageCompletedLesson =
      totalLesson > 0 ? (completedLesson / totalLesson) * 1.00 : .0;

  courses[courseIndex].completedPercentage = percentageCompletedLesson;
}
