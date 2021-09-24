class Task {
  String title;
  String desc;
  bool isDone;

  Task({required this.title, required this.desc, this.isDone = false});
}

List<Task> listOfTask = [
  Task(title: "titile 1", desc: "ini deskripsi baru"),
  Task(title: "titile 2", desc: "ini adalah deskripsi"),
  Task(title: "titile 3", desc: "ini adalah deskripsi"),
  Task(title: "titile 4", desc: "ini adalah deskripsi"),
  Task(title: "titile 5", desc: "ini adalah deskripsi"),
  Task(title: "titile 6", desc: "ini adalah deskripsi"),
];

List<Task> listFinished = [];
