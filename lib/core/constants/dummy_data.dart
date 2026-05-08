class DummyData {
  static const List<Map<String, dynamic>> learningInProgress = [
    {
      "title": "TWK Practice Set",
      "subtitle": "Improve your national insight and exam accuracy",
      "instructor": "Damar Firdauzi, S.Pi",
      "instructorAvatar": "https://i.pravatar.cc/150?img=11",
      "rating": "4.9",
      "reviews": "1.972",
      "progress": 65,
    },
    {
      "title": "TWK Practice Set 2",
      "subtitle": "Improve your national insight and exam accuracy",
      "instructor": "Damar Firdauzi, S.Pi",
      "instructorAvatar": "https://i.pravatar.cc/150?img=11",
      "rating": "4.9",
      "reviews": "1.972",
      "progress": 25,
    }
  ];

  static const List<Map<String, dynamic>> recommendedCourses = [
    {
      "tags": ["Math", "Science"],
      "isPremium": true,
      "title": "TWK Practice Set",
      "subtitle": "Improve your national insight and exam accuracy",
      "image": "assets/images/gg.jpg", // Using dummy local image
      "students": "99+",
      "studentAvatars": [
        "https://i.pravatar.cc/150?img=12",
        "https://i.pravatar.cc/150?img=13"
      ]
    },
    {
      "tags": ["Math", "Science"],
      "isPremium": true,
      "title": "TWK Practice Set 2",
      "subtitle": "Improve your national insight and exam accuracy",
      "image": "assets/images/gg.jpg",
      "students": "99+",
      "studentAvatars": [
        "https://i.pravatar.cc/150?img=12",
        "https://i.pravatar.cc/150?img=13"
      ]
    }
  ];

  static const Map<String, dynamic> courseDetail = {
    "tags": ["Math", "Science"],
    "isPremium": true,
    "title": "Marine & Fisheries",
    "subtitle": "Learn technical roles and supervision in the marine and fisheries sector",
    "image": "assets/images/gg.jpg",
    "instructor": "Damar Firdauzi, S.Pi",
    "instructorAvatar": "https://i.pravatar.cc/150?img=11",
    "rating": "4.9",
    "reviews": "1.972",
    "topicsCount": 17,
  };

  static const List<Map<String, dynamic>> topics = [
    {
      "number": "01",
      "title": "TWK Practice Set",
      "subtitle": "Improve your national insight and exam accuracy",
      "isLocked": true,
    },
    {
      "number": "02",
      "title": "TWK Practice Set",
      "subtitle": "Improve your national insight and exam accuracy",
      "isLocked": true,
    },
    {
      "number": "03",
      "title": "TWK Practice Set",
      "subtitle": "Improve your national insight and exam accuracy",
      "isLocked": true,
    }
  ];

  static const List<Map<String, dynamic>> reviews = [
    {
      "name": "Ethan Caldwell",
      "avatar": "https://i.pravatar.cc/150?img=60",
      "rating": 5,
      "likes": 0,
      "comment": "The lessons are very clear and focused on CPNS topics. The practice sets really helped me improve my score.",
    },
    {
      "name": "Ethan Caldwell",
      "avatar": "https://i.pravatar.cc/150?img=60",
      "rating": 5,
      "likes": 0,
      "comment": "I like how the course is structured step by step. The explanations make difficult materials easier to understand.",
    },
    {
      "name": "Ethan Caldwell",
      "avatar": "https://i.pravatar.cc/150?img=60",
      "rating": 5,
      "likes": 0,
      "comment": "The coaching sessions and question discussions are super useful. It feels like a complete learning package.",
    }
  ];
}
