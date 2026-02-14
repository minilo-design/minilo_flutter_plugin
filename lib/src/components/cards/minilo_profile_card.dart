import 'package:flutter/material.dart';

import '../../foundation/minilo_shimmer.dart';
import '../../foundation/minilo_theme.dart';

class MiniloProfileCard extends StatelessWidget {
  const MiniloProfileCard({
    super.key,
    this.name = 'Maruti Narayan',
    this.title = 'Project Manager',
    this.label = 'Active',
    this.userId = 'UserID : PDBT99',
    this.location = 'JP Nagar, Bengaluru, KA, India',
    this.joined = 'Joined in November 2023',
    this.profileImage,
    this.isLoading = false,
  });

  final String name;
  final String title;
  final String label;
  final String userId;
  final String location;
  final String joined;
  final ImageProvider<Object>? profileImage;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;
    final metaRows = [
      (Icons.person_outline, userId),
      (Icons.location_on_outlined, location),
      (Icons.work_outline, joined),
    ];

    return Container(
      width: 343,
      padding: EdgeInsets.symmetric(
          horizontal: minilo.spacing.s4, vertical: minilo.spacing.s3),
      decoration: BoxDecoration(
        color: const Color(0x99F5F4F4),
        borderRadius: BorderRadius.circular(minilo.radius.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (isLoading)
                const MiniloShimmerBox(width: 60, height: 60, radius: 30)
              else
                CircleAvatar(
                  radius: 30,
                  backgroundImage: profileImage,
                  child: profileImage == null
                      ? const Icon(Icons.person, size: 30)
                      : null,
                ),
              SizedBox(width: minilo.spacing.s3),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isLoading)
                    const MiniloShimmerBox(width: 160, height: 16)
                  else
                    Text(
                      name,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF191D23),
                          ),
                    ),
                  SizedBox(height: minilo.spacing.s1),
                  if (isLoading)
                    const MiniloShimmerBox(width: 120, height: 14)
                  else
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFF191D23),
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                ],
              ),
            ],
          ),
          SizedBox(height: minilo.spacing.s3),
          if (isLoading)
            const MiniloShimmerBox(width: 80, height: 24)
          else
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              height: 24,
              decoration: BoxDecoration(
                color: const Color(0xFFE6EFEA),
                borderRadius: BorderRadius.circular(minilo.radius.sm),
              ),
              alignment: Alignment.center,
              child: Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: minilo.colors.success),
              ),
            ),
          SizedBox(height: minilo.spacing.s3),
          ...metaRows.map((row) {
            return Padding(
              padding: EdgeInsets.only(bottom: minilo.spacing.s2),
              child: Row(
                children: [
                  if (isLoading)
                    const MiniloShimmerBox(width: 24, height: 24)
                  else
                    Icon(row.$1, size: 20, color: const Color(0xFF383F43)),
                  SizedBox(width: minilo.spacing.s3),
                  Expanded(
                    child: isLoading
                        ? const MiniloShimmerBox(height: 16)
                        : Text(
                            row.$2,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: const Color(0xFF191D23)),
                          ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
