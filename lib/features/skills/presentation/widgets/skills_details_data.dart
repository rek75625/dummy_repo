// import 'package:flutter/material.dart';
// import 'package:hassanzamin/features/skills/model/skills_details_model.dart';

// class SkillDetailData {
//   static const String defaultImage = 'assets/images/aboutme.jpeg';

//   static final List<SkillDetailModel> all = [
//     // =========================================================
//     // 01 CONTENT MARKETING
//     // =========================================================

//     SkillDetailModel(
//       title: 'Content Marketing',
//       icon: Icons.edit_note_rounded,
//       subtitle: 'Content That Builds Attention, Trust & Growth',
//       description:
//           'Develop strategic content that attracts the right audience, communicates brand value and turns attention into meaningful business opportunities.',
//       image: defaultImage,
//       services: [
//         'Content Strategy',
//         'Content Planning',
//         'Brand Storytelling',
//         'Social Content',
//         'Campaign Content',
//       ],
//       process: [
//         'Audience Research',
//         'Content Strategy',
//         'Content Creation',
//         'Distribution',
//         'Performance Analysis',
//       ],
//       metricOne: '3x',
//       metricOneLabel: 'MORE ENGAGEMENT',
//       metricTwo: '65%',
//       metricTwoLabel: 'AUDIENCE GROWTH',
//       metricThree: '4.5x',
//       metricThreeLabel: 'CONTENT IMPACT',
//       resultTitle: 'Turning Content Into Business Value',
//       resultDescription:
//           'Every piece of content is designed around a clear business objective, from awareness and engagement to qualified leads and conversions.',
//     ),

//     // =========================================================
//     // 02 SOCIAL MEDIA MANAGEMENT
//     // =========================================================
//     SkillDetailModel(
//       title: 'Social Media Management',
//       icon: Icons.share_rounded,
//       subtitle: 'Build A Stronger Social Presence',
//       description:
//           'Create and manage social media strategies that improve brand visibility, audience engagement and long-term community growth.',
//       image: defaultImage,
//       services: [
//         'Social Media Strategy',
//         'Content Calendars',
//         'Community Management',
//         'Campaign Management',
//         'Performance Reporting',
//       ],
//       process: [
//         'Account Audit',
//         'Audience Research',
//         'Content Planning',
//         'Publishing',
//         'Optimization',
//       ],
//       metricOne: '72%',
//       metricOneLabel: 'MORE ENGAGEMENT',
//       metricTwo: '2.8x',
//       metricTwoLabel: 'REACH GROWTH',
//       metricThree: '90%',
//       metricThreeLabel: 'CONSISTENCY',
//       resultTitle: 'Social Media That Works',
//       resultDescription:
//           'Move beyond random posting with a structured social strategy focused on audience, content quality, engagement and measurable growth.',
//     ),

//     // =========================================================
//     // 03 CONVERSION OPTIMIZATION
//     // =========================================================
//     SkillDetailModel(
//       title: 'Conversion Optimization',
//       icon: Icons.swap_vert_rounded,
//       subtitle: 'Turn More Visitors Into Customers',
//       description:
//           'Optimize landing pages, funnels and customer journeys to remove friction and increase the percentage of visitors who take meaningful action.',
//       image: defaultImage,
//       services: [
//         'Landing Page Optimization',
//         'Conversion Audits',
//         'CTA Optimization',
//         'Funnel Analysis',
//         'A/B Testing',
//       ],
//       process: [
//         'Data Collection',
//         'Conversion Audit',
//         'Identify Friction',
//         'Test Improvements',
//         'Measure Results',
//       ],
//       metricOne: '48%',
//       metricOneLabel: 'MORE CONVERSIONS',
//       metricTwo: '31%',
//       metricTwoLabel: 'LOWER DROP-OFF',
//       metricThree: '2.6x',
//       metricThreeLabel: 'FUNNEL IMPACT',
//       resultTitle: 'More Results From Existing Traffic',
//       resultDescription:
//           'Conversion optimization focuses on getting better results from the traffic, leads and opportunities you already have.',
//     ),

