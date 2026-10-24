import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sewnest/utilis/styles/customColors.dart';
import '../../../../controllers/tailer_controllers/profile_screen_controller.dart';
import '../../../../models/tailor_model.dart';

class MyTailorProfileScreen extends StatefulWidget {
  final String tailorId;

  const MyTailorProfileScreen({Key? key, required this.tailorId}) : super(key: key);

  @override
  State<MyTailorProfileScreen> createState() => _MyTailorProfileScreenState();
}

class _MyTailorProfileScreenState extends State<MyTailorProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());

  late TextEditingController _tailorNameController;
  late TextEditingController _phoneNoController;
  late TextEditingController _emailController;
  late TextEditingController _specializationController;
  late TextEditingController _experienceController;

  bool isEditing = false;

  late Future<TailorModel>? tailorModelFuture;

  @override
  void initState() {
    super.initState();
    tailorModelFuture = _fetchTailorDetails();
  }

  Future<TailorModel> _fetchTailorDetails() async {
    final tailorModel = await profileController.fetchTailorDetails(widget.tailorId);

    // Initialize controllers once data is fetched
    _tailorNameController = TextEditingController(text: tailorModel.tailorName);
    _phoneNoController = TextEditingController(text: tailorModel.phoneNo);
    _emailController = TextEditingController(text: tailorModel.email);
    _specializationController = TextEditingController(text: tailorModel.specialization);
    _experienceController = TextEditingController(text: tailorModel.experience.toString());

    return tailorModel;
  }

  void _saveChanges() async {
    // Save changes to Firestore
    await profileController.updateTailorDetails(widget.tailorId, {
      'tailorName': _tailorNameController.text,
      'phoneNo': _phoneNoController.text,
      'email': _emailController.text,
      'specialization': _specializationController.text,
      'experience': int.tryParse(_experienceController.text) ?? 0,
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
        title: const Text("Tailor Profile"),
        backgroundColor: CustomColors.primaryColor,
        actions: [
          if (!isEditing)
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.white),
              onPressed: () {
                setState(() {
                  isEditing = true;
                });
              },
            ),
          if (isEditing)
            IconButton(
              icon: const Icon(Icons.save, color: Colors.white),
              onPressed: _saveChanges,
            ),
        ],
      ),
      body: FutureBuilder<TailorModel>(
        future: tailorModelFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No Rider Data Available'));
          }
          final tailorModel = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildInfoCard(
                    icon: Icons.person,
                    title: "Name",
                    value: tailorModel.tailorName,
                    controller: _tailorNameController,
                    isEditing: isEditing,
                  ),
                  _buildInfoCard(
                    icon: Icons.phone,
                    title: "Phone",
                    value: tailorModel.phoneNo,
                    controller: _phoneNoController,
                    isEditing: isEditing,
                    keyboardType: TextInputType.phone,
                  ),
                  _buildInfoCard(
                    icon: Icons.email,
                    title: "Email",
                    value: tailorModel.email,
                    controller: _emailController,
                    isEditing: isEditing,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  _buildInfoCard(
                    icon: Icons.design_services,
                    title: "Specialization",
                    value: tailorModel.specialization,
                    controller: _specializationController,
                    isEditing: isEditing,
                  ),
                  _buildInfoCard(
                    icon: Icons.timelapse,
                    title: "Experience (Years)",
                    value: tailorModel.experience.toString(),
                    controller: _experienceController,
                    isEditing: isEditing,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          );
        },
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
