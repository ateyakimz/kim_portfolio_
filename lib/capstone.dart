import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'my_navbar.dart';
import 'package:url_launcher/url_launcher.dart';

class ScCareCapstonePage extends StatefulWidget {
  const ScCareCapstonePage({super.key});

  @override
  State<ScCareCapstonePage> createState() => _ScCareCapstonePageState();
}

class _ScCareCapstonePageState extends State<ScCareCapstonePage> {
  final List<List<Map<String, String>>> _carousels = [];

  late List<PageController> _controllers;
  late List<int> _indices;

  final List<String> _titles = [
    '👩‍⚕️ Registration and Dashboards',
    '📊 Resident Appointment Process',
    '🔒 BHW Appointment Process',
    '⚙️ Doctor Appointment Process',
    '📂 File Management',
    '💊 Patient Self-Care Tools',
    '💬 Chat Messages',
    '📰 News and Announcements',
    '✨ Other Features',
  ];

  @override
  void initState() {
    super.initState();

    _carousels.addAll([
      // 1. Registration and Dashboards
      [
        {
          'image': 'assets/capstone1.png',
          'description':
              'All users see this splash screen before entering the app or logging in.',
        },
        {
          'image': 'assets/otp.jpg',
          'description':
              'All users have pre-registered accounts and can log in using their mobile number and OTP.',
        },
        {
          'image': 'assets/patdash.jpg',
          'description':
              "The resident dashboard displays the user’s name, profile picture, and appointment status, including their queue number if an appointment is scheduled.",
        },
        {
          'image': 'assets/patdash2.jpg',
          'description':
              "Residents can swipe through their latest vital signs, view medical details, and see upcoming follow-ups.",
        },
        {
          'image': 'assets/bhwdash.jpg',
          'description':
              "The BHW dashboard displays the day’s pending and canceled appointments and tools for creating announcements.",
        },
        {
          'image': 'assets/docdash.jpg',
          'description':
              "The healthcare professional’s dashboard offers a daily overview of appointments and announcements.",
        },
        {
          'image': 'assets/docdash2.jpg',
          'description':
              "Swipe-able bar graphs show data on common illnesses and visits, filterable by month and year.",
        },
      ],
      // 2. Resident Appointment Process
      [
        {
          'image': 'assets/appt.jpg',
          'description':
              "Residents must have at least one symptom tracker entry before booking an appointment.",
        },
        {
          'image': 'assets/appt2.jpg',
          'description':
              'Residents select the purpose of their visit or enter a custom reason.',
        },
        {
          'image': 'assets/appt3.jpg',
          'description':
              'Residents can cancel booked appointments and provide a cancellation reason.',
        },
        {
          'image': 'assets/appt4.jpg',
          'description':
              'Residents can access a list of their past appointments and complete medical records.',
        },
        {
          'image': 'assets/appt5.jpg',
          'description':
              'Detailed appointment records include diagnosis and prescribed medications.',
        },
        {
          'image': 'assets/appt6.jpg',
          'description':
              'Residents can also view all their canceled appointments.',
        },
      ],
      // 3. BHW Appointment Process
      [
        {
          'image': 'assets/bhwappt1.jpg',
          'description':
              'Lists appointments scheduled by residents for the current day with their numbers.',
        },
        {
          'image': 'assets/bhhwappt2.jpg',
          'description':
              "Clicking a resident’s name opens the vital signs recording screen.",
        },
        {
          'image': 'assets/bhwappt3.jpg',
          'description':
              "Hamburger menu shows all upcoming and canceled appointments and lets BHWs register walk-ins.",
        },
        {
          'image': 'assets/bhwappt4.jpg',
          'description':
              "Walk-in residents are added to the queue by selecting their names.",
        },
        {
          'image': 'assets/bhwappt5.jpg',
          'description':
              "If no record is found, the BHW can add the resident as a new walk-in.",
        },
      ],
      // 4. Doctor Appointment Process
      [
        {
          'image': 'assets/docappt1.jpg',
          'description':
              'Calendar shows appointments. Selecting a resident starts the consultation and displays their info.',
        },
        {
          'image': 'assets/docappt2.jpg',
          'description':
              'During the consultation, doctors can record diagnosis and treatment plans.',
        },
        {
          'image': 'assets/docappt3.jpg',
          'description':
              'Doctors can also set follow-up appointments for residents if needed.',
        },
      ],
      // 5. File Management
      [
        {
          'image': 'assets/file2.jpg',
          'description':
              "BHWs can access a searchable list of all resident records. Selecting a resident’s name presents four options of residents' records such as Personal Information, Vital Signs History, Health History and Medical History.",
        },
        {'image': 'assets/file1.jpg', 'description': '4 options to select'},
        {
          'image': 'assets/file3.jpg',
          'description':
              'This section displays the personal information provided by residents in their own accounts.',
        },
        {
          'image': 'assets/file4.jpg',
          'description':
              'The vital sign history from the resident’s previous consultations is also accessible to healthcare providers.',
        },
        {
          'image': 'assets/file5.jpg',
          'description':
              'The health history of each resident can be viewed and edited. If residents are unsure what to enter, healthcare providers can assist by adding the information on their behalf.',
        },
        {
          'image': 'assets/file6.jpg',
          'description':
              'Resident records include their medical history, such as diagnoses and prescribed medications, displayed in a list view sorted in descending order.',
        },
      ],
      // 6. Patient Self-Care Tools
      [
        {
          'image': 'assets/symp1.jpg',
          'description':
              'A user-friendly symptom tracker where residents can log symptoms with severity, notes, and the start date. They can view their symptom history, edit entries that haven’t been reviewed by a healthcare professional, or delete symptoms if needed.',
        },
        {'image': 'assets/symp2.jpg', 'description': 'Symptoms Page'},
        {'image': 'assets/symp3.jpg', 'description': 'Symptoms History'},
        {
          'image': 'assets/alarm1.jpg',
          'description':
              " A medicine alarm feature that lets residents schedule medication reminders with details like the medicine name, dosage, and preferred time. When an alarm is set, a notification sounds on the user’s phone.",
        },
        {
          'image': 'assets/alarm2.jpg',
          'description':
              "When an alarm is set, a notification sounds on the user’s phone. Residents can create multiple daily reminders with customizable schedules and manage their medication list by specifying dosages, times, and frequencies",
        },
        {
          'image': 'assets/alarm3.jpg',
          'description':
              'They can track adherence by marking medications as taken or missed, supporting more precise health monitoring.',
        },
      ],
      // 7. Chat Messages
      [
        {
          'image': 'assets/chat2.png',
          'description':
              'The messaging interface allows residents, BHWs, and healthcare professionals to communicate directly for medical concerns from home. Users can select who to message, with features like active status, unread message alerts, typing, and seen indicators for smoother interaction.',
        },
        {'image': 'assets/chat1.png', 'description': 'Conversation View'},
        {
          'image': 'assets/chat3.jpg',
          'description':
              'Healthcare providers can chat with fellow healthcare providers and residents in real time for questions and guidance.',
        },
        {'image': 'assets/chat4.jpg', 'description': 'Conversation View'},
        {
          'image': 'assets/chat5.jpg',
          'description':
              'Resident can use predefined questions categorized by topics such as Medical Records, Health Center Information, and Common Medical Questions for quick communication. BHWs and healthcare professionals can view these selected questions and respond as needed. The interface also supports image sharing to aid in consultations.',
        },
        {'image': 'assets/chat6.jpg', 'description': 'Conversation View'},
      ],
      // 8. News and Announcements
      [
        {
          'image': 'assets/news1.png',
          'description':
              'Announcements keep residents updated about health campaigns and advisories.',
        },
      ],
      // 9. Other Features
      [
        {'image': 'assets/about.png', 'description': 'About'},
        {'image': 'assets/faq.png', 'description': 'Frequently Asked Questons'},
        {'image': 'assets/notif1.png', 'description': 'Notifications'},
        {'image': 'assets/notif2.png', 'description': 'Notifications'},
        {'image': 'assets/otpnotif.jpg', 'description': 'OTP Sample Message'},
        {'image': 'assets/privacy.png', 'description': 'Privacy Policy'},
        {'image': 'assets/settings.png', 'description': 'Settings'},
        {'image': 'assets/req.png', 'description': 'Request Account Page'},
      ],
    ]);

    _controllers = List.generate(_carousels.length, (_) => PageController());
    _indices = List.filled(_carousels.length, 0);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFDF2F8),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: const CustomNavBar(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final url = Uri.parse('https://www.sccareph.online/');
          if (await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Could not launch the website.')),
            );
          }
        },
        icon: const Icon(Icons.open_in_new),
        label: const Text('Visit Our Website'),
        backgroundColor: Color(0xFFEC4899),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFDF2F8), Color(0xFFFCE7F3)],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('ScCARE Capstone Overview'),
                      content: SingleChildScrollView(
                        child: Text(
                          'The mobile application developed for Barangay San Cristobal integrated a comprehensive digital appointment scheduling system and electronic record management tailored to local healthcare workflows. By allowing residents to conveniently book appointments and ensuring that all scheduled patients were served effectively, the app empowered Barangay Health Workers (BHWs) and healthcare professionals with instant access to up-to-date resident information. This digital approach streamlined daily clinic operations, reduced administrative workload, and minimized the risk of missed appointments. In addition to scheduling and records, the application implemented essential health-support features such as automated notifications, medication intake alerts, and symptom tracking to motivate adherence to treatment plans and consistent self-care. A built-in real-time messaging system enabled residents to communicate directly with healthcare providers, improving engagement and reducing the need for non-urgent in-person visits. Developed using the Dart programming language in Flutter, the app leveraged Firebase for authentication, Supabase for secure storage, and the iProg SMS API to send SMS blast notifications. It is fully compatible with Android 9 and above, providing tools and resources to support residents and healthcare staff, enhance accessibility, and encourage proactive health management through the real-time collection and updating of health data via mobile devices.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(25),
                splashColor: Colors.white24,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: screenWidth * 0.025, // smaller vertical padding
                    horizontal: screenWidth * 0.08,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFEC4899), Color(0xFFBE185D)],
                    ),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFEC4899).withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.mobile_friendly,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        'ScCARE Capstone Showcase',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.info_outline,
                        color: Colors.white,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (screenWidth > 600)
                      ? 4
                      : 2, // Responsive grid
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.65,
                ),
                itemCount: _carousels.length,
                itemBuilder: (context, i) {
                  return buildCarousel(
                    title: _titles[i],
                    controller: _controllers[i],
                    screens: _carousels[i],
                    currentIndex: _indices[i],
                    onPageChanged: (index) {
                      setState(() {
                        _indices[i] = index;
                      });
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCarousel({
    required String title,
    required PageController controller,
    required List<Map<String, String>> screens,
    required int currentIndex,
    required ValueChanged<int> onPageChanged,
  }) {
    final desc = screens[currentIndex]['description'] ?? '';

    return LayoutBuilder(
      builder: (context, constraints) {
        final double availableWidth = constraints.maxWidth;
        final double dynamicWidth = availableWidth.clamp(90, 150);
        final double dynamicHeight = dynamicWidth * 1.6;

        return Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  final nextPage = (currentIndex + 1) % screens.length;
                  controller.animateToPage(
                    nextPage,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Container(
                  width: dynamicWidth,
                  height: dynamicHeight,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black, width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: PageView.builder(
                      controller: controller,
                      itemCount: screens.length,
                      onPageChanged: onPageChanged,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          screens[index]['image'] ?? '',
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              SmoothPageIndicator(
                controller: controller,
                count: screens.length,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.teal,
                  dotHeight: 6,
                  dotWidth: 6,
                ),
              ),
              const SizedBox(height: 6),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text(title),
                      content: Text(desc.isEmpty ? 'No description' : desc),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    desc.isEmpty ? 'No description' : desc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  } // END OF buildCarousel
} // END OF _ScCareCapstonePageState
