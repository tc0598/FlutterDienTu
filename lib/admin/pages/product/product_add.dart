import 'package:app_shop_dien_tu/data/api.dart';
import 'package:app_shop_dien_tu/models/category.dart';
import 'package:app_shop_dien_tu/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductAdd extends StatefulWidget {
  final bool isUpdate;
  final Product? productModel;

  const ProductAdd({super.key, this.isUpdate = false, this.productModel});

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  String? selectedCate;
  List<CategoryModel> categorys = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _desController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imgController = TextEditingController();
  final TextEditingController _catIdController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  String titleText = "";

  @override
  void initState() {
    super.initState();
    _getCategorys();

    if (widget.productModel != null && widget.isUpdate) {
      _nameController.text = widget.productModel!.name;
      _desController.text = widget.productModel!.description;
      _priceController.text = widget.productModel!.price.toString();
      _imgController.text = widget.productModel!.image;
      _catIdController.text = widget.productModel!.categoryID.toString();
    }

    titleText = widget.isUpdate ? "Chỉnh sửa sản phẩm" : "Thêm sản phẩm";
  }

  Future<void> _getCategorys() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var temp = await APIRepository().getCategory(
        prefs.getString('accountID') ?? '',
        prefs.getString('token') ?? '');
    setState(() {
      selectedCate = temp.first.id.toString();
      _catIdController.text = selectedCate.toString();
      categorys = temp;
    });
  }

  Future<void> _onSave() async {
    final name = _nameController.text;
    final des = _desController.text;
    final price = double.tryParse(_priceController.text) ?? 0.0;
    final img = _imgController.text;
    final catId = _catIdController.text;
    final quantity = int.tryParse(_quantityController.text) ?? 0;

    if (name.isEmpty || des.isEmpty || price <= 0 || img.isEmpty || catId.isEmpty) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields correctly.')),
      );
      return;
    }

    var pref = await SharedPreferences.getInstance();
    await APIRepository().addProduct(
      Product(
        id: 0,
        name: name,
        image: img,
        categoryID: int.parse(catId),
        categoryName: '',
        price: price,
        description: des,
        quantity: quantity,
      ),
      pref.getString('token') ?? '',
    );
    Navigator.pop(context);
  }

  Future<void> _onUpdate() async {
    final name = _nameController.text;
    final des = _desController.text;
    final price = double.tryParse(_priceController.text) ?? 0.0;
    final img = _imgController.text;
    final catId = _catIdController.text;
    final quantity = int.tryParse(_quantityController.text) ?? 0;

    if (name.isEmpty || des.isEmpty || price <= 0 || img.isEmpty || catId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Làm ơn điền vào đây đủ !')),
      );
      return;
    }

    var pref = await SharedPreferences.getInstance();
    await APIRepository().updateProduct(
      Product(
        id: widget.productModel!.id,
        name: name,
        image: img,
        categoryID: int.parse(catId),
        categoryName: '',
        price: price,
        description: des,
        quantity: quantity,
      ),
      pref.getString('accountID') ?? '',
      pref.getString('token') ?? '',
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Tên sản phẩm:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Tên',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Giá sản phẩm:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _priceController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nhấn giá',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              const Text(
                'Hình ảnh sản phẩm:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _imgController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Hình ảnh URL',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Mô tả sản phẩm:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _desController,
                maxLines: 5,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Mô tả',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Danh mục sản phẩm:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                value: selectedCate,
                items: categorys
                    .map((item) => DropdownMenuItem<String>(
                          value: item.id.toString(),
                          child: Text(item.name, style: const TextStyle(fontSize: 20)),
                        ))
                    .toList(),
                onChanged: (item) {
                  setState(() {
                    selectedCate = item;
                    _catIdController.text = item ?? '';
                  });
                },
              ),
              const SizedBox(height: 20),
              // const Text(
              //   'Quantity:',
              //   style: TextStyle(
              //     fontSize: 20.0,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              // const SizedBox(height: 10),
              // TextField(
              //   controller: _quantityController,
              //   decoration: const InputDecoration(
              //     border: OutlineInputBorder(),
              //     hintText: 'Enter quantity',
              //   ),
              //   keyboardType: TextInputType.number,
              // ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () async {
                    widget.isUpdate ? _onUpdate() : _onSave();
                  },
                  child: const Text(
                    'Tạo sản phẩm',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
