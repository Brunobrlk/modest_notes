import 'dart:convert';

import 'package:modestnotes/src/models/note.dart';

class Categories {
  int id;
  String name;
  bool isFavorit;
  List<Note> notes=[];
  Categories({
    this.id,
    this.name='No Named',
    this.isFavorit=false,
    this.notes,
  });
  
  getAmountNotes() {
    return notes.length;
  }

  addNote(Note note){
    if(note!=null){
      if(note.category==null){
        note.category='none';
      }
      notes.add(note);
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isFavorit': isFavorit,
      'notes': notes?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Categories.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Categories(
      id: map['id'],
      name: map['name'],
      isFavorit: map['isFavorit'],
      notes: List<Note>.from(map['notes']?.map((x) => Note.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Categories.fromJson(String source) => Categories.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Categories(id: $id, name: $name, isFavorit: $isFavorit, notes: $notes)';
  }
}
