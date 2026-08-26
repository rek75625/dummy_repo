import 'package:flutter/material.dart';
import 'package:hassanzamin/app/app_router.dart';
import 'package:hassanzamin/core/widgets/custom_appbar.dart';
import 'package:hassanzamin/features/footer/presentation/screens/footer_section.dart';
import 'package:hassanzamin/features/footer/presentation/screens/newsletter_section.dart';
import 'package:hassanzamin/features/skills/model/skill_model.dart';
import 'package:hassanzamin/routes/back_to_home.dart';

class SkillsDetailsScreen extends StatelessWidget {
  final int index;

  const SkillsDetailsScreen({super.key, required this.index});

  // ============================================================
  // COLORS
  // ============================================================

  static const Color background = Color(0xff1C1A45);
  static const Color card = Color(0xff292653);
  static const Color yellow = Color(0xffffb800);
  static const Color softWhite = Color(0xfff5f4fb);
  static const Color lightCard = Color(0xffebeaf3);

  // ============================================================
  // SKILL DATA
  // ============================================================

  static final List<SkillPageData> skills = [
    SkillPageData(
      title: 'Content Marketing',
      icon: Icons.edit_note_rounded,
      image: 'assets/images/aboutme.jpeg',
      subtitle: 'Content That Builds Authority',
      description:
          'Strategic content designed to attract the right audience, '
          'communicate brand value and turn attention into meaningful '
          'business opportunities.',
      services: [
        'Content Strategy',
        'Content Planning',
        'Blog & Article Development',
        'Social Content',
        'Brand Storytelling',
        'SEO Content',
      ],
      metrics: [
        ('3.5x', 'CONTENT REACH'),
        ('68%', 'ENGAGEMENT'),
        ('42%', 'LEAD GROWTH'),
      ],
      process: [
        'Audience Research',
        'Content Strategy',
        'Content Creation',
        'Distribution',
        'Performance Analysis',
      ],
      resultTitle: 'Content That Works Beyond Visibility',
      resultDescription:
          'Every piece of content is developed around a clear business '
          'objective, helping brands build authority, trust and sustainable growth.',
    ),

    SkillPageData(
      title: 'Social Media Management',
      icon: Icons.share_rounded,
      image: 'assets/images/aboutme.jpeg',
      subtitle: 'Build A Strong Social Presence',
      description:
          'A complete social media approach focused on consistency, '
          'engagement, community building and measurable brand growth.',
      services: [
        'Social Media Strategy',
        'Content Calendars',
        'Creative Direction',
        'Community Management',
        'Campaign Management',
        'Performance Reporting',
      ],
      metrics: [
        ('4.2x', 'ENGAGEMENT'),
        ('76%', 'REACH GROWTH'),
        ('58%', 'COMMUNITY GROWTH'),
      ],
      process: [
        'Social Audit',
        'Strategy Development',
        'Content Planning',
        'Publishing',
        'Optimization',
      ],
      resultTitle: 'A Social Presence With Purpose',
      resultDescription:
          'The objective is not simply to publish more content. It is to '
          'create a recognizable, engaging and commercially valuable social presence.',
    ),

    SkillPageData(
      title: 'Conversion Optimization',
      icon: Icons.swap_vert_rounded,
      image: 'assets/images/aboutme.jpeg',
      subtitle: 'Turn More Visitors Into Customers',
      description:
          'Conversion-focused strategies that remove friction from the '
          'customer journey and improve the percentage of visitors who take action.',
      services: [
        'Conversion Audits',
        'Landing Page Optimization',
        'CTA Optimization',
        'A/B Testing',
        'Funnel Analysis',
        'User Journey Optimization',
      ],
      metrics: [
        ('32%', 'HIGHER CONVERSION'),
        ('41%', 'LOWER DROP-OFF'),
        ('2.8x', 'FUNNEL PERFORMANCE'),
      ],
      process: [
        'Data Analysis',
        'Identify Friction',
        'Build Hypothesis',
        'Test Variations',
        'Measure Results',
      ],
      resultTitle: 'More Value From Existing Traffic',
      resultDescription:
          'Instead of constantly chasing additional traffic, conversion '
          'optimization focuses on getting more business value from the audience you already have.',
    ),

    SkillPageData(
      title: 'Digital Strategy',
      icon: Icons.insights_rounded,
      image: 'assets/images/aboutme.jpeg',
      subtitle: 'Strategy Before Execution',
      description:
          'A complete digital roadmap connecting business objectives, '
          'audience insights, channels and measurable marketing activities.',
      services: [
        'Digital Audits',
        'Market Analysis',
        'Customer Journey Mapping',
        'Channel Strategy',
        'Growth Planning',
        'Performance Frameworks',
      ],
      metrics: [
        ('360°', 'STRATEGIC VIEW'),
        ('5+', 'CORE CHANNELS'),
        ('84%', 'STRATEGY ALIGNMENT'),
      ],
      process: [
        'Business Discovery',
        'Market Research',
        'Strategy Design',
        'Execution Roadmap',
        'Measurement',
      ],
      resultTitle: 'One Clear Direction For Growth',
      resultDescription:
          'A strong digital strategy connects every marketing activity '
          'to a larger business objective instead of treating channels independently.',
    ),

    SkillPageData(
      title: 'Google Ads',
      icon: Icons.ads_click_rounded,
      image: 'assets/images/aboutme.jpeg',
      subtitle: 'Capture High-Intent Demand',
      description:
          'Performance advertising campaigns built around high-intent '
          'search behavior, precise targeting and measurable acquisition.',
      services: [
        'Search Campaigns',
        'Display Advertising',
        'Shopping Campaigns',
        'Remarketing',
        'Keyword Strategy',
        'Conversion Tracking',
      ],
      metrics: [
        ('4.2x', 'AVERAGE ROAS'),
        ('32%', 'LOWER CPA'),
        ('67%', 'QUALITY SCORE'),
      ],
      process: [
        'Keyword Research',
        'Campaign Structure',
        'Ad Creation',
        'Tracking Setup',
        'Optimization',
      ],
      resultTitle: 'Advertising Built Around Results',
      resultDescription:
          'Campaigns are continuously optimized around cost, quality and '
          'conversion performance so advertising spend contributes directly to growth.',
    ),

    SkillPageData(
      title: 'Google Analytics',
      icon: Icons.analytics_rounded,
      image: 'assets/images/aboutme.jpeg',
      subtitle: 'Turn Data Into Decisions',
      description:
          'Analytics frameworks that help businesses understand visitors, '
          'campaign performance, customer journeys and growth opportunities.',
      services: [
        'GA4 Setup',
        'Event Tracking',
        'Conversion Tracking',
        'Dashboard Development',
        'Campaign Analysis',
        'Performance Reporting',
      ],
      metrics: [
        ('100%', 'TRACKING COVERAGE'),
        ('3.2x', 'DATA VISIBILITY'),
        ('45%', 'FASTER INSIGHTS'),
      ],
      process: [
        'Tracking Audit',
        'Measurement Plan',
        'Implementation',
        'Dashboard Setup',
        'Continuous Analysis',
      ],
      resultTitle: 'Better Decisions Through Better Data',
      resultDescription:
          'Analytics turns marketing activity into measurable information '
          'that can guide smarter decisions and more efficient investment.',
    ),

    SkillPageData(
      title: 'Email Marketing',
      icon: Icons.email_rounded,
      image: 'assets/images/aboutme.jpeg',
      subtitle: 'Build Relationships At Scale',
      description:
          'Email strategies designed to nurture prospects, retain customers '
          'and create consistent communication throughout the customer lifecycle.',
      services: [
        'Email Strategy',
        'Campaign Design',
        'Lead Nurturing',
        'Segmentation',
        'Automation',
        'Performance Tracking',
      ],
      metrics: [
        ('38%', 'OPEN RATE'),
        ('6.4x', 'CAMPAIGN ROI'),
        ('29%', 'CLICK GROWTH'),
      ],
      process: [
        'Audience Segmentation',
        'Campaign Planning',
        'Copy & Design',
        'Automation',
        'Optimization',
      ],
      resultTitle: 'Communication That Converts',
      resultDescription:
          'The right message delivered at the right stage can turn prospects '
          'into customers and customers into long-term advocates.',
    ),

    SkillPageData(
      title: 'Marketing Automation',
      icon: Icons.autorenew_rounded,
      image: 'assets/images/aboutme.jpeg',
      subtitle: 'Automate Repetitive Growth Activities',
      description:
          'Automation systems that connect marketing activities, customer '
          'journeys and sales processes into efficient workflows.',
      services: [
        'Lead Automation',
        'Email Automation',
        'CRM Workflows',
        'Lead Scoring',
        'Customer Journeys',
        'Reporting Automation',
      ],
      metrics: [
        ('62%', 'TIME SAVED'),
        ('3.7x', 'PROCESS EFFICIENCY'),
        ('48%', 'FASTER FOLLOW-UP'),
      ],
      process: [
        'Workflow Mapping',
        'Automation Design',
        'System Integration',
        'Testing',
        'Optimization',
      ],
      resultTitle: 'Less Manual Work. More Consistent Growth.',
      resultDescription:
          'Automation allows teams to spend less time on repetitive tasks '
          'and more time on strategy, creativity and customer relationships.',
    ),

    SkillPageData(
      title: 'Customer Acquisition',
      icon: Icons.person_add_alt_1_rounded,
      image: 'assets/images/aboutme.jpeg',
      subtitle: 'Acquire The Right Customers',
      description:
          'Acquisition strategies designed to attract qualified prospects '
          'and create scalable customer growth systems.',
      services: [
        'Audience Targeting',
        'Acquisition Funnels',
        'Lead Generation',
        'Paid Advertising',
        'Landing Pages',
        'Lead Qualification',
      ],
      metrics: [
        ('3.1x', 'ACQUISITION ROI'),
        ('47%', 'LOWER CPA'),
        ('2.6K+', 'QUALIFIED LEADS'),
      ],
      process: [
        'Audience Definition',
        'Channel Selection',
        'Campaign Launch',
        'Lead Qualification',
        'Optimization',
      ],
      resultTitle: 'A More Predictable Acquisition Engine',
      resultDescription:
          'A structured acquisition system makes growth less dependent on '
          'random campaigns and more dependent on repeatable processes.',
    ),

    SkillPageData(
      title: 'Customer Retention',
      icon: Icons.loyalty_rounded,
      image: 'assets/images/aboutme.jpeg',
      subtitle: 'Turn Customers Into Long-Term Value',
      description:
          'Retention strategies designed to improve loyalty, repeat purchases '
          'and long-term customer value.',
      services: [
        'Retention Strategy',
        'Customer Segmentation',
        'Loyalty Programs',
        'Lifecycle Marketing',
        'Reactivation Campaigns',
        'Customer Experience',
      ],
      metrics: [
        ('31%', 'RETENTION GROWTH'),
        ('2.4x', 'CUSTOMER VALUE'),
        ('44%', 'REPEAT PURCHASE'),
      ],
      process: [
        'Customer Analysis',
        'Segmentation',
        'Lifecycle Mapping',
        'Retention Campaigns',
        'Measurement',
      ],
      resultTitle: 'Growth Does Not Stop At The First Sale',
      resultDescription:
          'Strong retention creates repeat business, stronger relationships '
          'and greater lifetime value from every acquired customer.',
    ),

    SkillPageData(
      title: 'Market Research',
      icon: Icons.manage_search_rounded,
      image: 'assets/images/aboutme.jpeg',
      subtitle: 'Understand The Market Before You Act',
      description:
          'Research-driven insights that reveal customer needs, market trends, '
          'competitor movements and commercial opportunities.',
      services: [
        'Market Analysis',
        'Competitor Research',
        'Customer Research',
        'Trend Analysis',
        'Opportunity Mapping',
        'Consumer Insights',
      ],
      metrics: [
        ('360°', 'MARKET VIEW'),
        ('5+', 'RESEARCH AREAS'),
        ('82%', 'INSIGHT ACCURACY'),
      ],
      process: [
        'Research Objective',
        'Data Collection',
        'Market Analysis',
        'Insight Development',
        'Strategic Recommendations',
      ],
      resultTitle: 'Decisions Based On Evidence',
      resultDescription:
          'Research reduces assumptions and gives businesses a clearer '
          'understanding of where opportunities and risks actually exist.',
    ),

    SkillPageData(
      title: 'Brand Strategy',
      icon: Icons.auto_awesome_rounded,
      image: 'assets/images/aboutme.jpeg',
      subtitle: 'Create Brands People Remember',
      description:
          'Strategic brand development focused on positioning, differentiation, '
          'messaging and long-term brand value.',
      services: [
        'Brand Positioning',
        'Brand Architecture',
        'Messaging Strategy',
        'Brand Personality',
        'Competitive Differentiation',
        'Brand Guidelines',
      ],
      metrics: [
        ('94%', 'BRAND RECALL'),
        ('2.8x', 'BRAND IMPACT'),
        ('61%', 'GROWTH'),
      ],
      process: [
        'Brand Discovery',
        'Market Research',
        'Positioning',
        'Messaging',
        'Brand Activation',
      ],
      resultTitle: 'A Brand With A Clear Place In The Market',
      resultDescription:
          'Strong brands communicate consistently, differentiate clearly and '
          'create stronger connections with the people they want to serve.',
    ),

    SkillPageData(
      title: 'Growth Strategy',
      icon: Icons.rocket_launch_rounded,
      image: 'assets/images/aboutme.jpeg',
      subtitle: 'Build A Scalable Growth Engine',
      description:
          'Growth strategy connects acquisition, conversion, retention and '
          'customer value into one measurable growth system.',
      services: [
        'Growth Audits',
        'Growth Experiments',
        'Funnel Strategy',
        'Acquisition Planning',
        'Retention Strategy',
        'Growth Analytics',
      ],
      metrics: [
        ('3.8x', 'GROWTH POTENTIAL'),
        ('56%', 'EFFICIENCY'),
        ('72%', 'REVENUE GROWTH'),
      ],
      process: [
        'Growth Audit',
        'Opportunity Mapping',
        'Experiment Design',
        'Execution',
        'Scale Winning Ideas',
      ],
      resultTitle: 'Growth Designed To Be Repeatable',
      resultDescription:
          'The focus is on finding repeatable growth opportunities rather than '
          'relying on one-time campaigns or short-term tactics.',
    ),

    SkillPageData(
      title: 'E-Commerce Marketing',
      icon: Icons.shopping_cart_rounded,
      image: 'assets/images/aboutme.jpeg',
      subtitle: 'Turn Online Stores Into Growth Channels',
      description:
          'E-commerce marketing strategies covering acquisition, conversion, '
          'product promotion and customer retention.',
      services: [
        'E-Commerce Strategy',
        'Product Campaigns',
        'Shopping Ads',
        'Conversion Optimization',
        'Remarketing',
        'Retention Marketing',
      ],
      metrics: [
        ('4.1x', 'ROAS'),
        ('36%', 'CONVERSION GROWTH'),
        ('52%', 'REVENUE GROWTH'),
      ],
      process: [
        'Store Audit',
        'Customer Research',
        'Campaign Strategy',
        'Optimization',
        'Scale',
      ],
      resultTitle: 'More Traffic. More Orders. Better Customers.',
      resultDescription:
          'Every activity is connected to the complete e-commerce journey '
          'from discovery through purchase and repeat purchase.',
    ),

    SkillPageData(
      title: 'Campaign Management',
      icon: Icons.campaign_rounded,
      image: 'assets/images/aboutme.jpeg',
      subtitle: 'Campaigns Managed From Start To Finish',
      description:
          'End-to-end campaign management covering planning, creative execution, '
          'media coordination, optimization and reporting.',
      services: [
        'Campaign Planning',
        'Creative Coordination',
        'Media Planning',
        'Campaign Launch',
        'Performance Monitoring',
        'Campaign Reporting',
      ],
      metrics: [('185%', 'REACH'), ('3.4x', 'CAMPAIGN ROI'), ('72%', 'GROWTH')],
      process: [
        'Campaign Brief',
        'Strategy',
        'Creative Development',
        'Launch',
        'Optimization',
      ],
      resultTitle: 'Campaigns With One Clear Objective',
      resultDescription:
          'Strong campaign management keeps strategy, creative, media and '
          'measurement working together toward the same business outcome.',
    ),

    SkillPageData(
      title: 'Marketing Analytics',
      icon: Icons.bar_chart_rounded,
      image: 'assets/images/aboutme.jpeg',
      subtitle: 'Measure What Actually Matters',
      description:
          'Marketing analytics connects campaign activity with business '
          'outcomes so investment can be evaluated intelligently.',
      services: [
        'Marketing Dashboards',
        'Campaign Analysis',
        'ROI Analysis',
        'Funnel Analytics',
        'Customer Analytics',
        'Performance Reporting',
      ],
      metrics: [
        ('100%', 'REPORTING VISIBILITY'),
        ('3.2x', 'INSIGHT SPEED'),
        ('41%', 'EFFICIENCY'),
      ],
      process: [
        'Data Collection',
        'Data Cleaning',
        'Analysis',
        'Insight Development',
        'Decision Making',
      ],
      resultTitle: 'From Numbers To Business Intelligence',
      resultDescription:
          'Analytics transforms large amounts of marketing data into clear '
          'information that teams can actually use.',
    ),

    SkillPageData(
      title: 'Sales Strategy',
      icon: Icons.point_of_sale_rounded,
      image: 'assets/images/aboutme.jpeg',
      subtitle: 'Connect Marketing With Revenue',
      description:
          'Sales strategies designed to improve lead qualification, sales '
          'processes, customer conversations and revenue opportunities.',
      services: [
        'Sales Planning',
        'Lead Qualification',
        'Sales Funnels',
        'Pipeline Strategy',
        'Sales Enablement',
        'Performance Tracking',
      ],
      metrics: [
        ('27%', 'SALES GROWTH'),
        ('42%', 'FASTER PIPELINE'),
        ('3.1x', 'SALES ROI'),
      ],
      process: [
        'Sales Audit',
        'Pipeline Analysis',
        'Strategy Development',
        'Team Execution',
        'Optimization',
      ],
      resultTitle: 'A Sales Process Built For Growth',
      resultDescription:
          'A clear sales strategy helps teams understand where opportunities '
          'come from, how they move and what improves conversion.',
    ),

    SkillPageData(
      title: 'Training & Workshops',
      icon: Icons.co_present_rounded,
      image: 'assets/images/aboutme.jpeg',
      subtitle: 'Turn Knowledge Into Practical Capability',
      description:
          'Practical training and workshops designed to help teams understand '
          'modern marketing, retail, sales and business growth techniques.',
      services: [
        'Marketing Training',
        'Retail Training',
        'Sales Workshops',
        'Digital Marketing',
        'Team Development',
        'Practical Workshops',
      ],
      metrics: [
        ('250+', 'PROJECTS'),
        ('850+', 'LEARNERS'),
        ('96%', 'SATISFACTION'),
      ],
      process: [
        'Needs Assessment',
        'Training Design',
        'Practical Learning',
        'Team Exercises',
        'Performance Review',
      ],
      resultTitle: 'Learning That Moves Into Action',
      resultDescription:
          'Training focuses on practical application so participants can '
          'take the knowledge from the workshop and use it in real business situations.',
    ),

    SkillPageData(
      title: 'Retail Marketing',
      icon: Icons.storefront_rounded,
      image: 'assets/images/aboutme.jpeg',
      subtitle: 'Make Retail Execution More Powerful',
      description:
          'Retail-focused marketing strategies combining merchandising, '
          'shopper behavior, visibility and commercial execution.',
      services: [
        'Retail Strategy',
        'Visual Merchandising',
        'Shopper Marketing',
        'Retail Activation',
        'Trade Marketing',
        'Store Execution',
      ],
      metrics: [
        ('32%', 'VISIBILITY GROWTH'),
        ('4.2x', 'ACTIVATION ROI'),
        ('68%', 'EXECUTION SCORE'),
      ],
      process: [
        'Retail Audit',
        'Shopper Analysis',
        'Strategy',
        'Activation',
        'Execution Review',
      ],
      resultTitle: 'Better Execution At The Point Of Sale',
      resultDescription:
          'Retail marketing connects strategy with what customers actually '
          'see and experience inside the store.',
    ),

    SkillPageData(
      title: 'Business Development',
      icon: Icons.business_rounded,
      image: 'assets/images/aboutme.jpeg',
      subtitle: 'Create New Business Opportunities',
      description:
          'Business development strategies focused on partnerships, market '
          'opportunities, customer growth and sustainable commercial expansion.',
      services: [
        'Business Strategy',
        'Partnership Development',
        'Market Expansion',
        'Opportunity Analysis',
        'Client Development',
        'Growth Planning',
      ],
      metrics: [
        ('42+', 'OPPORTUNITIES'),
        ('3.5x', 'GROWTH POTENTIAL'),
        ('57%', 'PIPELINE GROWTH'),
      ],
      process: [
        'Business Analysis',
        'Opportunity Research',
        'Partnership Strategy',
        'Execution',
        'Growth Measurement',
      ],
      resultTitle: 'Turning Opportunities Into Business',
      resultDescription:
          'Business development creates structured pathways for finding, '
          'developing and converting new commercial opportunities.',
    ),
  ];

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    // Never allow an invalid index to crash the screen.
    final safeIndex = index.clamp(0, skills.length - 1);
    final skill = skills[safeIndex];

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;

