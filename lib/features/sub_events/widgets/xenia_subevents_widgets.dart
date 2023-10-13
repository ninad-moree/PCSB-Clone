import 'package:flutter/material.dart';
import 'package:tp2/constants/app_color.dart';

class XeniaSubEvents extends StatelessWidget {
  XeniaSubEvents({super.key});

  final List<String> aiTopics = [
    'Machine Learning',
    'Deep Learning',
    'Neural Networks',
    'Python',
    'TensorFlow',
    'PyTorch',
  ];

  final List<IconData> aiIcons = [
    Icons.computer,
    Icons.device_hub,
    Icons.memory,
    Icons.code,
    Icons.computer,
    Icons.build,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.royalBlue,
      body: Column(
        children: [
          Container(
            height: 250,
            color: AppColor.violet,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
              ),
              itemCount: aiTopics.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      // Add navigation or action here
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          aiIcons[index],
                          size: 100,
                          color: Colors.black,
                        ),
                        Text(
                          aiTopics[index],
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
