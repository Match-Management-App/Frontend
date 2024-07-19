import "package:flutter/material.dart";
import "package:wanna_play_soccer/FindPartner/find_partner_page.dart";
import "package:wanna_play_soccer/Theme/my_colors.dart";
import "package:wanna_play_soccer/Theme/my_theme.dart";

class FindPartnerButton extends StatelessWidget {
  const FindPartnerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [MyTheme.defaultShadow],
      ),
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