//     // =========================================================
//     // 04 DIGITAL STRATEGY
//     // =========================================================
//     SkillDetailModel(
//       title: 'Digital Strategy',
//       icon: Icons.insights_rounded,
//       subtitle: 'A Clear Digital Roadmap For Growth',
//       description:
//           'Build a complete digital strategy connecting brand, marketing, technology, content and customer acquisition around measurable business objectives.',
//       image: defaultImage,
//       services: [
//         'Digital Strategy',
//         'Growth Planning',
//         'Channel Strategy',
//         'Customer Journey',
//         'Performance Planning',
//       ],
//       process: [
//         'Business Analysis',
//         'Market Research',
//         'Strategy Development',
//         'Execution Planning',
//         'Performance Review',
//       ],
//       metricOne: '360°',
//       metricOneLabel: 'STRATEGY VIEW',
//       metricTwo: '4.2x',
//       metricTwoLabel: 'IMPACT',
//       metricThree: '85%',
//       metricThreeLabel: 'CLARITY',
//       resultTitle: 'Strategy Before Execution',
//       resultDescription:
//           'A strong digital presence starts with a clear direction. Every channel should contribute to a larger business goal.',
//     ),

//     // =========================================================
//     // 05 GOOGLE ADS
//     // =========================================================
//     SkillDetailModel(
//       title: 'Google Ads',
//       icon: Icons.ads_click_rounded,
//       subtitle: 'Capture High-Intent Customers',
//       description:
//           'Create targeted Google Ads campaigns designed to reach people actively searching for products, services and solutions.',
//       image: defaultImage,
//       services: [
//         'Search Campaigns',
//         'Display Campaigns',
//         'Keyword Strategy',
//         'Ad Optimization',
//         'Conversion Tracking',
//       ],
//       process: [
//         'Keyword Research',
//         'Campaign Structure',
//         'Ad Creation',
//         'Tracking Setup',
//         'Optimization',
//       ],
//       metricOne: '4.2x',
//       metricOneLabel: 'ROAS',
//       metricTwo: '32%',
//       metricTwoLabel: 'LOWER CPA',
//       metricThree: '68%',
//       metricThreeLabel: 'MORE LEADS',
//       resultTitle: 'Performance Marketing With Purpose',
//       resultDescription:
//           'Campaigns are continuously monitored and optimized around clicks, qualified traffic, conversions and return on advertising spend.',
//     ),

//     // =========================================================
//     // 06 GOOGLE ANALYTICS
//     // =========================================================
//     SkillDetailModel(
//       title: 'Google Analytics',
//       icon: Icons.analytics_rounded,
//       subtitle: 'Turn Data Into Better Decisions',
//       description:
//           'Use analytics and performance data to understand customer behavior, identify opportunities and make smarter marketing decisions.',
//       image: defaultImage,
//       services: [
//         'Analytics Setup',
//         'Event Tracking',
//         'Conversion Tracking',
//         'Traffic Analysis',
//         'Performance Reports',
//       ],
//       process: [
//         'Tracking Audit',
//         'Measurement Planning',
//         'Implementation',
//         'Data Analysis',
//         'Optimization',
//       ],
//       metricOne: '100%',
//       metricOneLabel: 'TRACKING',
//       metricTwo: '3x',
//       metricTwoLabel: 'BETTER INSIGHTS',
//       metricThree: '40%',
//       metricThreeLabel: 'FASTER DECISIONS',
//       resultTitle: 'Data You Can Actually Use',
//       resultDescription:
//           'Analytics should not simply produce reports. It should help identify what is working, what is failing and what should happen next.',
//     ),

//     // =========================================================
//     // 07 EMAIL MARKETING
//     // =========================================================
//     SkillDetailModel(
//       title: 'Email Marketing',
//       icon: Icons.email_rounded,
//       subtitle: 'Build Relationships That Convert',
//       description:
//           'Create targeted email campaigns that nurture prospects, retain customers and generate repeat business.',
//       image: defaultImage,
//       services: [
//         'Email Strategy',
//         'Campaign Creation',
//         'Email Automation',
//         'Lead Nurturing',
//         'Performance Analysis',
//       ],
//       process: [
//         'Audience Segmentation',
//         'Campaign Planning',
//         'Content Creation',
//         'Automation',
//         'Optimization',
//       ],
//       metricOne: '38%',
//       metricOneLabel: 'OPEN RATE',
//       metricTwo: '4.1x',
//       metricTwoLabel: 'CAMPAIGN ROI',
//       metricThree: '52%',
//       metricThreeLabel: 'MORE CLICKS',
//       resultTitle: 'The Right Message At The Right Time',
//       resultDescription:
//           'Email marketing becomes more powerful when communication is personalized around customer needs, behavior and journey stage.',
//     ),

