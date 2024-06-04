import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pinapp_challenge/core/error/exceptions.dart';
import 'package:pinapp_challenge/data/models/_models.dart';
import 'package:pinapp_challenge/data/services/api.dart';

class ApiImpl implements Api {
  final http.Client client;

  ApiImpl({required this.client});

  @override
  Future<List<PostModel>> getPosts() async {
    final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == HttpStatus.ok) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => PostModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }

  // @override
  // Future<List<CommentModel>?> getComments(int postId) async {
  //   final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/comments?postId=$postId'));

  //   if (response.statusCode == HttpStatus.ok) {
  //     final List<dynamic> jsonList = json.decode(response.body);
  //     return jsonList.map((json) => CommentModel.fromJson(json)).toList();
  //   } else {
  //     throw ServerException();
  //   }
  // }
}
