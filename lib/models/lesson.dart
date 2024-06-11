class Lesson {
  String name;
  String duration;
  bool isPlaying;
  bool isCompleted;
  String videoSource;
  String tag;

  Lesson(
      {required this.duration,
      required this.isCompleted,
      required this.isPlaying,
      required this.name,
      required this.tag,
      required this.videoSource});

  static List<Lesson> filteredLessonByTag(String tag) {
    return lessonList.where((lesson) => lesson.tag == tag).toList();
  }
}

List<Lesson> lessonList = [
  Lesson(
      duration: "11 min 20 sec",
      isCompleted: true,
      isPlaying: true,
      name: "1. Intro Computer Science",
      tag: "CS",
      videoSource:
          "https://s3.tebi.io/video-app-edu/1. Intro Computer Science.mp4"),
  Lesson(
      duration: "10 min",
      isCompleted: false,
      isPlaying: false,
      name: "2. Early Computing",
      tag: "CS",
      videoSource: "https://s3.tebi.io/video-app-edu/2. Early Computing.mp4"),
  Lesson(
      duration: "11 min",
      isCompleted: false,
      isPlaying: false,
      name: "3. Electronic Computing",
      tag: "CS",
      videoSource:
          "https://s3.tebi.io/video-app-edu/3. Electronic Computing.mp4"),
  Lesson(
      duration: "8 min",
      isCompleted: false,
      isPlaying: false,
      name: "4. Boolean Logic & Logic Gates",
      tag: "CS",
      videoSource:
          "https://s3.tebi.io/video-app-edu/4.%20Boolean%20Logic%20%26%20Logic%20Gates.mp4"),
  Lesson(
      duration: "9 min",
      isCompleted: false,
      isPlaying: false,
      name: "5. Early Programming",
      tag: "CS",
      videoSource: "https://s3.tebi.io/video-app-edu/5. Early Programming.mp4"),
  Lesson(
      duration: "9 min",
      isCompleted: false,
      isPlaying: false,
      name: "6. The Central Processing Unit (CPU)",
      tag: "CS",
      videoSource:
          "https://s3.tebi.io/video-app-edu/6. The Central Processing Unit (CPU).mp4"),
  Lesson(
    duration: "4 min",
    isCompleted: false,
    isPlaying: false,
    name: "Big-O notation",
    tag: "CS",
    videoSource: "https://s3.tebi.io/video-app-edu/Big-O notation.mp4",
  ),
  Lesson(
    duration: "4 min",
    isCompleted: false,
    isPlaying: false,
    name: "Data Structures",
    tag: "CS",
    videoSource: "https://s3.tebi.io/video-app-edu/Data Structures.mp4",
  ),
  Lesson(
    duration: "8 min",
    isCompleted: false,
    isPlaying: false,
    name: "Dijkstra's algorithm",
    tag: "CS",
    videoSource: "https://s3.tebi.io/video-app-edu/Dijkstra's algorithm.mp4",
  ),
  Lesson(
    duration: "6 min",
    isCompleted: false,
    isPlaying: false,
    name: "Dynamic Programming",
    tag: "CS",
    videoSource: "https://s3.tebi.io/video-app-edu/Dynamic Programming.mp4",
  ),
  Lesson(
    duration: "10 min",
    isCompleted: false,
    isPlaying: false,
    name: "Sorting Algorithms Explained Visually",
    tag: "CS",
    videoSource:
        "https://s3.tebi.io/video-app-edu/Sorting Algorithms Explained Visually.mp4",
  ),
  Lesson(
    duration: "5 min",
    isCompleted: false,
    isPlaying: false,
    name: "Database Normalization",
    tag: "CS",
    videoSource: "https://s3.tebi.io/video-app-edu/Database Normalization.mp4",
  ),
  Lesson(
    duration: "9 min",
    isCompleted: false,
    isPlaying: false,
    name: "Relational Database",
    tag: "CS",
    videoSource: "https://s3.tebi.io/video-app-edu/Relational Database.mp4",
  ),
  Lesson(
    duration: "8 min",
    isCompleted: false,
    isPlaying: false,
    name: "SQL vs NoSQL",
    tag: "CS",
    videoSource: "https://s3.tebi.io/video-app-edu/SQL vs NoSQL.mp4",
  ),
  Lesson(
    duration: "13 min",
    isCompleted: false,
    isPlaying: false,
    name: "What Is a Data Warehouse",
    tag: "CS",
    videoSource:
        "https://s3.tebi.io/video-app-edu/What Is a Data Warehouse.mp4",
  ),
  Lesson(
    duration: "15 min",
    isCompleted: false,
    isPlaying: false,
    name: "What is a Database transaction",
    tag: "CS",
    videoSource:
        "https://s3.tebi.io/video-app-edu/What is a Database transaction.mp4",
  ),
  Lesson(
      duration: "9 min",
      isCompleted: false,
      isPlaying: false,
      name: "1. Crash Course Economy",
      tag: "ECO",
      videoSource:
          "https://s3.tebi.io/video-app-edu/1. Crash Course Economy.mp4"),
  Lesson(
      duration: "14 min",
      isCompleted: false,
      isPlaying: false,
      name: "2. Intro Economy",
      tag: "ECO",
      videoSource: "https://s3.tebi.io/video-app-edu/2. Intro Economy.mp4"),
  Lesson(
      duration: "6 min",
      isCompleted: false,
      isPlaying: false,
      name: "3. Deficits & Debts",
      tag: "ECO",
      videoSource:
          "https://s3.tebi.io/video-app-edu/3.%20Deficits%20%26%20Debts.mp4"),
  Lesson(
      duration: "5 min",
      isCompleted: false,
      isPlaying: false,
      name: "4. Economic Systems and Macroeconomics",
      tag: "ECO",
      videoSource:
          "https://s3.tebi.io/video-app-edu/4. Economic Systems and Macroeconomics.mp4"),
  Lesson(
      duration: "15 min",
      isCompleted: false,
      isPlaying: false,
      name: "5. Fiscal Policy and Stimulus",
      tag: "ECO",
      videoSource:
          "https://s3.tebi.io/video-app-edu/5. Fiscal Policy and Stimulus.mp4"),
  Lesson(
    duration: "15 min",
    isCompleted: false,
    isPlaying: false,
    name: "BIC_ Two minutes to understand sustainable development",
    tag: "ECO",
    videoSource:
        "https://s3.tebi.io/video-app-edu/BIC_ Two minutes to understand sustainable development.mp4",
  ),
  Lesson(
    duration: "6 min",
    isCompleted: false,
    isPlaying: false,
    name: "Economic Policy_ An Introduction",
    tag: "ECO",
    videoSource:
        "https://s3.tebi.io/video-app-edu/Economic Policy_ An Introduction.mp4",
  ),
  Lesson(
    duration: "1 min",
    isCompleted: false,
    isPlaying: false,
    name: "Human Capital Theory",
    tag: "ECO",
    videoSource: "https://s3.tebi.io/video-app-edu/Human Capital Theory.mp4",
  ),
  Lesson(
    duration: "15 min",
    isCompleted: false,
    isPlaying: false,
    name: "Understanding economic growth",
    tag: "ECO",
    videoSource:
        "https://s3.tebi.io/video-app-edu/Understanding economic growth.mp4",
  ),
  Lesson(
    duration: "12 min",
    isCompleted: false,
    isPlaying: false,
    name: "Why is it so hard to escape poverty",
    tag: "ECO",
    videoSource:
        "https://s3.tebi.io/video-app-edu/Why is it so hard to escape poverty.mp4",
  ),
  Lesson(
    duration: "15 min",
    isCompleted: false,
    isPlaying: false,
    name: "How Decision Making is Actually Science",
    tag: "ECO",
    videoSource:
        "https://s3.tebi.io/video-app-edu/How Decision Making is Actually Science.mp4",
  ),
  Lesson(
    duration: "14 min",
    isCompleted: false,
    isPlaying: false,
    name: "Introduction to Supply and Demand",
    tag: "ECO",
    videoSource:
        "https://s3.tebi.io/video-app-edu/Introduction to Supply and Demand.mp4",
  ),
  Lesson(
    duration: "10 min",
    isCompleted: false,
    isPlaying: false,
    name: "Market Structures",
    tag: "ECO",
    videoSource: "https://s3.tebi.io/video-app-edu/Market Structures.mp4",
  ),
  Lesson(
    duration: "1 min",
    isCompleted: false,
    isPlaying: false,
    name: "Short-Run Costs  (Part 1)",
    tag: "ECO",
    videoSource:
        "https://s3.tebi.io/video-app-edu/Short-Run Costs  (Part 1).mp4",
  ),
  Lesson(
    duration: "1 min",
    isCompleted: false,
    isPlaying: false,
    name: "The importance of studying consumer behavior",
    tag: "ECO",
    videoSource:
        "https://s3.tebi.io/video-app-edu/The importance of studying consumer behavior.mp4",
  ),
  Lesson(
      duration: "4 min",
      isCompleted: false,
      isPlaying: false,
      name: "1. Crash Course Engineering",
      tag: "ENG",
      videoSource:
          "https://s3.tebi.io/video-app-edu/1. Crash Course Engineering.mp4"),
  Lesson(
      duration: "8 min",
      isCompleted: false,
      isPlaying: false,
      name: "2. What is Engineering",
      tag: "ENG",
      videoSource:
          "https://s3.tebi.io/video-app-edu/2. What is Engineering.mp4"),
  Lesson(
      duration: "10 min",
      isCompleted: false,
      isPlaying: false,
      name: "3. Civil Engineering",
      tag: "ENG",
      videoSource: "https://s3.tebi.io/video-app-edu/3. Civil Engineering.mp4"),
  Lesson(
      duration: "12 min",
      isCompleted: false,
      isPlaying: false,
      name: "4. Mechanical Engineering",
      tag: "ENG",
      videoSource:
          "https://s3.tebi.io/video-app-edu/4. Mechanical Engineering.mp4"),
  Lesson(
      duration: "15 min",
      isCompleted: false,
      isPlaying: false,
      name: "5. The History of Electrical Engineering",
      tag: "ENG",
      videoSource:
          "https://s3.tebi.io/video-app-edu/5. The History of Electrical Engineering.mp4"),
  Lesson(
    duration: "14 min",
    isCompleted: false,
    isPlaying: false,
    name: "Design of Experiments for Optimisation",
    tag: "ENG",
    videoSource:
        "https://s3.tebi.io/video-app-edu/Design of Experiments for Optimisation.mp4",
  ),
  Lesson(
    duration: "8 min",
    isCompleted: false,
    isPlaying: false,
    name: "Tell me about Biochemical Engineering",
    tag: "ENG",
    videoSource:
        "https://s3.tebi.io/video-app-edu/Tell me about Biochemical Engineering.mp4",
  ),
  Lesson(
    duration: "2 min",
    isCompleted: false,
    isPlaying: false,
    name: "Thermodynamic Processes (Animation)",
    tag: "ENG",
    videoSource:
        "https://s3.tebi.io/video-app-edu/Thermodynamic Processes (Animation).mp4",
  ),
  Lesson(
    duration: "13 min",
    isCompleted: false,
    isPlaying: false,
    name: "What is Chemical Reaction Engineering",
    tag: "ENG",
    videoSource:
        "https://s3.tebi.io/video-app-edu/What is Chemical Reaction Engineering.mp4",
  ),
  Lesson(
    duration: "13 min",
    isCompleted: false,
    isPlaying: false,
    name: "What is Transport Phenomena",
    tag: "ENG",
    videoSource:
        "https://s3.tebi.io/video-app-edu/What is Transport Phenomena.mp4",
  ),
  Lesson(
    duration: "14 min",
    isCompleted: false,
    isPlaying: false,
    name: "Construction Management",
    tag: "ENG",
    videoSource: "https://s3.tebi.io/video-app-edu/Construction Management.mp4",
  ),
  Lesson(
    duration: "5 min",
    isCompleted: false,
    isPlaying: false,
    name: "Environmental Engineering",
    tag: "ENG",
    videoSource:
        "https://s3.tebi.io/video-app-edu/Environmental Engineering.mp4",
  ),
  Lesson(
    duration: "6 min",
    isCompleted: false,
    isPlaying: false,
    name: "Geotechnical Engineer",
    tag: "ENG",
    videoSource: "https://s3.tebi.io/video-app-edu/Geotechnical Engineer.mp4",
  ),
  Lesson(
    duration: "15 min",
    isCompleted: false,
    isPlaying: false,
    name: "Structural Engineering",
    tag: "ENG",
    videoSource: "https://s3.tebi.io/video-app-edu/Structural Engineering.mp4",
  ),
  Lesson(
    duration: "15 min",
    isCompleted: false,
    isPlaying: false,
    name: "Transportation Engineer",
    tag: "ENG",
    videoSource: "https://s3.tebi.io/video-app-edu/Transportation Engineer.mp4",
  ),
  Lesson(
      duration: "2 min",
      isCompleted: false,
      isPlaying: false,
      name: "1. Crash Course Psychology",
      tag: "PSY",
      videoSource:
          "https://s3.tebi.io/video-app-edu/1. Crash Course Psychology.mp4"),
  Lesson(
      duration: "6 min",
      isCompleted: false,
      isPlaying: false,
      name: "2. Intro to Psychology",
      tag: "PSY",
      videoSource:
          "https://s3.tebi.io/video-app-edu/2. Intro to Psychology.mp4"),
  Lesson(
      duration: "8 min",
      isCompleted: false,
      isPlaying: false,
      name: "3. Meet Your Master - Getting to Know Your Brain",
      tag: "PSY",
      videoSource:
          "https://s3.tebi.io/video-app-edu/3. Meet Your Master - Getting to Know Your Brain.mp4"),
  Lesson(
      duration: "8 min",
      isCompleted: false,
      isPlaying: false,
      name: "4. Psychological Research",
      tag: "PSY",
      videoSource:
          "https://s3.tebi.io/video-app-edu/4. Psychological Research.mp4"),
  Lesson(
      duration: "8 min",
      isCompleted: false,
      isPlaying: false,
      name: "5. The Chemical Mind",
      tag: "PSY",
      videoSource: "https://s3.tebi.io/video-app-edu/5. The Chemical Mind.mp4"),
  Lesson(
    duration: "8 min",
    isCompleted: false,
    isPlaying: false,
    name: "Assessment and Testing",
    tag: "PSY",
    videoSource: "https://s3.tebi.io/video-app-edu/Assessment and Testing.mp4",
  ),
  Lesson(
    duration: "6 min",
    isCompleted: false,
    isPlaying: false,
    name: "Crash Course Psychology",
    tag: "PSY",
    videoSource: "https://s3.tebi.io/video-app-edu/Crash Course Psychology.mp4",
  ),
  Lesson(
    duration: "2 min",
    isCompleted: false,
    isPlaying: false,
    name: "Emotion, Stress, and Health",
    tag: "PSY",
    videoSource:
        "https://s3.tebi.io/video-app-edu/Emotion, Stress, and Health.mp4",
  ),
  Lesson(
    duration: "7 min",
    isCompleted: false,
    isPlaying: false,
    name: "Infectious Diseases Overview, Animation",
    tag: "PSY",
    videoSource:
        "https://s3.tebi.io/video-app-edu/Infectious Diseases Overview, Animation.mp4",
  ),
  Lesson(
    duration: "10 min",
    isCompleted: false,
    isPlaying: false,
    name: "Psychopharmacology",
    tag: "PSY",
    videoSource: "https://s3.tebi.io/video-app-edu/Psychopharmacology.mp4",
  ),
  Lesson(
    duration: "6 min",
    isCompleted: false,
    isPlaying: false,
    name: "Cognitive Development in Social Relationships",
    tag: "PSY",
    videoSource:
        "https://s3.tebi.io/video-app-edu/Cognitive Development in Social Relationships.mp4",
  ),
  Lesson(
    duration: "6 min",
    isCompleted: false,
    isPlaying: false,
    name: "The Adolescent Brain A second window of opportunity",
    tag: "PSY",
    videoSource:
        "https://s3.tebi.io/video-app-edu/The Adolescent Brain A second window of opportunity.mp4",
  ),
  Lesson(
    duration: "2 min",
    isCompleted: false,
    isPlaying: false,
    name: "The Attachment Theory",
    tag: "PSY",
    videoSource: "https://s3.tebi.io/video-app-edu/The Attachment Theory.mp4",
  ),
  Lesson(
    duration: "7 min",
    isCompleted: false,
    isPlaying: false,
    name: "The Science of Aging",
    tag: "PSY",
    videoSource: "https://s3.tebi.io/video-app-edu/The Science of Aging.mp4",
  ),
  Lesson(
    duration: "9 min",
    isCompleted: false,
    isPlaying: false,
    name: "What is Social Emotional Development",
    tag: "PSY",
    videoSource:
        "https://s3.tebi.io/video-app-edu/What is Social Emotional Development.mp4",
  ),
];
