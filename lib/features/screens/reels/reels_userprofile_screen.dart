import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReelUserProfileScreen extends StatelessWidget {
  final String userName;
  final String userPic;

  const ReelUserProfileScreen({super.key, required this.userName, required this.userPic});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final sw = Get.width;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(userName, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          CircleAvatar(radius: 45, backgroundImage: NetworkImage(userPic)),
          const SizedBox(height: 15),
          Text("@${userName.replaceAll(' ', '').toLowerCase()}", style: TextStyle(color: colors.outline, fontSize: 16)),
          const SizedBox(height: 20),

          // Gradient Button
          Container(
            width: 150,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(colors: [Color(0xFFFF7043), Color(0xFFFFCA28)]),
            ),
            child: const Center(child: Text("Follow", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16))),
          ),
          const SizedBox(height: 30),

          // User's Reels Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(2),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: sw > 600 ? 4 : 3, // Responsive for web/tablet
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 0.6, // Vertical rectangle for reels
              ),
              itemCount: 9, // Dummy count
              itemBuilder: (context, index) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network("https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?w=400", fit: BoxFit.cover),
                    Positioned(
                      bottom: 5, left: 5,
                      child: Row(
                        children: [
                          const Icon(Icons.play_arrow_outlined, color: Colors.white, size: 16),
                          Text("${(index + 1) * 12}K", style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}