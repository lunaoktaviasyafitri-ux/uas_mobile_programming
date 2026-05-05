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
  State<HomePage> CreateState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
                children: [
                  _buildModernChartBox(), 
                  _buildSimulasiBanner()
                ],
              ),
            ),
            _buildStickyTabBar(),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: List.generate(8, (i) => _buildEmptyState(i + 1)),
        ),
      ),
      // --- TOMBOL TAMBAH NILAI (Versi Lebih Panjang) ---
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xFF89A8B2),
        elevation: 2,
        icon: const Icon(Icons.add, color: Colors.white),
        label:
           const Text("Tambah Nilai", style: TextStyle(color: Colors.white)),
      ),
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
              const Text("IPK KUMULATIF",
                  style: TextStyle(
                      color: Colors.white70,
                      letterSpacing: 1.5,
                      fontSize: 11,
                      fontWeight: FontWeight.bold)),
              const Text("4.00"
                  style: TextStyle(
                      fontSize:  72,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
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
          color: Colors.white24, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Icon(icon, size: 14, color: Colors.white),
          const SizedBox(width: 6),
          Text(label,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildModernChartBox() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 20, 16, 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Tren Nilai Per Semester"
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black87)),
          const SizedBox(
              height: 100),
          SizedBox(
            height: 100,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                titlesData: const FlTitlesData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    sport: const [
                      FlSpot(0, 1)
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



















































}
