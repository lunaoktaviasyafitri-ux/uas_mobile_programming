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
          return[
            _buildAestheticHeader(),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  _buildModernChartBox(),
                  _buildSimulasiBanner(),
                ],
              ), 
            ),
            _buildStickyTabBar(),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: Lint.generate(8, (i) => _buildEmptyState(i + 1)),
        ),
      ),

      




































    )










  }












































}
