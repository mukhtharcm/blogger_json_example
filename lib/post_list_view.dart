import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/post_list_model.dart';

class PostListPage extends StatelessWidget {
  //Enter Your API key
  final String apiKey = 'Enter Your API key here';
  //Enter your Blog Id here
  final String blogId = 'Enter your Blog Id here';

  //Function for Fetching Posts
  Future<PostList> fetchPosts() async {
    var postListUrl = Uri.https(
        "blogger.googleapis.com", "/v3/blogs/$blogId/posts/", {"key": apiKey});
    final response = await http.get(postListUrl);
    if (response.statusCode == 200) {
      return PostList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post List"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          // : null,
          future: fetchPosts(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.posts.length ?? 1,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        snapshot.data.posts[index].title ?? "no items",
                      ),
                      subtitle: Text(
                          snapshot.data.posts[index].author.displayName ??
                              "No Auther"),
                    ),
                  );
                },
              );
          }),
    );
  }
}
