import 'package:flutter/material.dart';
import 'package:project_realm/models/pegawai_service.dart';
import 'package:project_realm/realm_service.dart';

class UpdatePage extends StatefulWidget {
  final Pegawai pegawai;
  const UpdatePage({super.key, required this.pegawai});

  @override
  State<UpdatePage> createState() => _AddPageState();
}

class _AddPageState extends State<UpdatePage> {
  late TextEditingController nameController;
  late TextEditingController pekerjaanController;
  late TextEditingController umurController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.pegawai.name);
    pekerjaanController = TextEditingController(text: widget.pegawai.pekerjaan);
    umurController =
        TextEditingController(text: widget.pegawai.umur.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Pegawai'),
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
                labelText: 'Pekerjaan Pegawai',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                // Membuat objek Pegawai dari data yang diinputkan
                Pegawai updatedPegawai = Pegawai(
                  widget.pegawai.id,
                  nameController.text,
                  pekerjaanController.text,
                  int.parse(umurController.text),
                );
                // Memanggil fungsi untuk memperbarui data Pegawai
                await RealmServices().updateData(updatedPegawai);
                Navigator.pop(context, true);
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
