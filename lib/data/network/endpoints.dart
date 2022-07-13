class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://165.232.163.222/api/v1/member/";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout[kwf]
  static const int connectionTimeout = 30000;

  //auth
  static const String login = baseUrl + "login";
  static const String logout = baseUrl + "logout";

  //profile
  static const String profile = baseUrl + "profile";
  static const String updateProfile = baseUrl + "update";

  //author
  static const String authorList = baseUrl + "author/list";
  static const String authorfollow = baseUrl + "follow/store";
  static const String publicPosts = baseUrl + "posts/public";
  static const String followedAuthorList = baseUrl + "follow/list";

  //tags
  static const String tags = baseUrl + "tags";

  //posts
  static const String posts = baseUrl + "posts";
  static const String postDetail = baseUrl + "posts/detail";
  static const String postsStore = baseUrl + "posts/store";
  static const String postsDelete = baseUrl + "posts/delete";
}
