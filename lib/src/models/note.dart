import 'dart:convert';

class Note {
  int id;
  String title;
  String content;
  String category;
  bool isFixed;
  Note({
    this.id,
    this.title='',
    this.content='',
    this.category='all',
    this.isFixed=false,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'isFixed': isFixed,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      isFixed: map['isFixed'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));
}
