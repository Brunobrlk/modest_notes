import 'package:modestnotes/src/models/categories.dart';
import 'package:modestnotes/src/models/note.dart';

class Controller {
  List<Note> allNotes = [
    Note(
        id: 0,
        title: 'My Dreams',
        content:
            'Today is friday and i had a special dream with my favorit friends'),
    Note(
        id: 1,
        title: 'Need to do',
        content: 'I need to do my homework, i need to finish this notess',
        isFixed: true),
    Note(
        id: 2,
        title: 'Toughts',
        content:
            'Any other thing, its not important for now, so, try to ignore this messages okay? all right, so lets get started to programming'),
            Note(
                id: 3,
        title: 'My Dreams',
        content:
            'Today is friday and i had a special dream with my favorit friends'),
    Note(
        id: 4,
        title: 'Need to do',
        content: 'I need to do my homework, i need to finish this notess',
        isFixed: true),
    Note(
        id: 5,
        title: 'Toughts',
        content:
            'Any other thing, its not important for now, so, try to ignore this messages okay? all right, so lets get started to programming'),
            Note(
                id: 6,
        title: 'My Dreams',
        content:
            'Today is friday and i had a special dream with my favorit friends'),
    Note(
        id: 7,
        title: 'Need to do',
        content: 'I need to do my homework, i need to finish this notess',
        isFixed: true),
    Note(
        id: 8,
        title: 'Toughts',
        content:
            'Any other thing, its not important for now, so, try to ignore this messages okay? all right, so lets get started to programming'),
            Note(
                id: 9,
        title: 'My Dreams',
        content:
            'Today is friday and i had a special dream with my favorit friends'),
    Note(
        id: 10,
        title: 'Need to do',
        content: 'I need to do my homework, i need to finish this notess',
        isFixed: true),
    Note(
        id: 11,
        title: 'Toughts',
        content:
            'Any other thing, its not important for now, so, try to ignore this messages okay? all right, so lets get started to programming'),
  ];

  List<Categories> allCategories = [
    Categories(name: 'English', amount: 3, isFavorit: true),
    Categories(name: 'Spanish', amount: 120, isFavorit: true),
    Categories(name: 'Java', amount: 43, isFavorit: false),
    Categories(name: 'Frontend', amount: 25, isFavorit: false),
    Categories(name: 'Flutter', amount: 2, isFavorit: true),
  ];

  addNote(Note note){
    allNotes.add(note);
  }
  removeNote(Note note){
    allNotes.remove(note);
  }
  updateNote(String title, String content, int index){
    allNotes[index].title = title;
    allNotes[index].content = content;
  }
}
