import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotels Gallery',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HotelsPage(),
    );
  }
}

class HotelsPage extends StatelessWidget {
  const HotelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Отели')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          HotelCard(
            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKG8EeefSWO3bbag1dLCJWubyd5pba3Da4Gg&s',
            title: 'Роскошный отель "Морской бриз"',
            description: '5-звездочный отель с видом на море. Бассейн, спа, ресторан высокой кухни.',
          ),
          SizedBox(height: 16),
          HotelCard(
            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNk3EkamoduhvQHh2eiogSUxtB7xq9HbgQxQ&s',
            title: 'Горный курорт "Эдельвейс"',
            description: 'Уютные номера с камином. Лыжные трассы прямо от отеля. Термальные источники.',
          ),
          SizedBox(height: 16),
          HotelCard(
            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi9S5le0qspfwqKra23BNlu7qQhNV_CI4H6jPIysvoAMF78-XdMWAdu6KKHE9WAHYJwtg&usqp=CAU',
            title: 'Бутик-отель "Стиль"',
            description: 'Дизайнерские интерьеры в центре города. Крыша-терраса с панорамным видом.',
          ),
        ],
      ),
    );
  }
}

class HotelCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;

  const HotelCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  State<HotelCard> createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard> {
  bool _isTransparent = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isTransparent = !_isTransparent;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _isTransparent ? 0.3 : 1.0,
            child: Image.network(
              widget.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          if (_isTransparent)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
