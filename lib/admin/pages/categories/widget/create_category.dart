import 'package:flutter/material.dart';

class CreateCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Category Name'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Add Category'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
