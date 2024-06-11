import 'package:education_app/models/course.dart';
import 'package:education_app/models/user.dart';
import 'package:education_app/screens/details_screen.dart';
import 'package:flutter/material.dart';

class BookmarkScreen extends StatelessWidget {
  static final User user = User.getUserByLoggInStatus();

  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bookmark',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Access bookmarked and recent courses easily.',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            buildSwipeableCard('Bookmarked Courses',
                Course.filteredCoursesByCourseId(user.enrolledCourseId)),
            const SizedBox(height: 16),
            buildSwipeableCard('Recent Courses',
                Course.filteredCoursesByCourseId(user.recentCourseId)),
          ],
        ),
      ),
    );
  }

  Widget buildSwipeableCard(String sectionTitle, List<Course> courses) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionTitle,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: PageView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                              tag: courses[index].tag,
                              courseId: courses[index].courseId,
                            ))),
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: [
                      Image.asset(
                        courses[index].thumbnail,
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          courses[index].name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
