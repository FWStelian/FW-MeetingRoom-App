class UserModel {
  UserModel.fromJson(Map<String, dynamic> parsedJson)
      : name = parsedJson['name'],
        email = parsedJson['email'],
        pictureUrl = parsedJson['picture'];

  final String name;
  final String email;
  final String pictureUrl;
}
