import 'package:flutter/material.dart';
import 'package:wildlife/config/constants/colors.dart';

class FirstAidTipsScreen extends StatelessWidget {
  const FirstAidTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Aid Tips"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary.withValues(alpha: 0.8), AppColors.primary.withValues(alpha: 0.5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  const Icon(Icons.emergency, size: 60, color: Colors.white),
                  const SizedBox(height: 12),
                  const Text(
                    "Wildlife First Aid Guide",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Essential tips for helping injured wildlife safely",
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Safety First Section
                  _buildTipCard(
                    title: "🛡️ Safety First",
                    tips: [
                      "Wear gloves when handling any animal",
                      "Avoid the face and mouth — risk of infection",
                      "Use a net or cage to safely contain the animal",
                      "Stay calm — stressed animals may bite or scratch",
                      "Never put your hands near an injured animal's mouth",
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Initial Assessment
                  _buildTipCard(
                    title: "👀 Initial Assessment",
                    tips: [
                      "Check for visible injuries (bleeding, broken limbs)",
                      "Look for signs of shock (shallow breathing, pale gums)",
                      "Observe behavior (responsiveness, pain signs)",
                      "Note any fluids or discharge from eyes, nose, or mouth",
                      "Assess body temperature (hypothermia is common)",
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Handling & Transport
                  _buildTipCard(
                    title: "🚗 Handling & Transport",
                    tips: [
                      "Use a well-ventilated container or cage",
                      "Line the container with soft cloth or blanket",
                      "Keep the animal warm and dark to reduce stress",
                      "Drive carefully — avoid sudden movements or loud noises",
                      "Keep other animals and people away during transport",
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Common Injuries
                  _buildTipCard(
                    title: "🩹 Common Injuries",
                    tips: [
                      "Bleeding: Apply gentle pressure with clean cloth",
                      "Fractures: Immobilize the limb without moving it",
                      "Hypothermia: Warm slowly with blankets (avoid direct heat)",
                      "Shock: Keep the animal calm and limit handling",
                      "Lacerations: Clean with saline solution if available",
                    ],
                  ),
                  const SizedBox(height: 16),

                  // What NOT to Do
                  _buildWarningCard(
                    title: "⚠️ What NOT to Do",
                    warnings: [
                      "Do NOT attempt surgery or remove foreign objects",
                      "Do NOT give food or water (may cause complications)",
                      "Do NOT restrain tightly — restrict blood flow",
                      "Do NOT use human medications",
                      "Do NOT delay professional veterinary care",
                    ],
                  ),
                  const SizedBox(height: 16),

                  // When to Contact Clinic
                  _buildInfoCard(
                    title: "📞 When to Call a Wildlife Clinic",
                    content:
                        "Contact a professional wildlife rehabilitator immediately for:\n\n"
                        "• Any visible injury or bleeding\n"
                        "• Difficulty breathing\n"
                        "• Loss of consciousness\n"
                        "• Inability to move\n"
                        "• Suspected poisoning or toxin exposure\n"
                        "• Orphaned young animals\n"
                        "• Any uncertainty about care\n\n"
                        "Do not wait — professional care significantly improves survival chances.",
                  ),
                  const SizedBox(height: 24),

                  // Important Notice
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.orange.withValues(alpha: 0.1),
                      border: const Border(left: BorderSide(color: Colors.orange, width: 4)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "⚡ Important Notice",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "These tips are for emergency support only. Always contact a licensed wildlife rehabilitation center or veterinarian. Do not delay professional care or attempt advanced medical procedures.",
                          style: TextStyle(fontSize: 13, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipCard({required String title, required List<String> tips}) {
    return Card(
      color: AppColors.softgreen,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: tips
                  .map((tip) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("• ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Expanded(
                              child: Text(
                                tip,
                                style: const TextStyle(fontSize: 13, height: 1.4),
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWarningCard({required String title, required List<String> warnings}) {
    return Card(
      color: Colors.red.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.red, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: warnings
                  .map((warning) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("✗ ", style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold)),
                            Expanded(
                              child: Text(
                                warning,
                                style: const TextStyle(fontSize: 13, height: 1.4),
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({required String title, required String content}) {
    return Card(
      color: Colors.blue.withValues(alpha: 0.05),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: const TextStyle(fontSize: 13, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}
