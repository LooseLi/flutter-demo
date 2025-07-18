class Author {
  late String userId;
  late String name;
  late String avatar;
  late bool isFollowed;

  Author.fromMap(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    avatar = json['avatar'];
    isFollowed = json['is_followed'];
  }
}

class Content {
  late String title;

  Content.fromMap(Map<String, dynamic> json) {
    title = json['title'];
  }
}

int counter = 0;

class ArticleItem {
  late int rank;
  late Content content;
  late Author author;

  ArticleItem.fromMap(Map<String, dynamic> json) {
    rank = counter++;
    content = Content.fromMap(json['content']);
    author = Author.fromMap(json['author']);
  }
}