//     // =========================================================
//     // 08 MARKETING AUTOMATION
//     // =========================================================
//     SkillDetailModel(
//       title: 'Marketing Automation',
//       icon: Icons.autorenew_rounded,
//       subtitle: 'Automate Growth Without Losing The Human Touch',
//       description:
//           'Design automated marketing journeys that capture, nurture and convert prospects while reducing repetitive manual work.',
//       image: defaultImage,
//       services: [
//         'Marketing Automation',
//         'Lead Nurturing',
//         'Automated Campaigns',
//         'Customer Journeys',
//         'Workflow Design',
//       ],
//       process: [
//         'Journey Mapping',
//         'Automation Planning',
//         'Workflow Setup',
//         'Testing',
//         'Optimization',
//       ],
//       metricOne: '60%',
//       metricOneLabel: 'LESS MANUAL WORK',
//       metricTwo: '3.5x',
//       metricTwoLabel: 'MORE EFFICIENCY',
//       metricThree: '24/7',
//       metricThreeLabel: 'AUTOMATION',
//       resultTitle: 'Systems That Keep Working',
//       resultDescription:
//           'Well-designed automation allows businesses to respond faster and maintain consistent communication throughout the customer journey.',
//     ),

//     // =========================================================
//     // 09 CUSTOMER ACQUISITION
//     // =========================================================
//     SkillDetailModel(
//       title: 'Customer Acquisition',
//       icon: Icons.person_add_alt_1_rounded,
//       subtitle: 'Build A Predictable Customer Pipeline',
//       description:
//           'Develop acquisition strategies that attract qualified prospects and move them through a structured path toward becoming customers.',
//       image: defaultImage,
//       services: [
//         'Acquisition Strategy',
//         'Lead Generation',
//         'Paid Advertising',
//         'Landing Pages',
//         'Funnel Development',
//       ],
//       process: [
//         'Audience Definition',
//         'Channel Selection',
//         'Campaign Launch',
//         'Lead Capture',
//         'Optimization',
//       ],
//       metricOne: '68%',
//       metricOneLabel: 'MORE LEADS',
//       metricTwo: '35%',
//       metricTwoLabel: 'LOWER CPA',
//       metricThree: '3.8x',
//       metricThreeLabel: 'ACQUISITION ROI',
//       resultTitle: 'From Attention To Customers',
//       resultDescription:
//           'Customer acquisition combines the right audience, message, channel and conversion experience into one connected growth system.',
//     ),

//     // =========================================================
//     // 10 CUSTOMER RETENTION
//     // =========================================================
//     SkillDetailModel(
//       title: 'Customer Retention',
//       icon: Icons.loyalty_rounded,
//       subtitle: 'Turn Customers Into Long-Term Relationships',
//       description:
//           'Build retention strategies that increase customer satisfaction, repeat purchases and long-term customer value.',
//       image: defaultImage,
//       services: [
//         'Retention Strategy',
//         'Customer Engagement',
//         'Loyalty Programs',
//         'Email Retention',
//         'Customer Journey',
//       ],
//       process: [
//         'Customer Analysis',
//         'Retention Audit',
//         'Engagement Strategy',
//         'Implementation',
//         'Measurement',
//       ],
//       metricOne: '42%',
//       metricOneLabel: 'MORE RETENTION',
//       metricTwo: '2.7x',
//       metricTwoLabel: 'CUSTOMER VALUE',
//       metricThree: '35%',
//       metricThreeLabel: 'MORE REPEAT SALES',
//       resultTitle: 'Growth Beyond The First Sale',
//       resultDescription:
//           'Sustainable businesses do not only acquire customers. They create experiences that give customers reasons to stay.',
//     ),

