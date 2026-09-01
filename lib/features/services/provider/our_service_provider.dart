import 'package:flutter/material.dart';
import 'package:hassanzamin/features/services/service_model.dart';

class OurServiceProvider extends ChangeNotifier {
  // ============================================================
  // SERVICES
  // ============================================================

  final List<ServicesItem> _services = [
    // ============================================================
    // 01 — PERFORMANCE MARKETING
    // ============================================================

    ServicesItem(
      title: 'Performance Marketing',
      shortDescription:
          'Campaigns engineered to turn attention into measurable business results.',
      description:
          'From strategy and targeting to optimization and reporting, every campaign is built around a clear business objective — generating demand, reducing wasted spend and improving conversion.',
      image: 'assets/images/services/performance_marketing.jpg',
      icon: Icons.campaign_rounded,
      points: [
        'Paid Media',
        'Growth Campaigns',
        'Conversion Tracking',
        'Campaign Scaling',
      ],
      metricOne: '15+',
      metricOneLabel: 'YEARS EXPERIENCE',
      metricTwo: '250+',
      metricTwoLabel: 'PROJECTS',
    ),

    // ============================================================
    // 02 — BRAND GROWTH
    // ============================================================
    ServicesItem(
      title: 'Brand Growth Strategy',
      shortDescription: 'Build a brand people recognize, remember and choose.',
      description:
          'Develop a clear market position, compelling messaging and a consistent digital identity that gives your brand a stronger presence and a sharper competitive edge.',
      image: 'assets/images/services/brand_growth.jpg',
      icon: Icons.auto_awesome_rounded,
      points: [
        'Brand Positioning',
        'Market Strategy',
        'Brand Messaging',
        'Digital Identity',
      ],
      metricOne: '360°',
      metricOneLabel: 'BRAND VIEW',
      metricTwo: '1',
      metricTwoLabel: 'CLEAR DIRECTION',
    ),

    // ============================================================
    // 03 — LEAD GENERATION
    // ============================================================
    ServicesItem(
      title: 'Lead Generation',
      shortDescription:
          'Attract the right prospects and give your sales pipeline room to grow.',
      description:
          'Create focused acquisition journeys that combine audience targeting, compelling offers, landing experiences and lead qualification to bring better opportunities into the business.',
      image: 'assets/images/services/lead_generation.jpg',
      icon: Icons.track_changes_rounded,
      points: [
        'Lead Strategy',
        'Landing Pages',
        'Lead Funnels',
        'Qualification',
      ],
      metricOne: '4',
      metricOneLabel: 'CORE STAGES',
      metricTwo: '24/7',
      metricTwoLabel: 'DIGITAL FLOW',
    ),

    // ============================================================
    // 04 — DIGITAL EDUCATION
    // ============================================================
    ServicesItem(
      title: 'Digital Education',
      shortDescription:
          'Turn digital marketing knowledge into practical capability.',
      description:
          'Practical learning experiences designed around real marketing situations, modern digital channels and the skills professionals need to make better decisions.',
      image: 'assets/images/services/digital_education.jpg',
      icon: Icons.school_rounded,
      points: [
        'Digital Marketing',
        'Practical Training',
        'Team Workshops',
        'Strategy Sessions',
      ],
      metricOne: '15+',
      metricOneLabel: 'YEARS EXPERIENCE',
      metricTwo: '250+',
      metricTwoLabel: 'PROJECTS',
    ),

    // ============================================================
    // 05 — CLIENT ACQUISITION
    // ============================================================
    ServicesItem(
      title: 'Client Acquisition Strategy',
      shortDescription:
          'Create a repeatable path from first interaction to valuable client.',
      description:
          'Connect audience research, positioning, campaigns, funnels and customer journeys into one acquisition strategy designed to create consistency instead of relying on random opportunities.',
      image: 'assets/images/services/client_acquisition.jpg',
      icon: Icons.person_add_alt_1_rounded,
      points: [
        'Audience Research',
        'Acquisition Funnels',
        'Customer Journey',
        'Growth Planning',
      ],
      metricOne: '360°',
      metricOneLabel: 'ACQUISITION VIEW',
      metricTwo: '1',
      metricTwoLabel: 'CONNECTED SYSTEM',
    ),

    // ============================================================
    // 06 — MENTORSHIP & CONSULTING
    // ============================================================
    ServicesItem(
      title: 'Mentorship & Business Consulting',
      shortDescription:
          'Clarity for better decisions, stronger strategies and sustainable growth.',
      description:
          'Work through business challenges with practical strategic guidance — identifying opportunities, removing bottlenecks and creating a clearer path toward the next stage of growth.',
      image: 'assets/images/services/business_consulting.jpg',
      icon: Icons.psychology_rounded,
      points: [
        'Business Strategy',
        'Growth Planning',
        'Problem Solving',
        'Leadership Guidance',
      ],
      metricOne: '15+',
      metricOneLabel: 'YEARS EXPERIENCE',
      metricTwo: '1:1',
      metricTwoLabel: 'STRATEGIC FOCUS',
    ),

    // ============================================================
    // 07 — SOCIAL MEDIA
    // ============================================================
    ServicesItem(
      title: 'Social Media Management',
      shortDescription:
          'Turn social channels into a consistent source of visibility and engagement.',
      description:
          'Build a purposeful social presence through content direction, campaign planning, community engagement and performance analysis — keeping the brand visible and relevant.',
      image: 'assets/images/services/social_media.jpg',
      icon: Icons.share_rounded,
      points: [
        'Content Direction',
        'Social Campaigns',
        'Community Building',
        'Performance Review',
      ],
      metricOne: '4',
      metricOneLabel: 'CORE AREAS',
      metricTwo: '360°',
      metricTwoLabel: 'SOCIAL STRATEGY',
    ),

    // ============================================================
    // 08 — CONVERSION OPTIMIZATION
    // ============================================================
    ServicesItem(
      title: 'Conversion Optimization',
      shortDescription:
          'Make more of the traffic, attention and opportunities you already have.',
      description:
          'Examine the complete customer journey to discover where people drop off, remove unnecessary friction and create smoother experiences that encourage action.',
      image: 'assets/images/services/conversion_optimization.jpg',
      icon: Icons.trending_up_rounded,
      points: [
        'Funnel Analysis',
        'Landing Page UX',
        'A/B Testing',
        'Data Insights',
      ],
      metricOne: '4',
      metricOneLabel: 'CORE AREAS',
      metricTwo: 'DATA',
      metricTwoLabel: 'DRIVEN',
    ),

    // ============================================================
    // 09 — SEO & ORGANIC GROWTH
    // ============================================================
    ServicesItem(
      title: 'SEO & Organic Growth',
      shortDescription:
          'Build long-term visibility that brings the right people to your business.',
      description:
          'Improve search visibility through keyword strategy, content structure, technical optimization and authority building — creating a stronger organic acquisition channel.',
      image: 'assets/images/services/seo_growth.jpg',
      icon: Icons.search_rounded,
      points: [
        'SEO Strategy',
        'Keyword Research',
        'Technical SEO',
        'Organic Growth',
      ],
      metricOne: '360°',
      metricOneLabel: 'SEO APPROACH',
      metricTwo: '24/7',
      metricTwoLabel: 'ORGANIC VISIBILITY',
    ),

    // ============================================================
    // 10 — CONTENT MARKETING
    // ============================================================
    ServicesItem(
      title: 'Content Marketing',
      shortDescription:
          'Create content that earns attention, builds authority and moves audiences closer to action.',
      description:
          'Develop strategic content around audience needs, brand expertise and business objectives — turning ideas into valuable digital experiences across multiple channels.',
      image: 'assets/images/services/content_marketing.jpg',
      icon: Icons.edit_note_rounded,
      points: [
        'Content Strategy',
        'Brand Storytelling',
        'Educational Content',
        'Content Distribution',
      ],
      metricOne: '4',
      metricOneLabel: 'CONTENT PILLARS',
      metricTwo: '360°',
      metricTwoLabel: 'CONTENT SYSTEM',
    ),

    // ============================================================
    // 11 — EMAIL MARKETING
    // ============================================================
    ServicesItem(
      title: 'Email Marketing',
      shortDescription:
          'Turn your audience into an owned communication channel that keeps generating value.',
      description:
          'Create targeted email journeys that nurture prospects, strengthen customer relationships and bring audiences back through relevant communication and strategic automation.',
      image: 'assets/images/services/email_marketing.jpg',
      icon: Icons.email_rounded,
      points: [
        'Email Campaigns',
        'Audience Segmentation',
        'Lead Nurturing',
        'Retention Emails',
      ],
      metricOne: '4',
      metricOneLabel: 'CORE FLOWS',
      metricTwo: '24/7',
      metricTwoLabel: 'AUTOMATED NURTURE',
    ),

    // ============================================================
    // 12 — MARKETING AUTOMATION
    // ============================================================
    ServicesItem(
      title: 'Marketing Automation',
      shortDescription:
          'Replace repetitive marketing tasks with connected systems that work continuously.',
      description:
          'Design automated journeys that connect leads, campaigns, customer actions and follow-ups so businesses can respond faster while maintaining a consistent customer experience.',
      image: 'assets/images/services/marketing_automation.jpg',
      icon: Icons.auto_mode_rounded,
      points: [
        'Workflow Automation',
        'Lead Nurturing',
        'Customer Journeys',
        'Automated Follow-up',
      ],
      metricOne: '24/7',
      metricOneLabel: 'AUTOMATION',
      metricTwo: '1',
      metricTwoLabel: 'CONNECTED SYSTEM',
    ),

    // ============================================================
    // 13 — GOOGLE ADS
    // ============================================================
    ServicesItem(
      title: 'Google Ads Management',
      shortDescription:
          'Capture high-intent demand when potential customers are actively searching.',
      description:
          'Build and optimize search, display and performance campaigns around relevant intent, efficient targeting and measurable conversion outcomes.',
      image: 'assets/images/services/google_ads.jpg',
      icon: Icons.ads_click_rounded,
      points: [
        'Search Campaigns',
        'Display Advertising',
        'Remarketing',
        'Bid Optimization',
      ],
      metricOne: '4.2x',
      metricOneLabel: 'TARGET ROAS',
      metricTwo: '360°',
      metricTwoLabel: 'CAMPAIGN VIEW',
    ),

    // ============================================================
    // 14 — META ADS
    // ============================================================
    ServicesItem(
      title: 'Meta Advertising',
      shortDescription:
          'Reach the right audiences with creative campaigns built for discovery and action.',
      description:
          'Develop Meta advertising strategies across Facebook and Instagram using audience research, creative testing, retargeting and continuous campaign optimization.',
      image: 'assets/images/services/meta_ads.jpg',
      icon: Icons.facebook_rounded,
      points: [
        'Audience Targeting',
        'Creative Testing',
        'Retargeting',
        'Campaign Scaling',
      ],
      metricOne: '360°',
      metricOneLabel: 'AUDIENCE VIEW',
      metricTwo: '4',
      metricTwoLabel: 'CORE SYSTEMS',
    ),

    // ============================================================
    // 15 — DIGITAL ANALYTICS
    // ============================================================
    ServicesItem(
      title: 'Digital Analytics & Insights',
      shortDescription:
          'Turn digital activity into clear insights that guide smarter business decisions.',
      description:
          'Connect meaningful data with business objectives through measurement frameworks, dashboards, reporting and performance analysis that reveal what is actually working.',
      image: 'assets/images/services/digital_analytics.jpg',
      icon: Icons.analytics_rounded,
      points: [
        'Performance Tracking',
        'Data Analysis',
        'Dashboards',
        'Growth Insights',
      ],
      metricOne: '360°',
      metricOneLabel: 'DATA VIEW',
      metricTwo: '1',
      metricTwoLabel: 'SOURCE OF TRUTH',
    ),

    // ============================================================
    // 16 — CUSTOMER RETENTION
    // ============================================================
    ServicesItem(
      title: 'Customer Retention Strategy',
      shortDescription:
          'Turn existing customers into long-term relationships and repeat business.',
      description:
          'Build retention strategies around customer experience, communication, loyalty and re-engagement to increase lifetime value and reduce unnecessary customer loss.',
      image: 'assets/images/services/customer_retention.jpg',
      icon: Icons.favorite_rounded,
      points: [
        'Customer Loyalty',
        'Retention Campaigns',
        'Re-engagement',
        'Lifetime Value',
      ],
      metricOne: '360°',
      metricOneLabel: 'CUSTOMER VIEW',
      metricTwo: '24/7',
      metricTwoLabel: 'ENGAGEMENT',
    ),

    // ============================================================
    // 17 — MARKET RESEARCH
    // ============================================================
    ServicesItem(
      title: 'Market Research & Insights',
      shortDescription:
          'Understand the market, the audience and the opportunity before making the next move.',
      description:
          'Combine audience understanding, competitor analysis and market signals to uncover opportunities and create strategies based on evidence rather than assumptions.',
      image: 'assets/images/services/market_research.jpg',
      icon: Icons.insights_rounded,
      points: [
        'Audience Research',
        'Competitor Analysis',
        'Market Trends',
        'Opportunity Mapping',
      ],
      metricOne: '360°',
      metricOneLabel: 'MARKET VIEW',
      metricTwo: '1',
      metricTwoLabel: 'CLEAR INSIGHT',
    ),

    // ============================================================
    // 18 — SALES FUNNEL STRATEGY
    // ============================================================
    ServicesItem(
      title: 'Sales Funnel Strategy',
      shortDescription:
          'Design a clearer journey that moves prospects from curiosity to confident action.',
      description:
          'Map the complete customer journey and connect awareness, consideration, trust and conversion into a structured funnel designed to reduce drop-off and improve progression.',
      image: 'assets/images/services/sales_funnel.jpg',
      icon: Icons.filter_alt_rounded,
      points: [
        'Funnel Mapping',
        'Lead Nurturing',
        'Conversion Paths',
        'Sales Alignment',
      ],
      metricOne: '4',
      metricOneLabel: 'FUNNEL STAGES',
      metricTwo: '360°',
      metricTwoLabel: 'CUSTOMER JOURNEY',
    ),

    // ============================================================
    // 19 — WEBSITE & DIGITAL EXPERIENCE
    // ============================================================
    ServicesItem(
      title: 'Website & Digital Experience',
      shortDescription:
          'Create digital experiences that communicate clearly and make taking action effortless.',
      description:
          'Improve websites and digital touchpoints through purposeful structure, user experience, messaging and conversion-focused design that connects brand and business objectives.',
      image: 'assets/images/services/digital_experience.jpg',
      icon: Icons.web_rounded,
      points: [
        'UX Strategy',
        'Website Structure',
        'Conversion Design',
        'Digital Experience',
      ],
      metricOne: '360°',
      metricOneLabel: 'EXPERIENCE VIEW',
      metricTwo: '1',
      metricTwoLabel: 'CONNECTED JOURNEY',
    ),

    // ============================================================
    // 20 — CUSTOMER EXPERIENCE
    // ============================================================
    ServicesItem(
      title: 'Customer Experience Strategy',
      shortDescription:
          'Make every meaningful customer interaction feel clearer, easier and more valuable.',
      description:
          'Review customer touchpoints across the journey to identify friction, strengthen communication and create a more consistent experience from first contact through retention.',
      image: 'assets/images/services/customer_experience.jpg',
      icon: Icons.support_agent_rounded,
      points: [
        'Journey Mapping',
        'Customer Touchpoints',
        'Experience Design',
        'Service Improvement',
      ],
      metricOne: '360°',
      metricOneLabel: 'CX VIEW',
      metricTwo: '1',
      metricTwoLabel: 'CONNECTED EXPERIENCE',
    ),
  ];

  int _hoveredIndex = -1;

  List<ServicesItem> get services => List.unmodifiable(_services);

  int get hoveredIndex => _hoveredIndex;

  bool isHovered(int index) {
    return _hoveredIndex == index;
  }

  void setHovered(int index) {
    if (_hoveredIndex == index) return;

    _hoveredIndex = index;
    notifyListeners();
  }

  void clearHovered(int index) {
    if (_hoveredIndex != index) return;

    _hoveredIndex = -1;
    notifyListeners();
  }
}
