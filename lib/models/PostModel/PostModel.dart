
class Post{
  int PostId;
  String Image;
  String Content;
  String Nationality;
  String FirstName;
  String LastName;
  int NumberOfComments;
  int NumberOfLikes;
  String UserImage;
  String PlantName;
  String CreationDate;
  bool IsLiked;

  Post(String content,String image){
    Content=content;
    Image=image;
  }

  Post.fromJson(Map<String, dynamic> json) {
    PostId = json['PostId'];
    Image = json['Image'];
    Content = json['Content'];
    Nationality = json['Nationality'];
    FirstName = json['FirstName'];
    LastName = json['LastName'];
    NumberOfComments = json['NumberOfComments'];
    NumberOfLikes = json['NumberOfLikes'];
    UserImage = json['UserImage'];
    PlantName = json['PlantName'];
    CreationDate=json['CreationDate'];
    IsLiked=json['IsLiked'];
  }
  Map<String, dynamic> toJson() =>
      {
        "Content": Content,
        "PlantId":"1",
        "Image":Image,
      };
}