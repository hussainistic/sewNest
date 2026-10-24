import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sewnest/utilis/styles/customColors.dart';
import '../../../../controllers/user_controllers/user_profile_screen_controller.dart';
import '../../../../models/user_model.dart';

class MyUserProfileScreen extends StatefulWidget {
  final String userId;

  const MyUserProfileScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<MyUserProfileScreen> createState() => _MyUserProfileScreenState();
}

class _MyUserProfileScreenState extends State<MyUserProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());

  late TextEditingController _userNameController;
  late TextEditingController _phoneNoController;
  late TextEditingController _emailController;

  bool isEditing = false; // Toggle between view and edit mode

  late final UserModel userModel;

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  void _fetchUserDetails() async {
    userModel = await profileController.fetchUserDetails(widget.userId);

    setState(() {
      _userNameController = TextEditingController(text: userModel.userName);
      _phoneNoController = TextEditingController(text: userModel.phoneNo);
      _emailController = TextEditingController(text: userModel.email);
    });
  }

  void _saveChanges() async {
    // Update Firestore with edited details
    await profileController.updateUserDetails(widget.userId, {
      'userName': _userNameController.text,
      'phoneNo': _phoneNoController.text,
      'email': _emailController.text,
    });

    setState(() {
      isEditing = false;
    });

    Get.snackbar(
      "Profile Updated",
      "Your changes have been saved.",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
        backgroundColor: CustomColors.primaryColor,
        actions: [
          if (!isEditing)
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.white,),
              onPressed: () {
                setState(() {
                  isEditing = true;
                });
              },
            ),
          if (isEditing)
            IconButton(
              icon: const Icon(Icons.save, color: Colors.white,),
              onPressed: _saveChanges,
            ),
        ],
      ),
      body: userModel == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInfoCard(
              icon: Icons.person,
              title: "Name",
              value: userModel.userName,
              controller: _userNameController,
              isEditing: isEditing,
            ),
            _buildInfoCard(
              icon: Icons.phone,
              title: "Phone",
              value: userModel.phoneNo,
              controller: _phoneNoController,
              isEditing: isEditing,
              keyboardType: TextInputType.phone,
            ),
            _buildInfoCard(
              icon: Icons.email,
              title: "Email",
              value: userModel.email,
              controller: _emailController,
              isEditing: isEditing,
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
    required TextEditingController controller,
    required bool isEditing,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon),
        title: isEditing
            ? TextField(
          controller: controller,
          decoration: InputDecoration(labelText: title),
          keyboardType: keyboardType,
        )
            : Text(value),
      ),
    );
  }
}
