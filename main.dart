import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const QuranApp());
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'القرآن الكريم',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'Amiri',
        scaffoldBackgroundColor: const Color(0xFFF8F3E6),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: const Color(0xFF1A1A2E),
      ),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('القرآن الكريم'),
          centerTitle: true,
          backgroundColor: const Color(0xFF8B5A2B),
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 📅 التواريخ
              _buildDateCard(),
              const SizedBox(height: 16),
              // 🕌 أوقات الصلاة
              _buildPrayerTimesCard(),
              const SizedBox(height: 16),
              // 📖 الدخول للمصحف
              _buildMenuCard(
                icon: Icons.menu_book,
                title: 'المصحف الشريف',
                color: const Color(0xFF8B5A2B),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('قريباً: صفحة المصحف الكامل 📖')),
                  );
                },
              ),
              const SizedBox(height: 12),
              // 📿 الأذكار
              _buildMenuCard(
                icon: Icons.center_focus_strong,
                title: 'الأذكار والأدعية',
                color: const Color(0xFF2E7D32),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('قريباً: صفحة الأذكار 📿')),
                  );
                },
              ),
              const SizedBox(height: 12),
              // 📚 التفاسير
              _buildMenuCard(
                icon: Icons.book,
                title: 'التفاسير',
                color: const Color(0xFF1565C0),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('قريباً: التفاسير السنية والشيعية 📚')),
                  );
                },
              ),
              const SizedBox(height: 12),
              // ⚙️ الإعدادات
              _buildMenuCard(
                icon: Icons.settings,
                title: 'الإعدادات',
                color: const Color(0xFF616161),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('قريباً: الإعدادات ⚙️')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF8B5A2B), Color(0xFF5C3C20)],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
      ),
      child: const Column(
        children: [
          Text(
            '٢ ربيع الأول ١٤٤٧ هـ',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          SizedBox(height: 4),
          Text(
            '٢٨ سبتمبر ٢٠٢٦ م',
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerTimesCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'أوقات الصلاة — البصرة',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildPrayerItem('الفجر', '٤:٣٢'),
                _buildPrayerItem('الظهر', '١١:٥١'),
                _buildPrayerItem('العصر', '٣:٣٥'),
                _buildPrayerItem('المغرب', '٦:٠١'),
                _buildPrayerItem('العشاء', '٧:٣١'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerItem(String name, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(time, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildMenuCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const Icon(Icons.arrow_back_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
