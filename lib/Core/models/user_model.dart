class UserModel {
  late String email;
  late String uID;
  late String? image;

  UserModel({required this.email, required this.uID, required this.image});
  UserModel.fromJson(Map<String,dynamic> json)
  {
    email=json["Email"];
    uID=json["UID"];
    image=json["image"];
  }
  Map<String, dynamic> toMap() {
    return {
      "Email": email,
      "UID": uID,
      "image":image
    };
  }
}
