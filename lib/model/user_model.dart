class UserModel {
  String username;
  String profileImagePath;
  String subscribe;

  UserModel({
    required this.username,
    required this.profileImagePath,
    required this.subscribe,
  });
  static UserModel currentUser = UserModel(
      username: "Stokes Twins",
      profileImagePath:
          "https://yt3.ggpht.com/ytc/AIdro_mjnYuMLpBn0IcFjCmNevP-O3eXRauVYSCo-sAxSg9JvjQ=s88-c-k-c0x00ffffff-no-rj",
      subscribe: "100k");
}
