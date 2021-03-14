class PostList {
  String kind;
  List<Post> posts;

  PostList({
    this.kind,
    this.posts,
  });

  PostList.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    if (json['items'] != null) {
      posts = <Post>[];
      json['items'].forEach((v) {
        posts.add(new Post.fromJson(v));
      });
    }
  }
}

class Post {
  String kind;
  String id;
  Blog blog;
  String published;
  String updated;
  String url;
  String selfLink;
  String title;
  String content;
  Author author;
  Replies replies;
  String etag;
  // List<String> labels;

  Post({
    this.kind,
    this.id,
    this.blog,
    this.published,
    this.updated,
    this.url,
    this.selfLink,
    this.title,
    this.content,
    this.author,
    this.replies,
    this.etag,
    // this.labels,
  });

  Post.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    id = json['id'];
    blog = json['blog'] != null ? new Blog.fromJson(json['blog']) : null;
    published = json['published'];
    updated = json['updated'];
    url = json['url'];
    selfLink = json['selfLink'];
    title = json['title'];
    content = json['content'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    replies =
        json['replies'] != null ? new Replies.fromJson(json['replies']) : null;
    etag = json['etag'];
    // labels = json['labels'].cast<String>();
  }
}

class Blog {
  String id;

  Blog({this.id});

  Blog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }
}

class Author {
  String id;
  String displayName;
  String url;
  Image image;

  Author({this.id, this.displayName, this.url, this.image});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['displayName'];
    url = json['url'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }
}

class Image {
  String url;

  Image({this.url});

  Image.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }
}

class Replies {
  String totalItems;
  String selfLink;

  Replies({this.totalItems, this.selfLink});

  Replies.fromJson(Map<String, dynamic> json) {
    totalItems = json['totalItems'];
    selfLink = json['selfLink'];
  }
}
