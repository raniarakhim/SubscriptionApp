import 'package:flutter/material.dart';

class ClubDetailScreen extends StatelessWidget {
  const ClubDetailScreen({super.key, required this.club});
  final Map<String, dynamic> club;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FBFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF14A39A)),
        title: Text(
          club['name'] as String,
          style: const TextStyle(
            color: Color(0xFF1A1A1A),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Hero Section - Большое фото с градиентом
          Container(
            height: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  (club['color'] as Color).withOpacity(0.8),
                  (club['color'] as Color).withOpacity(0.4),
                  Colors.black.withOpacity(0.3),
                ],
              ),
            ),
            child: Stack(
              children: [
                // Фоновая иконка
                Center(
                  child: Icon(
                    _getClubIcon(club['type'] as String),
                    color: Colors.white.withOpacity(0.3),
                    size: 120,
                  ),
                ),
                // Текст поверх
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        club['name'] as String,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        club['type'] == 'spa'
                            ? 'Ощути разницу уже после первого визита'
                            : club['type'] == 'gym'
                                ? 'Зал, где прогресс — это норма'
                                : 'Гармония тела и души',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Блок с быстрой инфой
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _InfoRow(
                        icon: Icons.location_on,
                        title: '123 Main Street',
                        subtitle: 'Almaty, Kazakhstan',
                        color: const Color(0xFF14A39A),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 40,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    Expanded(
                      child: _InfoRow(
                        icon: Icons.star,
                        title: '4.8 / 5',
                        subtitle: '128 отзывов',
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _InfoRow(
                        icon: Icons.access_time,
                        title: 'Открыто',
                        subtitle: '09:00 - 22:00',
                        color: const Color(0xFF14A39A),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 40,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    Expanded(
                      child: _InfoRow(
                        icon: Icons.phone,
                        title: 'Позвонить',
                        subtitle: '+7 (777) 123-45-67',
                        color: const Color(0xFFE91E63),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Офферы (абонементы)
          const Text(
            'Абонементы, которые разлетаются первыми',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _OfferCard(
                  title: '1 месяц',
                  price: '15,000 ₸',
                  isPopular: false,
                  available: 8,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _OfferCard(
                  title: '3 месяца',
                  price: '38,250 ₸',
                  originalPrice: '45,000 ₸',
                  isPopular: true,
                  available: 3,
                  badge: '🔥 -15%',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _OfferCard(
                  title: '12 месяцев',
                  price: '126,000 ₸',
                  originalPrice: '180,000 ₸',
                  isPopular: false,
                  available: 1,
                  badge: '💰 -30%',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF14A39A), width: 2),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.local_offer,
                          color: Color(0xFF14A39A),
                          size: 32,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Забронировать\nсо скидкой',
                          style: const TextStyle(
                            color: Color(0xFF14A39A),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Отзывы клиентов
          const Text(
            'Отзывы клиентов',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 16),
          ...[
            {
              'name': 'Аружан К.',
              'rating': 5,
              'comment': 'Чисто, уютно, тренер реально топ! Видно результат уже после первой недели.',
              'avatar': 'A',
            },
            {
              'name': 'Тимур М.',
              'rating': 5,
              'comment': 'Массаж просто огонь! Расслабился как никогда. Буду ходить регулярно.',
              'avatar': 'T',
            },
            {
              'name': 'Дана А.',
              'rating': 4,
              'comment': 'Хороший зал, но в вечерние часы многовато народу. В остальном всё супер!',
              'avatar': 'D',
            },
          ].map((review) => _ReviewCard(review: review)),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Смотреть все 128 отзывов',
                  style: const TextStyle(
                    color: Color(0xFF14A39A),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Дополнительные предложения (апсейл)
          const Text(
            'Дополнительные предложения',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [const Color(0xFF14A39A).withOpacity(0.1), const Color(0xFFE91E63).withOpacity(0.1)],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF14A39A), width: 1),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.spa, color: Color(0xFF14A39A), size: 32),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Комбо: массаж + бассейн',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          const Text(
                            'Максимальное расслабление',
                            style: TextStyle(color: Color(0xFF666666)),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '5,000 ₸',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF14A39A),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF14A39A),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Добавить в абонемент'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [const Color(0xFFFF6B35).withOpacity(0.1), const Color(0xFFE91E63).withOpacity(0.1)],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFFF6B35), width: 1),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.fitness_center, color: Color(0xFFFF6B35), size: 32),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Персональный тренер',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          const Text(
                            'Индивидуальный подход к вашим целям',
                            style: TextStyle(color: Color(0xFF666666)),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'от 5,000 ₸',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF6B35),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6B35),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Добавить в абонемент'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  IconData _getClubIcon(String type) {
    switch (type) {
      case 'gym':
        return Icons.fitness_center;
      case 'spa':
        return Icons.spa;
      case 'yoga':
        return Icons.self_improvement;
      default:
        return Icons.fitness_center;
    }
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF666666),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _OfferCard extends StatelessWidget {
  const _OfferCard({
    required this.title,
    required this.price,
    this.originalPrice,
    required this.isPopular,
    required this.available,
    this.badge,
  });

  final String title;
  final String price;
  final String? originalPrice;
  final bool isPopular;
  final int available;
  final String? badge;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: isPopular ? Border.all(color: const Color(0xFFFF6B35), width: 2) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          if (badge != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFFF6B35),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                badge!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 4),
          if (originalPrice != null)
            Text(
              originalPrice!,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF999999),
                decoration: TextDecoration.lineThrough,
              ),
            ),
          Text(
            price,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Осталось $available пакетов',
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF14A39A),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({required this.review});

  final Map<String, dynamic> review;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFF14A39A),
            child: Text(
              review['avatar'] as String,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      review['name'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: List.generate(
                        5,
                        (i) => Icon(
                          i < (review['rating'] as int) ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  review['comment'] as String,
                  style: const TextStyle(color: Color(0xFF666666)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


