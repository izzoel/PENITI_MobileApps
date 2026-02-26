import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import 'package:peniti_mobile/app/core/utils/snackbar_helper.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  final List<Widget> _screens = const [
    Center(child: Text("Home")),
    Center(child: Text("Stats")),
    Center(child: Text("Notes")),
    Center(child: Text("Info")),
  ];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.insert_chart,
    Icons.event_note,
    Icons.info,
  ];

  void _showLogoutDialog() {
    Get.defaultDialog(
      title: "Logout",
      middleText: "Apakah Anda yakin ingin keluar?",
      textCancel: "Batal",
      textConfirm: "Logout",
      confirmTextColor: Colors.white,
      buttonColor: const Color(0xFF5B4DBC),
      onConfirm: () async {
        controller.logout();

        SnackbarHelper.success("Logout berhasil");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// ================= HEADER =================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Color(0xFF5B4DBC),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Top Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => _showLogoutDialog(),
                          child: const Icon(Icons.menu, color: Colors.white),
                        ),
                        Icon(Icons.notifications_none, color: Colors.white),
                      ],
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      "Covid-19",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Are you feeling sick?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "If you feel sick with any of covid-19 symptoms please call or SMS us immediately for help.",
                      style: TextStyle(fontSize: 14, color: Colors.white70),
                    ),

                    const SizedBox(height: 25),

                    /// Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF4D58),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            icon: const Icon(Icons.call),
                            label: const Text("Call Now"),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4B7BEC),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            icon: const Icon(Icons.message),
                            label: const Text("Send SMS"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// ================= PREVENTION =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Prevention",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        _PreventionItem(
                          icon: Icons.people,
                          text: "Avoid close\ncontact",
                        ),
                        _PreventionItem(
                          icon: Icons.clean_hands,
                          text: "Clean your\nhands often",
                        ),
                        _PreventionItem(
                          icon: Icons.masks,
                          text: "Wear a\nfacemask",
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// ================= TEST CARD =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF7F7FD5), Color(0xFF5B4DBC)],
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.health_and_safety,
                        size: 50,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Do your own test!\nFollow the instructions to do your own test.",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),

      /// ================= BOTTOM NAV =================
      bottomNavigationBar: Obx(
        () => Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(25),
                blurRadius: 10,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeTab,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: List.generate(_icons.length, (index) {
              final isSelected = controller.currentIndex.value == index;

              return BottomNavigationBarItem(
                label: "",
                icon: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 18,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF4B7BEC)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    _icons[index],
                    color: isSelected ? Colors.white : Colors.grey,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

/// ================= PREVENTION ITEM WIDGET =================
class _PreventionItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _PreventionItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: const Color(0xFFEDE7F6),
          child: Icon(icon, size: 30, color: const Color(0xFF5B4DBC)),
        ),
        const SizedBox(height: 10),
        Text(text, textAlign: TextAlign.center),
      ],
    );
  }
}
