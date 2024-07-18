import 'package:flutter/material.dart';

class DeleteProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xóa sản phẩm'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Tên sản phẩm'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Mô tả sản phẩm'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Giá sản phẩm'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Text('Chọn hình ảnh sản phẩm'),
              SizedBox(height: 10),
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.grey[300],
                child: Center(
                  child: Text('Chưa chọn hình ảnh'),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Placeholder for image picking logic
                },
                child: Text('Chọn hình ảnh'),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Placeholder for form submission logic
                  },
                  child: Text('Thêm sản phẩm'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
