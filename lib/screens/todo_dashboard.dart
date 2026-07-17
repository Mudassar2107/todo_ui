import 'package:flutter/material.dart';

class TodoDashboard extends StatefulWidget
{
    const TodoDashboard({super.key});
    @override
    State<TodoDashboard> createState() => _TodoDashboardState();
}
class _TodoDashboardState extends State<TodoDashboard>
{
    @override
    Widget build(BuildContext context) 
    {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
            title: const Text(
                'My To-Do App',
                style: TextStyle(fontWeight: FontWeight.bold),
            ),
            elevation: 0,
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
        ),
        body: const Center(
            child: Text('Dashboard is live.',
            style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
        ),
      );
    }
}