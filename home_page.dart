import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'my_navbar.dart';
import 'dart:html' as html;

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final PageController _pageController = PageController();

  void _downloadCV() {
    final anchor =
        html.AnchorElement(href: 'assets/Pangilinan, Althea Kim M.pdf')
          ..setAttribute('download', 'Pangilinan_Althea_.pdf')
          ..click();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: const CustomNavBar(),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isNarrow = constraints.maxWidth < 900;

          return SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFFAFAFA), Color(0xFFF8F8F8)],
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: isNarrow ? 16 : 48,
                vertical: isNarrow ? 24 : 48,
              ),
              child: isNarrow
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        buildLeftSection(isNarrow),
                        const SizedBox(height: 40),
                        buildRightSection(isNarrow),
                        buildCommunityExtensionSection(isNarrow),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(child: buildLeftSection(isNarrow)),
                            Expanded(child: buildRightSection(isNarrow)),
                          ],
                        ),
                        buildCommunityExtensionSection(isNarrow),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }

  Widget buildLeftSection(bool isNarrow) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isNarrow ? 0 : 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: isNarrow
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFFE91E63), Color(0xFF212121)],
            ).createShader(bounds),
            child: Text(
              'Althea Kim M. Pangilinan',
              textAlign: isNarrow ? TextAlign.center : TextAlign.left,
              style: TextStyle(
                fontSize: isNarrow ? 32 : 48,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                letterSpacing: -1.5,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFE91E63).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFFE91E63).withOpacity(0.3),
                width: 1,
              ),
            ),
            child: const Text(
              'Magna Cum Laude IT Graduate • Tech Enthusiast • Aspiring IT Professional',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFFE91E63),
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            height: 260, // You can keep a fixed height
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFE91E63).withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: const Text(
                'I am a Bachelor of Science in Information Technology graduate from Mapúa Malayan Colleges Laguna, '
                    'with a strong foundation in system administration, IT support, and database management. '
                    'During my studies, I have developed practical projects that demonstrate my technical capabilities, '
                    'including a GIS-based seminar tracker with dynamic filtering and data visualization, '
                    'an automated Certificate Generator that automates eligibility and document distribution, '
                    'and ScCARE, a mobile healthcare app supporting appointment booking, patient monitoring, and real-time data flow. '
                    'I am passionate about applying these skills to optimize IT systems, troubleshoot technical issues, '
                    'and manage databases efficiently, contributing to seamless and secure organizational operations.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF424242),
                  height: 1.6,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Align(
            alignment: isNarrow ? Alignment.center : Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [Color(0xFFE91E63), Color(0xFFC2185B)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFE91E63).withOpacity(0.4),
                    blurRadius: 15,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: ElevatedButton.icon(
                onPressed: _downloadCV,
                icon: const Icon(
                  Icons.download_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                label: const Text(
                  'Download CV',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRightSection(bool isNarrow) {
    final imageSize = isNarrow ? 220.0 : 280.0;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: imageSize + 20,
            height: imageSize + 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Color(0xFFE91E63).withOpacity(0.1),
                  Color(0xFFE91E63).withOpacity(0.05),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Container(
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Color(0xFFE91E63).withOpacity(0.2),
                width: 2,
              ),
            ),
          ),
          Container(
            width: imageSize - 30,
            height: imageSize - 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFE91E63), Color(0xFF212121)],
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFE91E63).withOpacity(0.3),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/unnamed.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCommunityExtensionSection(bool isNarrow) {
    final activities = [
      {
        'title': '📌 INC Giving – Typhoon Relief & Medical Mission',
        'details':
            '• Assisted in providing relief goods (food, hygiene kits, clothing) to villages affected by typhoons.\n'
            '• Participated in medical missions offering free check-ups and medicine.\n'
            '• Promoted compassion and service through volunteer outreach programs.\n'
            '• Supported logistical and crowd organization tasks during outreach.',
      },
      {
        'title':
            '📌 INC Clean & Green Project – Tree Planting & Coastal Cleanup',
        'details':
            '• Took part in environmental initiatives such as tree planting in public areas and community parks.\n'
            '• Helped organize and participate in coastal cleanup drives to reduce plastic waste and promote marine conservation.\n'
            '• Advocated for eco-awareness and sustainability practices within local communities.',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        crossAxisAlignment: isNarrow
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Text(
            'Community Extension Activities',
            style: TextStyle(
              fontSize: isNarrow ? 22 : 26,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: 260,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () {
                final nextPage =
                    (_pageController.page!.round() + 1) % activities.length;
                _pageController.animateToPage(
                  nextPage,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: activities.length,
                      itemBuilder: (context, index) {
                        final activity = activities[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                activity['title']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFE91E63),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                activity['details']!,
                                style: const TextStyle(
                                  fontSize: 15,
                                  height: 1.6,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: activities.length,
                    effect: WormEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      activeDotColor: Color(0xFFE91E63),
                      dotColor: Colors.grey.shade300,
                    ),
                    onDotClicked: (index) {
                      _pageController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
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