//     // =========================================================
//     // 11 MARKET RESEARCH
//     // =========================================================
//     SkillDetailModel(
//       title: 'Market Research',
//       icon: Icons.manage_search_rounded,
//       subtitle: 'Understand The Market Before You Move',
//       description:
//           'Research markets, competitors and customer behavior to uncover opportunities and support stronger business decisions.',
//       image: defaultImage,
//       services: [
//         'Market Analysis',
//         'Competitor Research',
//         'Customer Research',
//         'Trend Analysis',
//         'Opportunity Mapping',
//       ],
//       process: [
//         'Research Planning',
//         'Data Collection',
//         'Market Analysis',
//         'Insight Development',
//         'Strategy Recommendations',
//       ],
//       metricOne: '360°',
//       metricOneLabel: 'MARKET VIEW',
//       metricTwo: '90%',
//       metricTwoLabel: 'INSIGHT CLARITY',
//       metricThree: '3x',
//       metricThreeLabel: 'BETTER PLANNING',
//       resultTitle: 'Decisions Based On Evidence',
//       resultDescription:
//           'Market research provides the information required to understand where the opportunity is and how a brand can compete effectively.',
//     ),

//     // =========================================================
//     // 12 BRAND STRATEGY
//     // =========================================================
//     SkillDetailModel(
//       title: 'Brand Strategy',
//       icon: Icons.auto_awesome_rounded,
//       subtitle: 'Build A Brand People Remember',
//       description:
//           'Create clear positioning, messaging and identity systems that make brands easier to understand, recognize and remember.',
//       image: defaultImage,
//       services: [
//         'Brand Positioning',
//         'Brand Messaging',
//         'Brand Identity',
//         'Audience Strategy',
//         'Brand Architecture',
//       ],
//       process: [
//         'Brand Discovery',
//         'Audience Research',
//         'Positioning',
//         'Messaging',
//         'Brand Activation',
//       ],
//       metricOne: '86%',
//       metricOneLabel: 'BRAND GROWTH',
//       metricTwo: '4.2x',
//       metricTwoLabel: 'BRAND IMPACT',
//       metricThree: '92%',
//       metricThreeLabel: 'CLARITY',
//       resultTitle: 'From Business To Brand',
//       resultDescription:
//           'A strong brand creates a clear connection between what a business offers and why customers should choose it.',
//     ),

//     // =========================================================
//     // 13 GROWTH STRATEGY
//     // =========================================================
//     SkillDetailModel(
//       title: 'Growth Strategy',
//       icon: Icons.rocket_launch_rounded,
//       subtitle: 'Create A Roadmap For Sustainable Growth',
//       description:
//           'Identify growth opportunities and create practical strategies that connect marketing, sales, customer experience and business development.',
//       image: defaultImage,
//       services: [
//         'Growth Planning',
//         'Channel Strategy',
//         'Market Expansion',
//         'Customer Growth',
//         'Revenue Strategy',
//       ],
//       process: [
//         'Business Audit',
//         'Growth Analysis',
//         'Opportunity Mapping',
//         'Strategy Development',
//         'Execution',
//       ],
//       metricOne: '2.8x',
//       metricOneLabel: 'GROWTH POTENTIAL',
//       metricTwo: '45%',
//       metricTwoLabel: 'MORE OPPORTUNITIES',
//       metricThree: '360°',
//       metricThreeLabel: 'BUSINESS VIEW',
//       resultTitle: 'Growth With Direction',
//       resultDescription:
//           'Growth strategy focuses on finding the highest-value opportunities and turning them into a practical roadmap.',
//     ),

