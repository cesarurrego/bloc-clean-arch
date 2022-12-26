abstract class Api {

  Future get(
    String path, {
    Map<String, dynamic> body,
  });

  Future post();

  Future put();

  Future<dynamic> delete();
}
