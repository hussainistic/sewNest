import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sewnest/presentation/auth_screens/login_screens/rider_login_screen.dart';
import 'package:sewnest/presentation/tailer_views/dashboard_screens/dashboard_screen.dart';
import '../utilis/styles/customColors.dart';
import 'auth_screens/login_screens/tailor_login_screen.dart';
import 'auth_screens/login_screens/user_login_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Select Your Role",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: CustomColors.secondaryColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildRoleCard(
              context,
              title: "Login as User",
              description: "Access services and manage your orders.",
              icon: Icons.person,
              color: Colors.blueAccent,
              onTap: () => Get.to(UserLoginScreen()),
            ),
            const SizedBox(height: 20),
            _buildRoleCard(
              context,
              title: "Login as Tailor",
              description: "Manage assigned orders and update statuses.",
              icon: Icons.design_services,
              color: Colors.teal,
              onTap: () => Get.to(TailorLoginScreen()),
            ),
            const SizedBox(height: 20),
            _buildRoleCard(
              context,
              title: "Login as Rider",
              description: "Handle delivery tasks and update order statuses.",
              icon: Icons.delivery_dining,
              color: Colors.deepOrange,
              onTap: () => Get.to(RiderLoginScreen()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleCard(
      BuildContext context, {
        required String title,
        required String description,
        required IconData icon,
        required Color color,
        required VoidCallback onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 8,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: color.withOpacity(0.2),
                child: Icon(icon, size: 30, color: color),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }
}