//     // =========================================================
//     // 14 E-COMMERCE MARKETING
//     // =========================================================
//     SkillDetailModel(
//       title: 'E-Commerce Marketing',
//       icon: Icons.shopping_cart_rounded,
//       subtitle: 'Grow Online Stores With Performance Marketing',
//       description:
//           'Develop e-commerce marketing strategies designed to increase qualified traffic, product discovery, conversions and repeat purchases.',
//       image: defaultImage,
//       services: [
//         'E-Commerce Strategy',
//         'Product Campaigns',
//         'Paid Advertising',
//         'Conversion Optimization',
//         'Retention Marketing',
//       ],
//       process: [
//         'Store Audit',
//         'Product Analysis',
//         'Campaign Strategy',
//         'Conversion Optimization',
//         'Performance Scaling',
//       ],
//       metricOne: '4.5x',
//       metricOneLabel: 'ROAS',
//       metricTwo: '52%',
//       metricTwoLabel: 'MORE SALES',
//       metricThree: '31%',
//       metricThreeLabel: 'LOWER CPA',
//       resultTitle: 'More Than Just Traffic',
//       resultDescription:
//           'E-commerce marketing connects product, audience, advertising and conversion experience to generate measurable commercial growth.',
//     ),

//     // =========================================================
//     // 15 CAMPAIGN MANAGEMENT
//     // =========================================================
//     SkillDetailModel(
//       title: 'Campaign Management',
//       icon: Icons.campaign_rounded,
//       subtitle: 'Plan, Launch & Optimize Powerful Campaigns',
//       description:
//           'Manage marketing campaigns from strategy and creative direction through execution, tracking and optimization.',
//       image: defaultImage,
//       services: [
//         'Campaign Planning',
//         'Campaign Execution',
//         'Media Planning',
//         'Performance Tracking',
//         'Campaign Optimization',
//       ],
//       process: [
//         'Campaign Brief',
//         'Strategy',
//         'Execution',
//         'Monitoring',
//         'Optimization',
//       ],
//       metricOne: '3.6x',
//       metricOneLabel: 'CAMPAIGN ROI',
//       metricTwo: '64%',
//       metricTwoLabel: 'MORE REACH',
//       metricThree: '40%',
//       metricThreeLabel: 'MORE LEADS',
//       resultTitle: 'Campaigns Built Around Results',
//       resultDescription:
//           'Every campaign should have a clear objective, measurable KPIs and a continuous optimization process.',
//     ),

//     // =========================================================
//     // 16 MARKETING ANALYTICS
//     // =========================================================
//     SkillDetailModel(
//       title: 'Marketing Analytics',
//       icon: Icons.bar_chart_rounded,
//       subtitle: 'Measure What Matters',
//       description:
//           'Connect marketing activities with measurable business outcomes through reporting, performance analysis and actionable insights.',
//       image: defaultImage,
//       services: [
//         'Marketing Dashboards',
//         'KPI Tracking',
//         'Campaign Analysis',
//         'ROI Analysis',
//         'Performance Reporting',
//       ],
//       process: [
//         'KPI Definition',
//         'Data Collection',
//         'Dashboard Setup',
//         'Analysis',
//         'Optimization',
//       ],
//       metricOne: '100%',
//       metricOneLabel: 'KPI VISIBILITY',
//       metricTwo: '3x',
//       metricTwoLabel: 'FASTER INSIGHTS',
//       metricThree: '4.1x',
//       metricThreeLabel: 'ROI VISIBILITY',
//       resultTitle: 'Marketing You Can Measure',
//       resultDescription:
//           'Marketing analytics turns campaign data into insights that help teams understand performance and improve future decisions.',
//     ),

//     // =========================================================
//     // 17 SALES STRATEGY
//     // =========================================================
//     SkillDetailModel(
//       title: 'Sales Strategy',
//       icon: Icons.point_of_sale_rounded,
//       subtitle: 'Turn Opportunities Into Revenue',
//       description:
//           'Develop practical sales strategies that improve prospect qualification, sales processes and revenue opportunities.',
//       image: defaultImage,
//       services: [
//         'Sales Planning',
//         'Lead Qualification',
//         'Sales Funnel',
//         'Pipeline Strategy',
//         'Sales Optimization',
//       ],
//       process: [
//         'Sales Audit',
//         'Pipeline Analysis',
//         'Strategy Development',
//         'Implementation',
//         'Performance Review',
//       ],
//       metricOne: '42%',
//       metricOneLabel: 'MORE OPPORTUNITIES',
//       metricTwo: '2.9x',
//       metricTwoLabel: 'PIPELINE VALUE',
//       metricThree: '35%',
//       metricThreeLabel: 'FASTER SALES',
//       resultTitle: 'A Better Path From Lead To Sale',
//       resultDescription:
//           'A strong sales strategy creates a structured journey from initial interest to qualified opportunity and final conversion.',
//     ),

