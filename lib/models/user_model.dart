class UserModel{
  String id;
  String image;
  String title;
  String releaseDate;
  bool isDone;

  UserModel({
    this.id="",
    required this.image,
    required this.title,
    required this.releaseDate,
    required this.isDone
  });


  UserModel.fromJson(Map<String,dynamic> json)
      : id = json["id"] ,
        title = json["title"],
        image = json["image"] ,
        releaseDate = json["releaseDate"] ,
        isDone = json["isDone"] ;

  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'title':title,
      'releaseDate':releaseDate,
      'image':image,
      'isDone':isDone
    };
  }
}