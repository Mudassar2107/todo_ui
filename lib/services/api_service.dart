import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/todo.dart';

class ApiService
{
  // NOTE: If you are using an Android Emulator, change 127.0.0.1 to 10.0.2.2
  // 127.0.0.1 works perfectly for iOS Simulators and macOS desktop apps.
  static const String baseUrl = 'http://10.0.2.2:8000/todos';
  // ---------------------------------------------------------
  // GET: Fetch all tasks from Postgres
  // ---------------------------------------------------------
  Future<List<Todo>> fetchTodos() async
  {
    final response = await http.get(Uri.parse(baseUrl));
    if(response.statusCode == 200)
    {
      // 1. Decode the raw JSON string into a Dart Map
      final Map<String, dynamic> data = jsonDecode(response.body);
      // 2. Extract the list from the "Tasks" key (Matching your Python backend!)
      final List<dynamic> tasksJson = data['Tasks'];
      // 3. Loop through the list and convert each JSON block into a Todo object
      return tasksJson.map((json) => Todo.fromJson(json)).toList();
    }
    else
    {
      throw Exception('Failed to load tasks from backend.');
    }
  }
  // ---------------------------------------------------------
  // POST: Send a new task to Postgres
  // ---------------------------------------------------------
  Future<Todo> createTodo(Todo newTodo)async
  {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(newTodo.toJson()), // Pack the Dart object into JSON
    );
    if(response.statusCode == 200)
    {
      final Map<String, dynamic> data = jsonDecode(response.body);
      // Grab the single task returned inside the "Task" key from Python
      return Todo.fromJson(data['Task']);
    }
    else
    {
      throw Exception('Failed to create task.');
    }
  }
}