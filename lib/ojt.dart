import 'package:flutter/material.dart';
import 'my_navbar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

class OjtPage extends StatelessWidget {
  const OjtPage({super.key});

  final List<Map<String, dynamic>> _ojtEntries = const [
    {
      'images': ['assets/FPRDI.png', 'assets/tmdss.jpeg'],
      'title': 'DOST-FPRDI Experience',
      'subtitle': 'Forest Products Research & Development Institute',
      'description':
          'On July 27, 2025, I have completed 486 hours of on-the-job training at the Department of Science and Technology – Forest Products Research and Development Institute (DOST-FPRDI) in Los Baños, Laguna.\n\n'
          'I was assigned to the Training Services Division – Training and Manpower Development Services Section (TSD-TMDSS), which conducts training programs nationwide based on the needs of requesting organizations. My main role was to help digitize records, organize data, and support systems that reduce manual workloads and improve productivity.\n\n'
          'TSD-TMDSS delivers training both face-to-face and online. Trainings cover wood and bamboo processing and utilization technologies for livelihood, combining lectures, demonstrations, and hands-on activities.\n\n',
    },
    {
      'images': [
        'assets/training.png',
        'assets/map2.png',
        'assets/map3.png',
        'assets/map4.png',
        'assets/map5.png',
        'assets/map6.jpeg',
        'assets/map7.png',
        'assets/map8.png',
      ],
      'title': 'GIS Training Map System',
      'subtitle': 'Web-based Training Management Platform',
      'description':
          'The DOST Training GIS Map is a web-based system that replaced the outdated paper-based process for managing training records. Previously, staff had to manually encode data into PDFs, making reporting slow, error-prone, and hard to analyze. As part of our on-the-job training, we were tasked to design and develop the GIS system to modernize how training activities are tracked and presented. My main role in the project was to develop the dynamic filter functions and implement the full set of admin features. I created filters that allow users to sort and search training data by region, province, city, year, month, and training type, making it easier to access specific information quickly. I also developed the admin dashboard, which includes Create, Read, Update, and Delete (CRUD) functionalities to manage training records securely and efficiently. The system was built using the Flutter programming language for a smooth, cross-platform web interface, Google Maps API to visualize training locations, and Supabase for user authentication and data storage. With the help of my supervisors and their feedback throughout the development process, I was able to refine the features and improve usability. This system will help staff generate clear, organized reports that can be easily presented to higher management, supporting better decision-making and internal planning.',
    },
    {
      'images': [
        'assets/cert1.jpg',
        'assets/cert2.png',
        'assets/cert3.png',
        'assets/cert4.png',
        'assets/cert5.png',
        'assets/cert6.png',
        'assets/cert7.png',
        'assets/cert8.jpg',
        'assets/cert9.jpg',
        'assets/cert10.jpg',
        'assets/cert11.png',
      ],
      'title': 'Certificate Generator Tool',
      'subtitle': 'Automated Certificate Generation System',
      'description':
          'The Certificate Generator was developed specifically for TMDSS-DOST to address the time-consuming and manual process of issuing certificates after training sessions. Each training typically collects responses from three separate forms—Attendance, Background, and Evaluation—and staff previously had to check each participant one by one to see if they completed all required forms, then manually list the eligible names and type them into certificates. To solve this, I developed a user-friendly tool that automates the entire process. The system allows staff to import CSV files from the three forms and intelligently cross-check attendance to identify eligible participants. I designed a customizable certificate template interface with drag-and-drop name placement, font selection, and layout options. The app generates personalized PDF certificates with dynamically positioned names, significantly reducing manual work. One of the key challenges was handling font compatibility for special scripts and ensuring the drag-and-drop editor could accurately save templates as configured. With ongoing testing and supervisor feedback, I refined the system to streamline certificate preparation, improve accuracy, and help staff issue certificates faster and more efficiently.',
    },
    {
      'images': ['assets/FPRDI.png'],
      'title': 'Synthesis of OJT Experience',
      'subtitle':
          'OJT of Training Services Division- Training and Manpower Development Services Section (TSD-TMDSS)',
      'description':
          'During my internship at DOST-FPRDI, I enhanced my abilities in software development, data management, and project documentation. I gained knowledge in designing and testing systems like the GIS Training Tracker and Certificate Generator, assisted in digitization projects, and worked effectively with a professional team. This experience deepened my understanding of the role of IT in enhancing training operations and driving innovation and sustainability.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: const Color(0xFFFAFAFA),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: const CustomNavBar(),
          ),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFAFAFA), Color(0xFFF5F5F5)],
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFE91E63).withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [Color(0xFFE91E63), Color(0xFF212121)],
                          ).createShader(bounds),
                          child: const Text(
                            'My OJT Journey',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              letterSpacing: -1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE91E63).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xFFE91E63).withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: const Text(
                            'DOST-FPRDI • System Development • Innovation',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFE91E63),
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),

                  ...List.generate(_ojtEntries.length, (index) {
                    final entry = _ojtEntries[index];
                    final isEven = index % 2 == 0;
                    return Container(
                      margin: const EdgeInsets.only(bottom: 60),
                      child: Flex(
                        direction: constraints.maxWidth < 900
                            ? Axis.vertical
                            : Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (isEven || constraints.maxWidth < 900) ...[
                            _buildImageCarousel(
                              entry['images'] as List<String>,
                            ),
                            const SizedBox(width: 60, height: 30),
                            _buildContentCard(
                              entry['title']!,
                              entry['subtitle']!,
                              entry['description']!,
                              index,
                            ),
                          ] else ...[
                            _buildContentCard(
                              entry['title']!,
                              entry['subtitle']!,
                              entry['description']!,
                              index,
                            ),
                            const SizedBox(width: 60, height: 30),
                            _buildImageCarousel(
                              entry['images'] as List<String>,
                            ),
                          ],
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageCarousel(List<String> images) {
    final controller = PageController();

    return LayoutBuilder(
      builder: (context, constraints) {
        // Make it responsive based on available width
        final double availableWidth = constraints.maxWidth;
        // Clamp width between 200 and 320
        final double carouselWidth = availableWidth.clamp(200, 320);
        // Maintain aspect ratio ~4:3
        final double carouselHeight = carouselWidth * 0.75;

        return Container(
          width: carouselWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFE91E63).withOpacity(0.15),
                blurRadius: 25,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                height: carouselHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFE91E63).withOpacity(0.1),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: PageView.builder(
                    controller: controller,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          final nextPage = index + 1 < images.length
                              ? index + 1
                              : 0;
                          controller.animateToPage(
                            nextPage,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOutCubic,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(images[index]),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SmoothPageIndicator(
                controller: controller,
                count: images.length,
                effect: const WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 12,
                  activeDotColor: Color(0xFFE91E63),
                  dotColor: Color(0xFFE0E0E0),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContentCard(
    String title,
    String subtitle,
    String description,
    int index,
  ) {
    return Container(
      width: 500,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE91E63).withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (index == 1 || index == 2) ...[
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFE91E63), Color(0xFFC2185B)],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Text(
                    index == 1 ? 'Project 1' : 'Project 2',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: () {
                    html.AnchorElement(
                        href: index == 1
                            ? 'assets/User Manual Map.pdf'
                            : 'assets/User Manual.pdf',
                      )
                      ..setAttribute(
                        'download',
                        index == 1 ? 'User_Manual_Map.pdf' : 'User_Manual.pdf',
                      )
                      ..click();
                  },
                  icon: const Icon(Icons.download, size: 18),
                  label: const Text(
                    'Download Manual',
                    style: TextStyle(fontSize: 13),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    backgroundColor: const Color(0xFFE91E63),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],

          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xFF212121),
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFE91E63).withOpacity(0.8),
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 20),
          ExpandableDescription(text: description, align: TextAlign.justify),
        ],
      ),
    );
  }
}

/// Enhanced expandable description widget
class ExpandableDescription extends StatefulWidget {
  final String text;
  final TextAlign align;

  const ExpandableDescription({
    super.key,
    required this.text,
    this.align = TextAlign.justify,
  });

  @override
  State<ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final span = TextSpan(
          text: widget.text,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF424242),
            height: 1.6,
            fontWeight: FontWeight.w400,
          ),
        );

        final tp = TextPainter(
          text: span,
          maxLines: _expanded ? null : 4,
          textDirection: TextDirection.ltr,
        );

        tp.layout(maxWidth: constraints.maxWidth);

        final isOverflowing = tp.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOutCubic,
              child: Text(
                widget.text,
                textAlign: widget.align,
                maxLines: _expanded ? null : 4,
                overflow: _expanded ? TextOverflow.visible : TextOverflow.fade,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF424242),
                  height: 1.6,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            if (isOverflowing || _expanded)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                    if (_expanded) {
                      _animationController.forward();
                    } else {
                      _animationController.reverse();
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE91E63).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFFE91E63).withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _expanded ? 'Show Less' : 'Read More',
                          style: const TextStyle(
                            color: Color(0xFFE91E63),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 6),
                        AnimatedRotation(
                          turns: _expanded ? 0.5 : 0.0,
                          duration: const Duration(milliseconds: 300),
                          child: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFFE91E63),
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
