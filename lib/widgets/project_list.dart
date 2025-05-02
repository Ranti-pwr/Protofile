import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class ProjectListWidget extends StatelessWidget {
  ProjectListWidget({super.key});

  final Faker faker = Faker();

  List<Map<String, String>> generateProjects(int count) {
    return List.generate(count, (index) {
      return {
        'title': faker.lorem.words(3).join(' '),
        'description': faker.lorem.sentences(2).join(' '),
        'imageUrl': 'https://picsum.photos/seed/project$index/400/300',
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final projects = generateProjects(6);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projek',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.amber : Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              return Animate(
                effects: [
                  FadeEffect(duration: 600.ms, delay: (100 * index).ms),
                ],
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () {
                      // TODO: Show project details or navigate
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              imageUrl: project['imageUrl']!,
                              width: 120,
                              height: 90,
                              fit: BoxFit.cover,
                              placeholder:
                                  (context, url) => Container(
                                    color: Colors.grey[300],
                                    width: 120,
                                    height: 90,
                                  ),
                              errorWidget:
                                  (context, url, error) =>
                                      const Icon(Icons.error),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  project['title']!,
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  project['description']!,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
