class Endpoints {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  static const posts = '$baseUrl/posts';

  static String postDetail(int id) => '$posts/$id';
}
