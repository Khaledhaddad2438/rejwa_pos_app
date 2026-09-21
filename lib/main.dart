import 'package:flutter/material.dart';

void main() {
  runApp(const RejwaPosApp());
}

class RejwaPosApp extends StatelessWidget {
  const RejwaPosApp({Super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'رجوة - POS والديون',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isRecording = false;

  void toggleRecording() {
    setState(() {
      isRecording = !isRecording;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isRecording 
            ? 'جاري تسچيل الصوت محلياً...' 
            : 'تم حفظ الدين الصوتي في قائمة المراجعة محلياً'
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('رجوة - إدارة المبيعات والديون'),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            // زر التسجيل الصوتي السريع للأوقات المزدحمة
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: toggleRecording,
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: isRecording ? Colors.red : Colors.indigo,
                        child: Icon(
                          isRecording ? Icons.stop : Icons.mic,
                          size: 70,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      isRecording ? 'جاري التسجيل...' : 'اضغط هنا لتسجيل دين صوتي سريع',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            
            // شبكة الوصول السريع للشاشات
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.grey.shade100,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                      onPressed: () {},
                      icon: const Icon(Icons.point_of_sale),
                      label: const Text('الكاشير السريع'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                      onPressed: () {},
                      icon: const Icon(Icons.rate_review),
                      label: const Text('المراجعة الصوتية'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
