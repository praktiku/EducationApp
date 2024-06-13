import 'package:ulearn/models/course.dart';
import 'package:ulearn/models/user.dart';
import 'package:ulearn/screens/details_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static final User user = User.getUserByLoggInStatus();
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: buildUserInfo(),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: buildStatsRow(),
              ),
              const Divider(),
              buildProfileBadge('Finished Courses'),
              const Divider(),
              buildImageGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      color: Colors.blue, // Customize the color as needed
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: const Center(
        child: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildUserInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage(user.image),
        ),
        const SizedBox(height: 16),
        Text(
          user.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          user.role,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildProfileStat('Enrolled', user.enrolledCourseId.length.toString()),
        buildProfileStat(
          'Finished',
          Course.filteredCoursesByCourseId(user.enrolledCourseId)
              .where((course) => course.completedPercentage >= 1.00)
              .length
              .toString(),
        ),
        buildProfileStat(
          'Ongoing',
          Course.filteredCoursesByCourseId(user.enrolledCourseId)
              .where((course) => course.completedPercentage < 1.00)
              .length
              .toString(),
        ),
      ],
    );
  }

  Widget buildProfileStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget buildImageGrid() {
    final List<Course> completedCourses =
        Course.filteredCoursesByCourseId(user.enrolledCourseId)
            .where((course) => course.completedPercentage >= 1.00)
            .toList();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0,
      ),
      itemCount: completedCourses.length, // Number of completed courses
      itemBuilder: (context, index) {
        final course = completedCourses[index];
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                      tag: course.tag, courseId: course.courseId))),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[300]!, // Light grey color
              ),
            ),
            child: Image.asset(
              course
                  .thumbnail, // Assuming each course has an imagePath property
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Widget buildProfileBadge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.green, // Customize the color as needed
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
