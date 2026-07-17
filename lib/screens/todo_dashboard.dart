import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../services/api_service.dart';

class TodoDashboard extends StatefulWidget
{
    const TodoDashboard({super.key});
    @override
    State<TodoDashboard> createState() => _TodoDashboardState();
}
class _TodoDashboardState extends State<TodoDashboard>
{
    // 1. Initialize the network cable
    final ApiService _apiService = ApiService();
    
    // 2. State variables to hold your data and UI status
    List<Todo> _tasks = [];
    bool _isloading = true;
    // 3. This runs automatically the exact second the screen opens
    @override
    void initState()
    {
        super.initState();
        _fetchTasksFromBackend();
    }
    // 4. The function that talks to Python and updates the UI
    Future<void> _fetchTasksFromBackend() async
    {
        try
        {
            final tasks = await _apiService.fetchTodos();
            setState(() {
              _tasks = tasks;
              _isloading = false; // Turn off the loading spinner
            });
        }
        catch(e)
        {
            print("Error fetching tasks: $e");
        }
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
            title: const Text(
                'My To-Do App',
                style: TextStyle(fontWeight: FontWeight.bold),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
        ),
        // 6. The UI Logic Tree
        body: _isloading
        ? const Center(child: CircularProgressIndicator()) // Show a spinner while fetching
        : _tasks.isEmpty
           ?const Center(
            child: Text(
                'No task added yet. Add one!',
                style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
           )
           :ListView.builder(
            itemCount: _tasks.length,
            itemBuilder: (context, index){
                final task = _tasks[index];
                return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                        title: Text(task.tittle),
                    ),
                )
            }
           )
      );
    }
}