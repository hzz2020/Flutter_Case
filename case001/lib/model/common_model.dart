
class CommonModel {
  final String image;
  final String title;
  final String url;

  CommonModel(
      {this.image, this.title, this.url});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      image: json['image'],
      title: json['title'],
      url: json['url']
    );
  }
}