import 'package:modestnotes/src/models/categories.dart';
import 'package:modestnotes/src/models/note.dart';

class Controller {
  List<Note> allNotes = [
    Note(
      id: 0,
      title: 'Get Started',
      content:
          'Para adicionar novas notas, clique no botão \'+\' no canto inferior direito, para salva-las apenas retorne a página de notas anterior',
    ),
    Note(
      id: 1,
      title: 'Get Started 2',
      content:
          'Pressione por alguns segundos e arraste alguma anotação para movê-las e organizar de acordo com suas prioridades da maneira que preferir',
    ),
    Note(
      id: 2,
      title: 'Get Started 3',
      content:
          'Agrupe em pastas suas anotações, gerencie-as, veja todas as notas, notas somente de uma pasta e é isso, prático e rápido',
    ),

  ];

  List<Categories> allCategories = [
    Categories(name: 'English', amount: 3, isFavorit: true),
    Categories(name: 'Spanish', amount: 120, isFavorit: true),
    Categories(name: 'Java', amount: 43, isFavorit: false),
    Categories(name: 'Frontend', amount: 25, isFavorit: false),
    Categories(name: 'Flutter', amount: 2, isFavorit: true),
  ];

  addNote(Note note) {
    print('entrou controller');
    if (note.id == null) {
      note.id = allNotes.length;
      print(note.id);
    }
    allNotes.add(note);
  }

  removeNote(Note note) {
    allNotes.remove(note);
    print('removeu');
  }

  updateNote(String title, String content, int index) {
    if (index >= 0) {
      print('index: $index');
      allNotes[index].title = title;
      allNotes[index].content = content;
    }
  }
}