//     // =========================================================
//     // 18 TRAINING & WORKSHOPS
//     // =========================================================
//     SkillDetailModel(
//       title: 'Training & Workshops',
//       icon: Icons.co_present_rounded,
//       subtitle: 'Practical Knowledge That Teams Can Apply',
//       description:
//           'Deliver practical training and workshops that help teams understand modern marketing, digital tools, strategy and performance measurement.',
//       image: defaultImage,
//       services: [
//         'Digital Marketing Training',
//         'Team Workshops',
//         'Performance Marketing',
//         'Retail Marketing',
//         'Strategy Training',
//       ],
//       process: [
//         'Training Assessment',
//         'Curriculum Planning',
//         'Interactive Training',
//         'Practical Exercises',
//         'Performance Review',
//       ],
//       metricOne: '250+',
//       metricOneLabel: 'PROJECTS',
//       metricTwo: '15+',
//       metricTwoLabel: 'YEARS',
//       metricThree: '100%',
//       metricThreeLabel: 'PRACTICAL',
//       resultTitle: 'Learning Through Practice',
//       resultDescription:
//           'Training is designed around real-world scenarios, practical exercises and strategies that participants can apply directly to their work.',
//     ),

//     // =========================================================
//     // 19 RETAIL MARKETING
//     // =========================================================
//     SkillDetailModel(
//       title: 'Retail Marketing',
//       icon: Icons.storefront_rounded,
//       subtitle: 'Connect Brands With Customers At Retail',
//       description:
//           'Develop retail-focused marketing and merchandising strategies that improve visibility, execution and customer experience.',
//       image: defaultImage,
//       services: [
//         'Retail Strategy',
//         'Visual Merchandising',
//         'Retail Execution',
//         'Shopper Marketing',
//         'Trade Marketing',
//       ],
//       process: [
//         'Retail Audit',
//         'Shopper Analysis',
//         'Strategy',
//         'Execution',
//         'Performance Review',
//       ],
//       metricOne: '32%',
//       metricOneLabel: 'MORE VISIBILITY',
//       metricTwo: '4.2x',
//       metricTwoLabel: 'RETAIL IMPACT',
//       metricThree: '28%',
//       metricThreeLabel: 'MORE ENGAGEMENT',
//       resultTitle: 'Better Brands At The Point Of Sale',
//       resultDescription:
//           'Retail marketing connects brand strategy with the physical customer experience where purchase decisions actually happen.',
//     ),

//     // =========================================================
//     // 20 BUSINESS DEVELOPMENT
//     // =========================================================
//     SkillDetailModel(
//       title: 'Business Development',
//       icon: Icons.business_rounded,
//       subtitle: 'Create New Business Opportunities',
//       description:
//           'Identify partnerships, markets, clients and strategic opportunities that can contribute to sustainable business growth.',
//       image: defaultImage,
//       services: [
//         'Business Strategy',
//         'Partnership Development',
//         'Market Expansion',
//         'Client Acquisition',
//         'Opportunity Analysis',
//       ],
//       process: [
//         'Opportunity Research',
//         'Market Analysis',
//         'Prospecting',
//         'Relationship Building',
//         'Deal Development',
//       ],
//       metricOne: '45%',
//       metricOneLabel: 'MORE OPPORTUNITIES',
//       metricTwo: '3.2x',
//       metricTwoLabel: 'PIPELINE GROWTH',
//       metricThree: '82%',
//       metricThreeLabel: 'CLIENT RETENTION',
//       resultTitle: 'Building Opportunities That Matter',
//       resultDescription:
//           'Business development focuses on creating meaningful relationships and identifying opportunities that can produce long-term commercial value.',
//     ),
//   ];

//   static SkillDetailModel? find(String title) {
//     for (final skill in all) {
//       if (skill.title.toLowerCase() == title.toLowerCase()) {
//         return skill;
//       }
//     }

//     return null;
//   }
// }
