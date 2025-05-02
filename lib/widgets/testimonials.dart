import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TestimonialsWidget extends StatelessWidget {
  TestimonialsWidget({super.key});

  final Faker faker = Faker();

  List<Map<String, String>> generateTestimonials(int count) {
    return List.generate(count, (index) {
      return {
        'name': faker.person.name(),
        'position': faker.job.title(),
        'testimonial': faker.lorem.sentences(3).join(' '),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final testimonials = generateTestimonials(4);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gak ADA',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: testimonials.length,
            itemBuilder: (context, index) {
              final testimonial = testimonials[index];
              return Animate(
                effects: [
                  FadeEffect(duration: 600.ms, delay: (100 * index).ms),
                ],
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '"${testimonial['testimonial']}"',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '- ${testimonial['name']}, ${testimonial['position']}',
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
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
