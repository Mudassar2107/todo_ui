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
    // 1. Decode the raw JSON string into a Dart Map
    
  }
}