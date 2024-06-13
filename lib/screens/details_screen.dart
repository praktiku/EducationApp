import 'package:ulearn/constants/color.dart';
import 'package:ulearn/constants/icons.dart';
import 'package:ulearn/models/course.dart';
import 'package:ulearn/models/lesson.dart';
import 'package:ulearn/models/user.dart';
import 'package:ulearn/utils/helper.dart';
import 'package:ulearn/widgets/custom_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/lesson_card.dart';

class DetailsScreen extends StatefulWidget {
  final String tag;
  final int courseId;
  final Function? refresh;

  const DetailsScreen(
      {Key? key, required this.tag, required this.courseId, this.refresh})
      : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late List<Lesson> lessons;
  late Course course;
  late Lesson? currentSelectedLesson;
  late int lessonCount;

  int _selectedIndexLesson = 0;
  int _selectedTag = 0;

  @override
  void initState() {
    super.initState();

    course = Course.findCourseByIdAndTag(widget.courseId, widget.tag);
    lessons = Lesson.filteredLessonByTag(widget.tag);
    lessonCount = lessons.length;
    updateCourseUser('RECENT');
    updateCurrentSelectedLesson();
  }

  void changeTab(int index) {
    setState(() {
      _selectedTag = index;
    });
  }

  void updateCurrentSelectedLesson() {
    setState(() {
      if (lessonCount > 0) {
        final playingLessonIndex =
            lessons.indexWhere((lesson) => lesson.isPlaying);
        if (playingLessonIndex != -1) {
          currentSelectedLesson = lessons[playingLessonIndex];
          _selectedIndexLesson = playingLessonIndex;
        } else {
          currentSelectedLesson = lessons[_selectedIndexLesson];
        }
      } else {
        currentSelectedLesson = null;
      }
    });
  }

  void updateSelectedLessonState(int index, bool isPlaying) {
    lessons[index].isPlaying = isPlaying;
    lessons[index].isCompleted = true;

    getCurrentCompletedLesson(widget.tag, widget.courseId);
  }

  void selectedLesson(int? index) {
    setState(() {
      updateSelectedLessonState(
          _selectedIndexLesson, false); // Update previous lesson
      _selectedIndexLesson = index ?? _selectedIndexLesson;
      updateSelectedLessonState(
          _selectedIndexLesson, true); // Update new lesson
      updateCurrentSelectedLesson();
    });
  }

  void updateCourseUser(String type) {
    User.updateUserCourseByType(type, course.courseId);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Stack(
                    children: [
                      Align(
                        child: Text(
                          course.name,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      CustomIconButton(
                        height: 35,
                        width: 35,
                        onTap: () => {
                          if (widget.refresh != null) {widget.refresh!()},
                          Navigator.pop(context),
                        },
                        child: const Icon(Icons.arrow_back),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomVideoPlayer(
                  videoSource: currentSelectedLesson!.videoSource,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  currentSelectedLesson?.name ?? 'No lesson available',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  course.author,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Image.asset(
                      icFeaturedOutlined,
                      height: 20,
                    ),
                    const Text(
                      " 4.8",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Icon(
                      Icons.timer,
                      color: Colors.grey,
                    ),
                    const Text(
                      " 72 Hours",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      " Free",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTabView(
                    index: _selectedTag,
                    changeTab: changeTab,
                    lessonCount: lessonCount),
                _selectedTag == 0
                    ? PlayList(
                        lessons: lessons,
                        notifyParent: selectedLesson,
                      )
                    : Description(description: course.description),
              ],
            ),
          ),
        ),
        bottomSheet: BottomSheet(
          onClosing: () {},
          backgroundColor: Colors.white,
          enableDrag: false,
          builder: (context) {
            return SizedBox(
              height: 80,
              child: EnrollBottomSheet(notifyParent: updateCourseUser),
            );
          },
        ),
      ),
    );
  }
}

class PlayList extends StatefulWidget {
  final List<Lesson> lessons;
  final Function(int index) notifyParent;

  const PlayList(
      {Key? key, required this.lessons, required this.notifyParent(int index)})
      : super(key: key);

  @override
  State<PlayList> createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (_, __) {
          return const SizedBox(
            height: 20,
          );
        },
        padding: const EdgeInsets.only(top: 20, bottom: 80),
        shrinkWrap: true,
        itemCount: widget.lessons.length,
        itemBuilder: (_, index) {
          return GestureDetector(
              onTap: () => widget.notifyParent(index),
              child: LessonCard(lesson: widget.lessons[index]));
        },
      ),
    );
  }
}

class Description extends StatelessWidget {
  final String description;
  const Description({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(description),
    );
  }
}

class CustomTabView extends StatefulWidget {
  final int index;
  final Function(int) changeTab;
  final int lessonCount;

  const CustomTabView({
    Key? key,
    required this.index,
    required this.changeTab,
    required this.lessonCount,
  }) : super(key: key);

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  late List<String> _tags;

  @override
  void initState() {
    super.initState();
    _tags = ["Playlist (${widget.lessonCount})", "Description"];
  }

  @override
  void didUpdateWidget(CustomTabView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.lessonCount != widget.lessonCount) {
      setState(() {
        _tags = ["Playlist (${widget.lessonCount})", "Description"];
      });
    }
  }

  Widget _buildTags(int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          widget.changeTab(index);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: widget.index == index ? kPrimaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              _tags[index],
              style: TextStyle(
                color: widget.index != index ? Colors.black : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: Row(
        children: _tags
            .asMap()
            .entries
            .map((MapEntry map) => _buildTags(map.key))
            .toList(),
      ),
    );
  }
}

class EnrollBottomSheet extends StatefulWidget {
  final Function(String type) notifyParent;
  static const String message = "Congratulation, You have enrolled this course";

  const EnrollBottomSheet({Key? key, required this.notifyParent})
      : super(key: key);

  @override
  State<EnrollBottomSheet> createState() => _EnrollBottomSheetState();

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}

class _EnrollBottomSheetState extends State<EnrollBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Row(
        children: [
          CustomIconButton(
            onTap: () {},
            height: 45,
            width: 45,
            child: const Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: CustomIconButton(
              onTap: () => {
                widget.notifyParent('ENROLLED'),
                widget.showSnackbar(context, EnrollBottomSheet.message)
              },
              color: kPrimaryColor,
              height: 45,
              width: 45,
              child: const Text(
                "Enroll Now",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final Color? color;
  final VoidCallback onTap;

  const CustomIconButton({
    Key? key,
    required this.child,
    required this.height,
    required this.width,
    this.color = Colors.white,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 2.0,
            spreadRadius: .05,
          ), //BoxShadow
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Center(child: child),
      ),
    );
  }
}
