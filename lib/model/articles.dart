
class Article {
  Article({
    required this.author,
    required this.title,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  String author;
  String title;
  String urlToImage;
  String publishedAt;
  String content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    author: json["author"] ?? "Author",
    title: json["title"] ?? "Tittle",
    urlToImage: json["urlToImage"] ?? "https://wiki.tripwireinteractive.com/images/4/47/Placeholder.png",
    publishedAt: json["publishedAt"]?? "DateTime",
    content: json["content"] ?? "Content",
  );
}


