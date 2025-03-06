class NewsModel {
  const NewsModel({
    required this.description,
    required this.id,
    required this.title,
    this.author,
    this.dateCreated,
  });

  final int id;
  final String title;
  final String? author;
  final String description;
  final DateTime? dateCreated;

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'] as int,
      title: json['title'] as String,
      author: json['author'] as String?,
      description: json['body'] as String,
      dateCreated: json['date_created'] as DateTime?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'description': description,
    };
  }
}
