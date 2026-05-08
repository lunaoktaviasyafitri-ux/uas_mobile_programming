import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const SakuMahasiswaApp());

class SakuMahasiswaApp extends StatelessWidget {
  const SakuMahasiswaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF89A8B2),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class NilaiMatkul {
  String nama;
  String huruf;
  int sks;
  int semester;
  NilaiMatkul(this.nama, this.huruf, this.sks, this.semester);
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  final List<NilaiMatkul> daftarNilai = [];
  String selectedSemester = "1";
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _sksController = TextEditingController();
  final TextEditingController _hurufController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _namaController.dispose();
    _sksController.dispose();
    _hurufController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F0E8),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            _buildAestheticHeader(),
            SliverToBoxAdapter(
              child: Column(
                children: [_buildModernChartBox(), _buildSimulasiBenner()],
              ),
            ),
            _buildStickyTabBar(),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: List.generate(8, (i) => _buildSemesterList(i + 1)),
        ),
      ),
      // --- TOMBOL TAMBAH NILAI (Versi Lebih Panjang) ---
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showInputForm(context),
        backgroundColor: const Color(0xFF89A8B2),
        icon: const Icon(Icons.add, color: Colors.white),
        label:
            const Text("Tambah Nilai", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildSemesterList(int sem) {
    final filteredNilai = daftarNilai.where((n) => n.semester == sem).toList();

    if (filteredNilai.isEmpty) {
      return _buildEmptyState(sem); // Tampilkan ikon folder kalau kosong
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredNilai.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.only(bottom: 10),
          child: ListTile(
            title: Text(filteredNilai[index].nama,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text("SKS: ${filteredNilai[index].sks}"),
            trailing: CircleAvatar(
              backgroundColor: const Color(0xFF89A8B2),
              child: Text(filteredNilai[index].huruf,
                  style: const TextStyle(color: Colors.white)),
            ),
          ),
        );
      },
    );
  }

  void _showInputForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Text(
            "Input Nilai Baru",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: const Color(0xFF89A8B2)),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _namaController,
                  decoration: InputDecoration(
                    labelText: "Nama Mata Kuliah",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _hurufController,
                  decoration: InputDecoration(
                    labelText: "Nilai Huruf (A/B/C)",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _sksController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Jumlah SKS",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal", style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () {
                final nama = _namaController.text;
                final huruf = _hurufController.text.toUpperCase();
                final sks = int.tryParse(_sksController.text) ?? 0;
                final semester = _tabController.index + 1;

                if (nama.isNotEmpty && huruf.isNotEmpty) {
                  setState(() {
                    daftarNilai.add(NilaiMatkul(nama, huruf, sks, semester));
                  });

                  _namaController.clear();
                  _hurufController.clear();
                  _sksController.clear();

                  Navigator.pop(dialogContext);
                  // Tutup dialog
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Data berhasil disimpan")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF89A8B2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child:
                  const Text("Simpan", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAestheticHeader() {
    return SliverAppBar(
      expandedHeight: 220,
      pinned: true,
      backgroundColor: const Color(0xFF89A8B2),
      actions: [
        //Ikon PDF di pojok kanan atas
        IconButton(
          icon: const Icon(Icons.picture_as_pdf, color: Colors.white, size: 20),
          onPressed: () {},
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF89A8B2), Color(0xFFB3C8CF)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                "IPK KUMULATIF",
                style: TextStyle(
                  color: Colors.white70,
                  letterSpacing: 1.5,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "4.00",
                style: TextStyle(
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _glassChip(Icons.book, "1 Matkul"),
                  const SizedBox(width: 8),
                  _glassChip(Icons.emoji_events, "Cum Laude"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _glassChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: Colors.white),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModernChartBox() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 20, 16, 10),
      padding: const EdgeInsets.all(20),
      height: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Tren Nilai Per Semester",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                titlesData: const FlTitlesData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 1),
                      FlSpot(1, 3),
                      FlSpot(2, 4)
                    ], // Titik tunggal seperti gambar 2
                    isCurved: true,
                    color: const Color(0xFF89A8B2),
                    barWidth: 3,
                    dotData: const FlDotData(show: true),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimulasiBenner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF4E0),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFFFE5B4)),
      ),
      child: Row(
        children: [
          const Icon(Icons.analytics, color: Colors.orange, size: 18),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              "Simulasi: Untuk mencari Target 3.80,Kamu butuh rata-rata A di semester depan",
              style: TextStyle(
                fontSize: 10,
                color: Colors.orange,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStickyTabBar() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: const Color(0xFF89A8B2),
          unselectedLabelColor: Colors.grey,
          indicatorColor: const Color(0xFF89A8B2),
          indicatorWeight: 3,
          tabs: List.generate(8, (i) => Tab(text: "Semester ${i + 1}")),
        ),
      ),
    );
  }

  Widget _buildEmptyState(int sem) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.folder_open_rounded,
            size: 40,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 8),
          Text(
            "Belum ada data Semester $sem",
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);
  final TabBar _tabBar;
  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: const Color(0xFFF1F0E8),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) => false;
}
