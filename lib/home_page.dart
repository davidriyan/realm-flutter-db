import 'package:flutter/material.dart';
import 'package:project_realm/add_category.dart';
// import 'package:gap/gap.dart';
import 'package:project_realm/add_page.dart';
import 'package:project_realm/models/pegawai_service.dart';
import 'package:project_realm/update_page.dart';
// import 'package:project_realm/update_page.dart';
import './realm_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Pegawai> pegawai; // variabel untuk menyimpan data pegawai
  @override
  void initState() {
    super.initState();
    _getPegawai(); // Initial fetch
  }

  Future<void> _getPegawai() async {
    setState(() {
      pegawai = RealmServices().getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                final result = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return const AddPage();
                }));
                if (result == true) {
                  // Jika result true, perbarui data pada halaman pertama
                  _getPegawai();
                }
              },
              icon: const Icon(Icons.add))
        ],
      ),
      // ignore: unnecessary_null_comparison
      body: FutureBuilder(
        future: pegawai,
        builder: (context, AsyncSnapshot<Pegawai> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Data masih kosong',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            );
          } else {
            final currentPegawai = snapshot.data!;
            return Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      final resultUpdate = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return UpdatePage(
                              pegawai: currentPegawai,
                            );
                          },
                        ),
                      );
                      if (resultUpdate == true) {
                        _getPegawai();
                      }
                    },
                    child: Container(
                      width: size.width / 1.2,
                      height: size.height / 5,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'nama: ${currentPegawai.name}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                'pekerjaan: ${currentPegawai.pekerjaan}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                'umur: ${currentPegawai.umur}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                'Categories: ${currentPegawai.resumePegawai.map((kategori) => kategori.category).toList().join(',')}',
                                style: const TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                          IconButton(
                            onPressed: () async {
                              await RealmServices().deleteUser();
                              _getPegawai();
                            },
                            icon: const Icon(Icons.delete),
                          )
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final resultCategory = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AddCategoryPage(
                              id: currentPegawai.id,
                            );
                          },
                        ),
                      );
                      if (resultCategory == true) {
                        _getPegawai();
                      }
                    },
                    child: const Text('Tambah Category'),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
