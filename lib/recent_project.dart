import 'package:flutter/material.dart';
import 'my_navbar.dart';

class RecentProjectsPage extends StatefulWidget {
  const RecentProjectsPage({super.key});

  @override
  State<RecentProjectsPage> createState() => _RecentProjectsPageState();
}

class _RecentProjectsPageState extends State<RecentProjectsPage> {
  final ScrollController _scrollController = ScrollController();

  final Map<String, String> languagesPerYear = {
    '1st Year': 'Python, C++, HTML',
    '2nd Year': 'C#, C++',
    '3rd Year': 'Xamarin, Assembly',
    '4th Year': 'Dart',
  };

  final Map<String, List<Map<String, dynamic>>> projectsByYear = {
    '1st Year': [
      {
        'title': 'Student Information Management System',
        'description':
            'A student information management system with basic CRUD.',
        'image': 'assets/tk.jpg',
        'images': ['assets/tk.jpg'],
      },
      {
        'title': 'GWA Calculator',
        'description':
            'A grading system with weighted average calculation and a modern UI.',
        'image': 'assets/gwa.jpg',
        'images': [],
      },
    ],
    '2nd Year': [
      {
        'title': 'Dental Online Reservation',
        'description':
            'Simple Dental Services Reservation system allows patients to easily book an appointment by selecting a dental service, choosing a preferred date and time, and confirming their reservation. Once booked, patients can view their upcoming schedule in a clear, organized interface, while dentists have access to a dashboard displaying all scheduled appointments, including patient names and the specific procedures to be performed. This streamlined system ensures efficient scheduling, reduces administrative work, and keeps both patients and dental staff informed at a glance.',
        'image': 'assets/dent1.jpg',
        'images': [
          'assets/dent3.jpg',
          'assets/dent2.jpg',
          'assets/dent4.jpg',
          'assets/dent5.jpg',
          'assets/dent6.jpg',
          'assets/dent7.jpg',
          'assets/dent8.jpg',
          'assets/dent9.jpg',
        ],
      },
      {
        'title': 'Cafeteria Queue Management System in Command Prompt',
        'description':
            'his Cafeteria Queue application is a command-line program that simulates a food ordering system using queue data structures and algorithms. Users can place orders, which are added to the customer queue, view the current queue of waiting customers, display a table of all active orders, and mark orders as finished, automatically removing them from the queue. Designed as an educational project, it demonstrates how queues efficiently manage order processing and ensure customers are served in the correct sequence.',
        'image': 'assets/caf1.png',
        'images': [
          'assets/caf2.png',
          'assets/caf3.png',
          'assets/caf4.png',
          'assets/caf5.png',
          'assets/caf6.png',
          'assets/caf7.png',
        ],
      },
    ],
    '3rd Year': [
      {
        'title': 'Employee Management System',
        'description':
            'Employee Management System that enables administrators to create, update, search, and delete employee records, including details such as names, roles, and salaries. Employees have individual accounts where they can securely view their salary slips and related employment information. The system is designed to improve data accuracy, streamline administrative tasks, and enhance transparency between the organization and its employees.',
        'image': 'assets/salary.jpg',
        'images': [
          'assets/salary2.jpg',
          'assets/salary3.jpg',
          'assets/salary4.jpg',
          'assets/salary5].jpg',
          'assets/salary6.jpg',
          'assets/salary7.jpg',
          'assets/salary8.jpg',
          'assets/salary9.jpg',
        ],
      },
      {
        'title': 'Encryption Game using Assembly Language',
        'description':
            'This project is an interactive encryption game developed in Assembly Language using the EMU8086 emulator. It features two main modes: an encryption converter that shifts characters to create encrypted text, and a multi-level game where players decrypt words with limited lives and optional hints. The program demonstrates low-level input handling, string manipulation, and screen control through DOS interrupts, while managing game logic such as life tracking, level progression, and input validation. This project highlights how Assembly can be used to build engaging console applications and deepens understanding of how software interacts directly with hardware.',
        'image': 'assets/emu1.jpg',
        'images': [
          'assets/emu2.jpg',
          'assets/emu3.jpg',
          'assets/emu4.jpg',
          'assets/emu5.jpg',
        ],
      },
      {
        'title': 'Rock Paper Scissors Game',
        'description':
            'Connected Clash: Rock Paper Scissors IoT is a game delightful fusion of a classic pastime and modern technology, offering an engaging and interactive experience for players. Its accessibility and user-friendly design make it a perfect choice for children and adults alike, allowing them to indulge in the timeless fun of rock paper scissors in a whole new way. Materials Used: Breadboard, resistor, tactile switch, wire, Wemos, ISD cable, data cable, LED, powerbank. ',

        'image': 'assets/rps.png',

        'images': [
          'assets/rps2.png',
          'assets/rps3.png',
          'assets/rps4.png',
          'assets/rps5.png',
          'assets/rps6.jpg',
        ],
      },
    ],
    '4th Year': [
      {
        'title': 'ScCARE',
        'description':
            'Capstone title: Leveraging mHealth to Streamline Community care in Healthcenter',
        'image': 'assets/sccare.jpg',
        'images': [''],
      },
    ],
  };

