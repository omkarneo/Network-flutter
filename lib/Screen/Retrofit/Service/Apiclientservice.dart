import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'Apiclientservice.g.dart';

@RestApi(baseUrl: "https://official-joke-api.appspot.com")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;
  @GET("/random_ten")
  Future<List<Jokes>> getTasks();
}

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class JsplaceClient {
  factory JsplaceClient(Dio dio) = _JsplaceClient;
  @GET("/posts")
  Future<List<Post>> getPosts();
  @POST("/posts")
  Future setPosts(@Body() Post data);
  @DELETE("/posts/{id}")
  Future deletePost(@Path("id") String id);
  @PUT("/posts/{id}")
  Future putPost(@Path("id") String id, @Body() Post data);
}

@RestApi(baseUrl: "https://reqres.in/api")
abstract class PhotoClient {
  factory PhotoClient(Dio dio) = _PhotoClient;
  @GET("/users/{id}")
  Future getPhoto(@Path("id") String id);
}

class Photo {
  int? id;
  String? email;
  String? first_name;
  String? last_name;
  String? avatar;

  Photo({this.id, this.email, this.first_name, this.last_name, this.avatar});
  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
      id: json['id'],
      email: json['email'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      avatar: json['avatar']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": first_name,
        "last_name": last_name,
        "avatar": avatar
      };
}

class Post {
  int? id;
  String? title;
  String? body;
  Post({this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) =>
      Post(id: json['id'], title: json['title'], body: json['body']);
  Map<String, dynamic> toJson() => {'id': id, "title": title, "body": body};
}

class Jokes {
  String? type;
  String? setup;
  int? id;
  String? punchline;

  Jokes({
    this.type,
    this.setup,
    this.id,
    this.punchline,
  });

  factory Jokes.fromJson(Map<String, dynamic> json) => Jokes(
      id: json['id'],
      type: json['type'],
      setup: json['setup'],
      punchline: json['punchline']);
  Map<String, dynamic> toJson() =>
      {'id': id, "type": type, "setup": setup, "punchline": punchline};
}
