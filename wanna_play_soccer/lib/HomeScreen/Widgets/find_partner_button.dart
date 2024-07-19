import "package:flutter/material.dart";
import "package:wanna_play_soccer/FindPartner/find_partner.dart";
import "package:wanna_play_soccer/Theme/my_colors.dart";
import "package:wanna_play_soccer/Theme/my_theme.dart";

class FindPartnerButton extends StatefulWidget {
  const FindPartnerButton({
    super.key,
  });

  @override
  State<FindPartnerButton> createState() => _FindPartnerButtonState();
}

class _FindPartnerButtonState extends State<FindPartnerButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primaryMint,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FindPartnerPage()),
          );
        },
        child: const Text(
          "내 환상/환장의 짝궁은?",
          style: MyTheme.defaultText,
        ),
      ),
    );
  }
}