  void _scrollToYear(String year) {
    final index = projectsByYear.keys.toList().indexOf(year);
    final position = index * 280.0;
    _scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF2F8),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomNavBar(),
      ),
      body: Column(
        children: [
          // Year filter buttons
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFDF2F8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: projectsByYear.keys.map((year) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ElevatedButton(
                      onPressed: () => _scrollToYear(year),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        backgroundColor: const Color(0xFFEC4899),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        year,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Scrollable project list
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: projectsByYear.entries.map((entry) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Year title
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Text(
                                entry.key,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBE185D),
                                ),
                              ),
                              if (languagesPerYear.containsKey(entry.key)) ...[
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFBE185D), // bright pink
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    languagesPerYear[entry.key]!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Centered cards with max width
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Center(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: 1000, // adjust as you like
                              ),
                              child: Wrap(
                                alignment: WrapAlignment.start,
                                spacing: 16,
                                runSpacing: 16,
                                children: entry.value
                                    .map(
                                      (project) => _buildProjectCard(project),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(Map<String, dynamic> project) {
    const int previewLimit = 80;
    final String description = project['description'];
    final bool isLong = description.length > previewLimit;

    return SizedBox(
      width: 260,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _showProjectDialog(project),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Fully visible image (no cropping)
              if (project['image'] != null &&
                  project['image'].toString().isNotEmpty)
                AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Image.asset(
                    project['image'],
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFBE185D),
                      ),
                    ),
                    const SizedBox(height: 6),
                    isLong
                        ? GestureDetector(
                            onTap: () => _showProjectDialog(project),
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        '${description.substring(0, previewLimit)}...',
                                  ),
                                  const TextSpan(
                                    text: ' Read more',
                                    style: TextStyle(
                                      color: Color(0xFFEC4899),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Text(
                            description,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showProjectDialog(Map<String, dynamic> project) {
    final List<dynamic>? rawImages = project['images'];
    final List<String> allImages = (rawImages != null)
        ? rawImages
              .whereType<String>()
              .where((img) => img.trim().isNotEmpty)
              .toList()
        : [];

    final List<String> imagesToShow = allImages.isNotEmpty
        ? allImages
        : [project['image']];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        final screenHeight = MediaQuery.of(context).size.height;

        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 24,
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 600,
              maxHeight: screenHeight * 0.85,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFEC4899), Color(0xFFBE185D)],
                    ),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          project['title'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          project['description'],
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 16),
                        if (imagesToShow.length == 1)
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => Dialog(
                                  backgroundColor: Colors.black87,
                                  child: GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: InteractiveViewer(
                                      child: Image.asset(
                                        imagesToShow.first,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              constraints: BoxConstraints(
                                maxHeight: screenHeight * 0.5,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  imagesToShow.first,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          )
                        else
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: imagesToShow.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (_) => Dialog(
                                        backgroundColor: Colors.black87,
                                        child: GestureDetector(
                                          onTap: () => Navigator.pop(context),
                                          child: InteractiveViewer(
                                            child: Image.asset(
                                              imagesToShow[index],
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        imagesToShow[index],
                                        width: 240,
                                        height: 200,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