            final bool mobile = width < 700;
            final bool tablet = width >= 700 && width < 1100;

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  customAppBar(context),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final width = constraints.maxWidth;
                      final bool isMobile = width < 768;
                      final bool isTablet = width >= 768 && width < 1200;
                      final bool isDesktop = width >= 1200;
                      final double heroHeight = isDesktop
                          ? 400
                          : isTablet
                          ? 350
                          : 250;
                      final double glassWidth = isDesktop
                          ? width * .65
                          : isTablet
                          ? width * .70
                          : width * .70;
                      final double glassPadding = isDesktop
                          ? 30
                          : isTablet
                          ? 16
                          : 10;
                      final double titleSize = isDesktop
                          ? 50
                          : isTablet
                          ? 35
                          : 26;
                      return Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: isMobile ? 15 : 30,
                        ),
                        height: heroHeight,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            /// Background Image
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  "assets/images/aboutus.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            /// Glass Card
                            Center(
                              child: Container(
                                width: glassWidth,
                                padding: EdgeInsets.symmetric(
                                  horizontal: glassPadding,
                                  vertical: glassPadding,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: .25),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: .35),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    /// Title
                                    Text(
                                      "Digital Growth Experts",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: titleSize,
                                      ),
                                    ),
                                    SizedBox(height: isMobile ? 15 : 25),
                                    CustomBackToHome(
                                      title: skill.title,
                                      onPressed: () => goBackOrHome(context),
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      mobile
                          ? 20
                          : tablet
                          ? 40
                          : 70,
                      mobile
                          ? 25
                          : tablet
                          ? 40
                          : 55,
                      mobile
                          ? 20
                          : tablet
                          ? 40
                          : 70,
                      mobile
                          ? 60
                          : tablet
                          ? 80
                          : 100,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1400),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _hero(
                              context,
                              skill,
                              mobile: mobile,
                              tablet: tablet,
                            ),

                            SizedBox(
                              height: mobile
                                  ? 45
                                  : tablet
                                  ? 55
                                  : 70,
                            ),

                            _overviewSection(context, skill, mobile: mobile),

                            SizedBox(
                              height: mobile
                                  ? 45
                                  : tablet
                                  ? 55
                                  : 70,
                            ),

                            _metricsSection(context, skill),

                            SizedBox(
                              height: mobile
                                  ? 45
                                  : tablet
                                  ? 55
                                  : 70,
                            ),

                            _processSection(context, skill),

                            SizedBox(
                              height: mobile
                                  ? 45
                                  : tablet
                                  ? 55
                                  : 70,
                            ),

                            _resultSection(context, skill, mobile: mobile),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  NewsletterSection(),
                  FooterSection(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // ============================================================
  // HERO
  // ============================================================

  Widget _hero(
    BuildContext context,
    SkillPageData skill, {
    required bool mobile,
    required bool tablet,
  }) {
    final image = _skillImage(skill, mobile: mobile);

    final content = _heroContent(context, skill, mobile: mobile);

    if (mobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [image, const SizedBox(height: 35), content],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: tablet ? 48 : 47, child: image),
        SizedBox(width: tablet ? 35 : 65),
        Expanded(flex: tablet ? 52 : 53, child: content),
      ],
    );
  }

  Widget _skillImage(SkillPageData skill, {required bool mobile}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(mobile ? 22 : 30),
      child: AspectRatio(
        aspectRatio: mobile ? 1.15 : 1.12,
        child: Image.asset(
          skill.image,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: card,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(skill.icon, color: yellow, size: mobile ? 55 : 80),
                  const SizedBox(height: 15),
                  Text(
                    skill.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: .65),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _heroContent(
    BuildContext context,
    SkillPageData skill, {
    required bool mobile,
  }) {
    final width = MediaQuery.sizeOf(context).width;

    final titleSize = width < 700
        ? 34.0
        : width < 1100
        ? 43.0
        : 55.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: mobile ? 64 : 72,
          height: mobile ? 64 : 72,
          decoration: BoxDecoration(
            color: yellow,
            borderRadius: BorderRadius.circular(mobile ? 18 : 20),
          ),
          child: Icon(skill.icon, color: background, size: mobile ? 30 : 34),
        ),

        const SizedBox(height: 25),

        Text(
          skill.title.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: titleSize,
            fontWeight: FontWeight.w900,
            height: 1.04,
            letterSpacing: -1.5,
          ),
        ),

        const SizedBox(height: 18),

        Text(
          skill.subtitle,
          style: TextStyle(
            color: yellow,
            fontSize: mobile ? 18 : 23,
            fontWeight: FontWeight.w700,
            height: 1.25,
          ),
        ),

        const SizedBox(height: 24),

        Text(
          skill.description,
          style: TextStyle(
            color: Colors.white.withValues(alpha: .72),
            fontSize: mobile ? 15 : 17,
            height: 1.7,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // OVERVIEW
  // ============================================================

  Widget _overviewSection(
    BuildContext context,
    SkillPageData skill, {
    required bool mobile,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(mobile ? 22 : 35),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(mobile ? 22 : 28),
        border: Border.all(color: Colors.white.withValues(alpha: .08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _sectionHeading(eyebrow: 'OVERVIEW', title: 'What I Do'),

          const SizedBox(height: 28),

          LayoutBuilder(
            builder: (context, constraints) {
              final bool twoColumns = constraints.maxWidth >= 700;

              return Wrap(
                spacing: 14,
                runSpacing: 14,
                children: skill.services.map((service) {
                  final width = twoColumns
                      ? (constraints.maxWidth - 14) / 2
                      : constraints.maxWidth;

                  return SizedBox(width: width, child: _serviceItem(service));
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _serviceItem(String text) {
    return Container(
      constraints: const BoxConstraints(minHeight: 62),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_rounded, color: yellow, size: 21),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // METRICS
  // ============================================================

  Widget _metricsSection(BuildContext context, SkillPageData skill) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _sectionHeading(eyebrow: 'EXPERTISE', title: 'Built Around Results'),

        const SizedBox(height: 28),

        LayoutBuilder(
          builder: (context, constraints) {
            final double gap = constraints.maxWidth < 600 ? 12 : 18;

            final int columns = constraints.maxWidth >= 900
                ? 3
                : constraints.maxWidth >= 560
                ? 2
                : 1;

            final double itemWidth = columns == 1
                ? constraints.maxWidth
                : (constraints.maxWidth - gap * (columns - 1)) / columns;

            return Wrap(
              spacing: gap,
              runSpacing: gap,
              children: skill.metrics.map((metric) {
                return SizedBox(
                  width: itemWidth,
                  child: _metricCard(metric.$1, metric.$2),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _metricCard(String value, String label) {
    return Container(
      constraints: const BoxConstraints(minHeight: 155),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white.withValues(alpha: .07)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: yellow,
              fontSize: 38,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: .65),
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PROCESS
  // ============================================================

  Widget _processSection(BuildContext context, SkillPageData skill) {
    final width = MediaQuery.sizeOf(context).width;
    final mobile = width < 700;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(mobile ? 22 : 35),
      decoration: BoxDecoration(
        color: softWhite,
        borderRadius: BorderRadius.circular(mobile ? 22 : 30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'HOW I WORK',
            style: TextStyle(
              color: yellow,
              fontSize: 13,
              fontWeight: FontWeight.w800,
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            'From Strategy To Execution',
            style: TextStyle(
              color: background,
              fontSize: mobile ? 28 : 38,
              fontWeight: FontWeight.w900,
              height: 1.1,
            ),
          ),

          const SizedBox(height: 28),

          LayoutBuilder(
            builder: (context, constraints) {
              final bool desktop = constraints.maxWidth >= 1000;

              if (desktop) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(skill.process.length, (index) {
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: index == skill.process.length - 1 ? 0 : 10,
                        ),
                        child: _processItem(index + 1, skill.process[index]),
                      ),
                    );
                  }),
                );
              }

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(skill.process.length, (index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: index == skill.process.length - 1 ? 0 : 12,
                    ),
                    child: _processItem(index + 1, skill.process[index]),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _processItem(int number, String title) {
    return Container(
      constraints: const BoxConstraints(minHeight: 85),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: lightCard,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: yellow,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Text(
              number.toString().padLeft(2, '0'),
              style: const TextStyle(
                color: background,
                fontWeight: FontWeight.w900,
                fontSize: 12,
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: background,
                fontWeight: FontWeight.w700,
                fontSize: 14,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // RESULT
  // ============================================================

  Widget _resultSection(
    BuildContext context,
    SkillPageData skill, {
    required bool mobile,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(mobile ? 25 : 40),
      decoration: BoxDecoration(
        color: yellow,
        borderRadius: BorderRadius.circular(mobile ? 22 : 30),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool stack = constraints.maxWidth < 650;

          final text = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'THE RESULT',
                style: TextStyle(
                  color: background,
                  fontWeight: FontWeight.w900,
                  fontSize: 13,
                  letterSpacing: 2,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                skill.resultTitle,
                style: TextStyle(
                  color: background,
                  fontSize: mobile ? 28 : 38,
                  fontWeight: FontWeight.w900,
                  height: 1.1,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                skill.resultDescription,
                style: TextStyle(
                  color: background.withValues(alpha: .75),
                  fontSize: 15,
                  height: 1.6,
                ),
              ),
            ],
          );

          if (stack) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [text, const SizedBox(height: 25), _resultIcon(skill)],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: text),
              const SizedBox(width: 40),
              _resultIcon(skill),
            ],
          );
        },
      ),
    );
  }

  Widget _resultIcon(SkillPageData skill) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Icon(skill.icon, color: yellow, size: 40),
    );
  }

  // ============================================================
  // SECTION HEADING
  // ============================================================

  Widget _sectionHeading({required String eyebrow, required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          eyebrow,
          style: const TextStyle(
            color: yellow,
            fontSize: 13,
            fontWeight: FontWeight.w800,
            letterSpacing: 2.5,
          ),
        ),

        const SizedBox(height: 9),

        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 34,
            fontWeight: FontWeight.w900,
            height: 1.1,
          ),
        ),
      ],
    );
  }
}
