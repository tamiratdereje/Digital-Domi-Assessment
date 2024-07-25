

import 'package:digital_domi_assessment/constants/app_colors.dart';
import 'package:digital_domi_assessment/constants/app_strings.dart';
import 'package:digital_domi_assessment/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class InvitationCard extends StatelessWidget {
  const InvitationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                AppStrings.inviteTitle,
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.normal),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.white,
                    size: 24,
                  ))
            ],
          ),
          Flexible(
            child: Text(
              AppStrings.inviteDescription,
              style: TextStyle(
                  color: AppColors.white.withOpacity(0.8),
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
            ),
          ),
          const SizedBox(height: 20),
          CustomButton(title: AppStrings.sendInviteButtonLabel, onTap: () {})
        ],
      ),
    );
  }
}
