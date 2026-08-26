import 'package:flutter/material.dart';

class ServiceDetailModule {
  final String number;
  final String title;
  final String shortDescription;
  final String description;

  final String image;
  final IconData icon;

  final List<String> points;

  final String metricOne;
  final String metricOneLabel;

  final String metricTwo;
  final String metricTwoLabel;

  final String overview;
  final String approach;

  final List<String> capabilities;
  final List<String> process;

  const ServiceDetailModule({
    required this.number,
    required this.title,
    required this.shortDescription,
    required this.description,
    required this.image,
    required this.icon,
    required this.points,
    required this.metricOne,
    required this.metricOneLabel,
    required this.metricTwo,
    required this.metricTwoLabel,
    required this.overview,
    required this.approach,
    required this.capabilities,
    required this.process,
  });
}

/////////////////////////////
///  Model for details
////////////////////////////

class ServiceDetailData {
  static const List<ServiceDetailModule> services = [
    // ============================================================
    // 01 PERFORMANCE MARKETING
    // ============================================================

    ServiceDetailModule(
      number: '01',
      title: 'Performance Marketing',
      shortDescription:
          'Meta Ads, Google Ads and data-driven campaigns that maximize ROI and business growth.',
      description:
          'Build measurable campaigns focused on clicks, leads, conversions and revenue. Track performance in real time and continuously optimize campaigns for stronger ROI.',
      image: 'assets/images/aboutme.jpeg',
      icon: Icons.campaign_rounded,
      points: [
        'Google Ads',
        'Meta Ads',
        'Conversion Tracking',
        'ROI Optimization',
      ],
      metricOne: '32%',
      metricOneLabel: 'LOWER CPA',
      metricTwo: '4.2x',
      metricTwoLabel: 'ROAS',
      overview:
          'Performance marketing focuses on measurable digital campaigns where every activity is connected to a business objective. Campaigns are structured around traffic, leads, conversions and revenue.',
      approach:
          'The approach combines audience research, campaign planning, creative testing, conversion tracking and continuous optimization to improve campaign efficiency.',
      capabilities: [
        'Google Ads Campaign Management',
        'Meta Advertising',
        'Audience Research',
        'Conversion Tracking',
        'Campaign Optimization',
        'Performance Reporting',
      ],
      process: [
        'Business & Audience Analysis',
        'Campaign Strategy',
        'Campaign Launch',
        'Performance Monitoring',
        'Optimization & Testing',
        'Reporting & Growth',
      ],
    ),

    // ============================================================
    // 02 BRAND GROWTH STRATEGY
    // ============================================================
    ServiceDetailModule(
      number: '02',
      title: 'Brand Growth Strategy',
      shortDescription:
          'Building memorable brands with positioning, messaging and digital identity.',
      description:
          'Create a stronger market position through clear brand strategy, customer-focused messaging and a consistent digital identity.',
      image: 'assets/images/aboutme.jpeg',
      icon: Icons.auto_awesome_rounded,
      points: [
        'Brand Positioning',
        'Market Strategy',
        'Digital Identity',
        'Growth Planning',
      ],
      metricOne: '86%',
      metricOneLabel: 'BRAND GROWTH',
      metricTwo: '4.2x',
      metricTwoLabel: 'IMPACT',
      overview:
          'Brand growth starts with understanding the market, customer expectations and the unique value a business can provide.',
      approach:
          'A structured brand strategy connects positioning, communication, customer experience and digital presence into one consistent growth direction.',
      capabilities: [
        'Brand Positioning',
        'Market Research',
        'Customer Segmentation',
        'Brand Messaging',
        'Digital Identity',
        'Growth Strategy',
      ],
      process: [
        'Market Research',
        'Audience Definition',
        'Positioning Strategy',
        'Messaging Development',
        'Digital Identity',
        'Growth Planning',
      ],
    ),

    // ============================================================
    // 03 LEAD GENERATION
    // ============================================================
    ServiceDetailModule(
      number: '03',
      title: 'Lead Generation',
      shortDescription:
          'Generate qualified leads through funnels, landing pages and automation.',
      description:
          'Build focused acquisition systems that attract qualified prospects, capture their information and move them toward conversion.',
      image: 'assets/images/aboutme.jpeg',
      icon: Icons.bar_chart_rounded,
      points: [
        'Lead Funnels',
        'Landing Pages',
        'Lead Qualification',
        'Automation',
      ],
      metricOne: '68%',
      metricOneLabel: 'MORE LEADS',
      metricTwo: '3.8x',
      metricTwoLabel: 'CONVERSION',
      overview:
          'Lead generation creates a predictable system for attracting potential customers and turning interest into qualified business opportunities.',
      approach:
          'The process combines targeted campaigns, landing pages, lead capture, qualification and follow-up systems.',
      capabilities: [
        'Lead Funnel Strategy',
        'Landing Page Planning',
        'Lead Capture',
        'Lead Qualification',
        'CRM Integration',
        'Automation',
      ],
      process: [
        'Audience Research',
        'Offer Development',
        'Funnel Planning',
        'Campaign Launch',
        'Lead Qualification',
        'Conversion Optimization',
      ],
    ),

    // ============================================================
    // 04 DIGITAL EDUCATION
    // ============================================================
    ServiceDetailModule(
      number: '04',
      title: 'Digital Education',
      shortDescription:
          'Empowering individuals and businesses with digital marketing knowledge.',
      description:
          'Practical training designed to help teams understand digital marketing, performance measurement and modern growth strategies.',
      image: 'assets/images/aboutme.jpeg',
      icon: Icons.school_rounded,
      points: [
        'Digital Marketing',
        'Practical Training',
        'Team Workshops',
        'Strategy Education',
      ],
      metricOne: '250+',
      metricOneLabel: 'PROJECTS',
      metricTwo: '15+',
      metricTwoLabel: 'YEARS',
      overview:
          'Digital education focuses on turning marketing knowledge into practical skills that teams and businesses can immediately apply.',
      approach:
          'Training is structured around real business examples, practical exercises, strategic thinking and measurable marketing outcomes.',
      capabilities: [
        'Digital Marketing Training',
        'Performance Marketing',
        'Business Workshops',
        'Marketing Strategy',
        'Team Development',
        'Practical Exercises',
      ],
      process: [
        'Training Needs Analysis',
        'Learning Objectives',
        'Training Session',
        'Practical Exercises',
        'Team Discussion',
        'Performance Review',
      ],
    ),

    // ============================================================
    // 05 CLIENT ACQUISITION STRATEGY
    // ============================================================
    ServiceDetailModule(
      number: '05',
      title: 'Client Acquisition Strategy',
      shortDescription:
          'Build predictable acquisition systems that turn prospects into valuable customers.',
      description:
          'Develop customer acquisition strategies that connect marketing channels, sales processes and customer journeys.',
      image: 'assets/images/aboutme.jpeg',
      icon: Icons.person_add_alt_1_rounded,
      points: [
        'Customer Acquisition',
        'Sales Funnels',
        'CRM Strategy',
        'Growth Planning',
      ],
      metricOne: '54%',
      metricOneLabel: 'MORE CLIENTS',
      metricTwo: '3.6x',
      metricTwoLabel: 'PIPELINE',
      overview:
          'Client acquisition strategy connects marketing activity with the commercial journey from first interaction to customer conversion.',
      approach:
          'The focus is on identifying high-value audiences, creating strong acquisition journeys and improving every stage of the customer funnel.',
      capabilities: [
        'Customer Journey Mapping',
        'Acquisition Strategy',
        'Sales Funnel Planning',
        'CRM Strategy',
        'Audience Targeting',
        'Retention Planning',
      ],
      process: [
        'Market Analysis',
        'Ideal Customer Profile',
        'Acquisition Planning',
        'Funnel Development',
        'Sales Alignment',
        'Optimization',
      ],
    ),

    // ============================================================
    // 06 MENTORSHIP & BUSINESS CONSULTING
    // ============================================================
    ServiceDetailModule(
      number: '06',
      title: 'Mentorship & Business Consulting',
      shortDescription:
          'Strategic guidance for businesses, professionals and teams focused on sustainable growth.',
      description:
          'Provide practical business guidance, strategic thinking and structured mentoring to help organizations make better growth decisions.',
      image: 'assets/images/aboutme.jpeg',
      icon: Icons.psychology_alt_rounded,
      points: [
        'Business Strategy',
        'Mentorship',
        'Growth Planning',
        'Decision Support',
      ],
      metricOne: '15+',
      metricOneLabel: 'YEARS',
      metricTwo: '250+',
      metricTwoLabel: 'PROJECTS',
      overview:
          'Business consulting provides an outside strategic perspective to identify opportunities, solve challenges and create practical growth plans.',
      approach:
          'Mentorship combines strategic discussion, business analysis, practical recommendations and ongoing accountability.',
      capabilities: [
        'Business Strategy',
        'Growth Consulting',
        'Professional Mentorship',
        'Marketing Consulting',
        'Strategic Planning',
        'Decision Support',
      ],
      process: [
        'Business Assessment',
        'Challenge Identification',
        'Strategy Development',
        'Action Planning',
        'Implementation Support',
        'Review & Mentorship',
      ],
    ),

    // ============================================================
    // 07 SOCIAL MEDIA MANAGEMENT
    // ============================================================
    ServiceDetailModule(
      number: '07',
      title: 'Social Media Management',
      shortDescription:
          'Build engaging social media presence through strategic content, campaigns and community growth.',
      description:
          'Create consistent and strategic social media communication designed to strengthen brand visibility, engagement and customer relationships.',
      image: 'assets/images/aboutme.jpeg',
      icon: Icons.share_rounded,
      points: [
        'Content Strategy',
        'Social Campaigns',
        'Community Growth',
        'Performance Analytics',
      ],
      metricOne: '72%',
      metricOneLabel: 'MORE REACH',
      metricTwo: '3.4x',
      metricTwoLabel: 'ENGAGEMENT',
      overview:
          'Social media management combines strategic content, audience engagement and campaign planning to build a stronger digital presence.',
      approach:
          'The strategy connects content planning with audience behavior, brand messaging, campaigns and performance measurement.',
      capabilities: [
        'Content Strategy',
        'Social Media Planning',
        'Campaign Management',
        'Community Management',
        'Content Optimization',
        'Analytics',
      ],
      process: [
        'Audience Research',
        'Content Planning',
        'Content Production',
        'Publishing',
        'Community Engagement',
        'Performance Analysis',
      ],
    ),

    // ============================================================
    // 08 CONVERSION OPTIMIZATION
    // ============================================================
    ServiceDetailModule(
      number: '08',
      title: 'Conversion Optimization',
      shortDescription:
          'Turn more visitors and leads into customers through data-driven conversion optimization.',
      description:
          'Improve digital journeys, landing pages and conversion systems to turn more existing traffic into measurable business results.',
      image: 'assets/images/aboutme.jpeg',
      icon: Icons.trending_up_rounded,
      points: ['CRO Strategy', 'Landing Pages', 'A/B Testing', 'Analytics'],
      metricOne: '41%',
      metricOneLabel: 'MORE CONVERSIONS',
      metricTwo: '2.9x',
      metricTwoLabel: 'EFFICIENCY',
      overview:
          'Conversion optimization focuses on removing friction from the customer journey and making digital experiences easier and more effective.',
      approach:
          'Data, user behavior and testing are used to identify conversion barriers and continuously improve the experience.',
      capabilities: [
        'Conversion Rate Optimization',
        'Landing Page Optimization',
        'A/B Testing',
        'User Journey Analysis',
        'Analytics',
        'Performance Testing',
      ],
      process: [
        'Data Analysis',
        'Conversion Audit',
        'Problem Identification',
        'Testing Strategy',
        'A/B Testing',
        'Continuous Optimization',
      ],
    ),
  ];
}
