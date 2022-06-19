class Plant {
  int Id;
  String Name;
  String ImagePath;

  Plant(id, name, imagepath) {
    Id = id;
    Name = name;
    ImagePath = imagepath;
  }

  Plant.fromJson(Map<String, dynamic> json) {
    Id = json['ID'];
    Name = json['Name'];
    ImagePath = json['ImagePath'];
  }

  Map<String, dynamic> toJson() =>
      {
        "id": Id,
        "name": Name,
        "ImagePath":ImagePath
      };
}
