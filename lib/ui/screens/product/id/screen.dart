import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meal_planner/ui/viewModels/product.viewModel.dart';
import 'package:provider/provider.dart';

final class ViewAndEditProductScreen extends StatefulWidget {
  const ViewAndEditProductScreen({super.key});

  @override
  State<ViewAndEditProductScreen> createState() => _ViewAndEditProductScreenState();
}

class _ViewAndEditProductScreenState extends State<ViewAndEditProductScreen> {
  final TextFormField _nameFormField = TextFormField(
    decoration: InputDecoration(
      labelText: "Name",
      border: OutlineInputBorder(),
    ),
    controller: TextEditingController(),
  );

  final TextFormField _priceFormField = TextFormField(
    decoration: InputDecoration(
      labelText: "Price",
      border: OutlineInputBorder(),
    ),
    keyboardType: TextInputType.numberWithOptions(decimal: true),
    controller: TextEditingController(),
  );

  final TextFormField _quantityFormField = TextFormField(
    decoration: InputDecoration(
      labelText: "Quantity",
      border: OutlineInputBorder(),
    ),
    keyboardType: TextInputType.number,
    controller: TextEditingController(),
  );

  final _picker = ImagePicker();

  XFile? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Product')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: GestureDetector(
                onTap: () async {
                  //Show a toast with 2 options: "Take a photo" and "Choose from gallery"
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Icon(Icons.camera_alt),
                          title: Text("Take a photo"),
                          onTap: () async {
                            final pickedFile = await _picker.pickImage(
                              source: ImageSource.camera,
                            );
                            if (pickedFile != null) {
                              setState(() {
                                _image = pickedFile;
                                context.pop();
                              });
                            }
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.photo_library),
                          title: Text("Choose from gallery"),
                          onTap: () async {
                            final pickedFile = await _picker.pickImage(
                              source: ImageSource.gallery,
                            );
                            if (pickedFile != null) {
                              setState(() {
                                _image = pickedFile;
                                context.pop();
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
                child: Container(
                  constraints: BoxConstraints.tight(
                    MediaQuery.sizeOf(context) * 0.9,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),

                    image: DecorationImage(
                      scale: _image != null ? 0.2 : 1.0,
                      image: _image != null
                          ? FileImage(File(_image!.path))
                          : AssetImage("assets/no_image.png"),
                    ),
                  ),
                  child: Center(
                    child: _image != null
                        ? IconButton(
                            splashColor: Colors.white,
                            splashRadius: 48,
                            iconSize: 48,
                            onPressed: () {
                              setState(() {
                                _image = null;
                              });
                            },
                            icon: Icon(Icons.delete, color: Colors.red),
                          )
                        : null,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                spacing: 10,
                children: [_nameFormField, _priceFormField, _quantityFormField],
              ),
            ),

            ElevatedButton.icon(
              onPressed: () {
                
                context.pop();
                
              },
              label: Text("Save"),
              icon: Icon(Icons.save),
            ),
          ],
        ),
      ),
    );
    }
}


/*
Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ProductViewModel>().delete.execute(arg: product);
              context.pop();
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: context.watch<ProductViewModel>().getById, 
        builder: (context, child) {
          if(context.watch<ProductViewModel>().getById.running){
            return Center(child: Text.rich(TextSpan(text: "...Loading")));
          }
          return child!;
        },
        child: ListenableBuilder(listenable: context.watch<ProductViewModel>(), builder: (context,_){
          return Center(child: Text.rich(TextSpan(text: "View and Edit")));
        }),
      )
    );
*/