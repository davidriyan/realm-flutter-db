import 'package:flutter/material.dart';
import 'package:project_realm/models/pegawai_service.dart';
import './realm_service.dart';
import 'package:uuid/uuid.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController pekerjaanController = TextEditingController();
  final TextEditingController umurController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pegawai'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nama Pegawai',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: pekerjaanController,
              decoration: const InputDecoration(
                labelText: 'Pekerjaan Pegawai',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.number,
              controller: umurController,
              decoration: const InputDecoration(
                labelText: 'Umur Pegawai',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                // Membuat objek Pegawai dari data yang diinputkan
                Pegawai newPegawai = Pegawai(
                  const Uuid().v4(), // Menambahkan ID baru dengan UUID
                  nameController.text,
                  pekerjaanController.text,
                  int.parse(umurController.text),
                );
                // Memanggil fungsi untuk menambahkan data Pegawai
                await RealmServices().addDataPegawai(newPegawai);
                // ignore: use_build_context_synchronously
                Navigator.pop(context, true);
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
