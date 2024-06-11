import 'package:education_app/models/course.dart';
import 'package:education_app/screens/details_screen.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Course> categories = [];
  List<Course> filteredCategories = [];
  String searchQuery = "";
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    categories = getUniqueCategories();
    filteredCategories = categories;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    super.dispose();

    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text;
    if (query != searchQuery) {
      updateSearchQuery(query);
    }
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
      filteredCategories = categories
          .where((category) =>
              category.name.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    });
  }

  List<Course> getUniqueCategories() {
    return courses.toSet().toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Category',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Browse all classes with certain category',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(Icons.search),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          hintText: 'Search category',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 16),
              Expanded(
                  child: ListView.builder(
                      itemCount: filteredCategories.length,
                      itemBuilder: (_, index) {
                        return CategoryListCard(
                            course: filteredCategories[index]);
                      })),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryListCard extends StatelessWidget {
  final Course course;
  const CategoryListCard({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailsScreen(tag: course.tag, courseId: course.courseId)));
      },
      child: Column(
        children: [
          ListTile(
            leading: Image.asset(
              course.thumbnail,
              width: 38,
              height: 38,
            ),
            title: Text(
              course.name,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
