// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hassanzamin/features/about/presentation/models/team_member_model.dart';
import 'package:hassanzamin/features/footer/presentation/widgets/social_icon_button.dart';

class TeamCard extends StatefulWidget {
  final TeamMember member;

  const TeamCard({super.key, required this.member});

  @override
  State<TeamCard> createState() => _TeamCardState();
}

class _TeamCardState extends State<TeamCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool mobile = width < 768;

    return MouseRegion(
      onEnter: kIsWeb ? (_) => setState(() => hover = true) : null,
      onExit: kIsWeb ? (_) => setState(() => hover = false) : null,

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),

        transform: Matrix4.translationValues(0, hover ? -10 : 0, 0),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),

          gradient: LinearGradient(
            colors: hover
                ? [const Color(0xff37306B), const Color(0xff2B2555)]
                : [const Color(0xff2D275C), const Color(0xff211B47)],
          ),

          border: Border.all(color: Colors.white.withValues(alpha: .08)),

          boxShadow: [
            BoxShadow(
              blurRadius: hover ? 35 : 18,
              spreadRadius: hover ? 2 : 0,
              color: const Color(0xffFFD54F).withValues(alpha: .20),
              offset: const Offset(0, 18),
            ),
          ],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),

          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),

            child: Padding(
              padding: const EdgeInsets.all(25),

              child: Column(
                children: [
                  AnimatedScale(
                    duration: const Duration(milliseconds: 300),
                    scale: hover ? 1.08 : 1,

                    child: Container(
                      width: mobile ? 95 : 120,
                      height: mobile ? 95 : 120,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        border: Border.all(
                          color: const Color(0xffFFC107),
                          width: 3,
                        ),

                        image: DecorationImage(
                          image: AssetImage(widget.member.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    widget.member.name,

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: mobile ? 22 : 26,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    widget.member.designation,

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: mobile ? 15 : 17,
                    ),
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      SocialIconButton(
                        color: Colors.lightBlue,
                        icon: FaIcon(FontAwesomeIcons.facebookF),
                        onTap: () {},
                      ),
                      SizedBox(width: 8),
                      SocialIconButton(
                        color: Colors.deepOrange,
                        icon: const FaIcon(FontAwesomeIcons.instagram),
                        onTap: () {},
                      ),
                      SizedBox(width: 8),
                      SocialIconButton(
                        color: Colors.black,
                        icon: const FaIcon(FontAwesomeIcons.tiktok),
                        onTap: () {},
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,

                    height: 48,

                    child: ElevatedButton(
                      onPressed: () {},

                      style: ElevatedButton.styleFrom(
                        elevation: 0,

                        backgroundColor: const Color(0xffFFC107),

                        foregroundColor: Colors.black,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),

                      child: const Text(
                        "View Profile",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
