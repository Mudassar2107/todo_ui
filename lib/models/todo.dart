class Todo
{
  final int? id;
  final String tittle;
  bool isCompleted;
  
  Todo
  ({
    this.id,
    required this.tittle,
    this.isCompleted = false,
  });
  // 1. The Receiver (Python to Flutter)
  // Takes the raw JSON dictionary from FastAPI and turns it into a Dart Object
  factory Todo.fromJson(Map<String, dynamic> json)
  {
    return Todo(
      id: json['id'],
      tittle: json['title'],
      isCompleted: json['is_completed'],
    );
  }
  // 2. The Sender (Flutter to Python)
  // Takes your Dart Object and packages it back into a JSON dictionary for FastAPI
  Map<String, dynamic> toJson()
  {
    return
    {
      'title': tittle,
      'is_completed': isCompleted,
    };
  }
}