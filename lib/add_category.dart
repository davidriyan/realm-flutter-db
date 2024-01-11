import 'package:flutter/material.dart';
import 'package:project_realm/models/pegawai_service.dart';
import './realm_service.dart';
import 'package:uuid/uuid.dart';

class AddCategoryPage extends StatefulWidget {
  final String id;
  const AddCategoryPage({super.key, required this.id});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  final TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: categoryController,
              decoration: const InputDecoration(
                labelText: 'category Pegawai',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                // Membuat objek Pegawai dari data yang diinputkan
                CategoryUser newCategory = CategoryUser(
                  const Uuid().v4(),
                  categoryController.text,
                );
                // Memanggil fungsi untuk menambahkan data category
                await RealmServices().addDataCategory(widget.id, newCategory);
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
