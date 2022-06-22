
class Post{
  int PostId;
  String Image;
  String Content;
  String Nationality;
  String FirstName;
  String LastName;
  int NumberOfComments=0;
  int NumberOfLikes=0;
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



class Comment{
  String Content;
  String Email;
  int PostID;
  int CommentID;
  String FirstName;
  String LastName;
  String UserImage;

  Comment(String content, String email, int postid){
    Content=content;
    Email=email;
    PostID=postid;
  }
  Comment.fromJson(Map<String, dynamic> json) {
    CommentID = json['CommentID'];
    Content = json['Content'];
    FirstName = json['FirstName'];
    LastName = json['LastName'];
    PostID = json['PostID'];
    UserImage=json['UserImage'];
  }
  Map<String, dynamic> toJson() =>
      {
        "Content": Content,
        "Email":Email,
        "PostID":PostID,
      };
}