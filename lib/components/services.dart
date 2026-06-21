import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class ServicesSection extends StatelessComponent {
  const ServicesSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'services', id: 'services', [
      div(classes: 'container', [
        div(classes: 'section-header reveal', [
          span(classes: 'section-tagline', [Component.text('Capabilities')]),
          h2(classes: 'section-title', [Component.text('Our Development Expertise')]),
          p(classes: 'section-desc', [
            Component.text(
              'We build enterprise-grade software with modern stacks, focusing on security, performance, and scalability.',
            ),
          ]),
        ]),

        div(classes: 'services-grid', [
          // Service Card 1: Web3 & DeFi
          div(classes: 'service-card reveal', [
            div(classes: 'service-icon-wrapper', [
              i(classes: 'service-icon', attributes: {'data-lucide': 'cpu'}, []),
            ]),
            h3(classes: 'service-card-title', [Component.text('Web3 & DeFi Platforms')]),
            p(classes: 'service-card-desc', [
              Component.text(
                'Decentralized protocols, secure smart contracts (Solidity/Rust), blockchain integrations, tokenomics architecture, and high-performance Web3 frontends.',
              ),
            ]),
            div(classes: 'mockup-tilt-wrapper', [
              div(classes: 'mockup-card contract-mockup', [
                div(classes: 'mockup-header', [
                  span(classes: 'dot', []),
                  span(classes: 'dot', []),
                  span(classes: 'dot', []),
                  span(classes: 'mockup-title', [Component.text('SmartContract.sol')]),
                ]),
                div(classes: 'mockup-code', [
                  span(classes: 'code-keyword', [Component.text('contract ')]),
                  span(classes: 'code-name', [Component.text('TerraDeFi ')]),
                  Component.text('{'),
                  br(),
                  RawText('&nbsp;&nbsp;'),
                  span(classes: 'code-keyword', [Component.text('mapping')]),
                  Component.text('(address => uint) '),
                  span(classes: 'code-keyword', [Component.text('public ')]),
                  Component.text('balances;'),
                  br(),
                  RawText('&nbsp;&nbsp;'),
                  span(classes: 'code-keyword', [Component.text('function ')]),
                  span(classes: 'code-name', [Component.text('stake')]),
                  Component.text('() '),
                  span(classes: 'code-keyword', [Component.text('external payable ')]),
                  Component.text('{'),
                  br(),
                  RawText('&nbsp;&nbsp;&nbsp;&nbsp;balances[msg.sender] += msg.value;'),
                  br(),
                  RawText('&nbsp;&nbsp;&nbsp;&nbsp;'),
                  span(classes: 'code-keyword', [Component.text('emit ')]),
                  span(classes: 'code-name', [Component.text('Staked')]),
                  Component.text('(msg.sender, msg.value);'),
                  br(),
                  RawText('&nbsp;&nbsp;}'),
                  br(),
                  Component.text('}'),
                ]),
              ]),
            ]),
          ]),

          // Service Card 2: SaaS & Marketplaces
          div(classes: 'service-card reveal', [
            div(classes: 'service-icon-wrapper', [
              i([], classes: 'service-icon', attributes: {'data-lucide': 'layers'}),
            ]),
            h3(classes: 'service-card-title', [Component.text('SaaS & Marketplaces')]),
            p(classes: 'service-card-desc', [
              Component.text(
                'Multi-tenant cloud platforms, e-commerce engines, peer-to-peer marketplaces, robust API integrations, and secure billing subscriptions.',
              ),
            ]),
            div(classes: 'mockup-tilt-wrapper', [
              div(classes: 'mockup-card saas-mockup', [
                div(classes: 'mockup-header', [
                  span(classes: 'dot', []),
                  span(classes: 'dot', []),
                  span(classes: 'dot', []),
                  span(classes: 'mockup-title', [Component.text('Dashboard.tsx')]),
                ]),
                div(classes: 'saas-metrics', [
                  div(classes: 'saas-metric-item', [
                    span(classes: 'metric-lbl', [Component.text('MRR Growth')]),
                    span(classes: 'metric-val text-green', [Component.text('+24.8%')]),
                  ]),
                  div(classes: 'saas-metric-item', [
                    span(classes: 'metric-lbl', [Component.text('API Uptime')]),
                    span(classes: 'metric-val text-blue', [Component.text('99.99%')]),
                  ]),
                ]),
                div(classes: 'saas-chart', [
                  div(
                    classes: 'bar',
                    styles: Styles(height: 40.percent),
                    [],
                  ),
                  div(
                    classes: 'bar',
                    styles: Styles(height: 60.percent),
                    [],
                  ),
                  div(
                    classes: 'bar',
                    styles: Styles(height: 50.percent),
                    [],
                  ),
                  div(
                    classes: 'bar',
                    styles: Styles(height: 85.percent),
                    [],
                  ),
                  div(
                    classes: 'bar',
                    styles: Styles(height: 70.percent),
                    [],
                  ),
                  div(
                    classes: 'bar',
                    styles: Styles(height: 95.percent),
                    [],
                  ),
                ]),
              ]),
            ]),
          ]),

          // Service Card 3: Mobile Apps
          div(classes: 'service-card reveal', [
            div(classes: 'service-icon-wrapper', [
              i([], classes: 'service-icon', attributes: {'data-lucide': 'smartphone'}),
            ]),
            h3(classes: 'service-card-title', [Component.text('Mobile & Cross-Platform')]),
            p(classes: 'service-card-desc', [
              Component.text(
                'High-performance iOS & Android mobile apps built with React Native and Flutter, ensuring native feel with a single code base.',
              ),
            ]),
            div(classes: 'mockup-tilt-wrapper', [
              div(classes: 'mockup-card mobile-mockup', [
                div(classes: 'mobile-notch', []),
                div(classes: 'mobile-screen', [
                  div(classes: 'app-nav', [
                    i([], classes: 'app-icon', attributes: {'data-lucide': 'user'}),
                    span(classes: 'app-title', [Component.text('TerraApp')]),
                    i([], classes: 'app-icon', attributes: {'data-lucide': 'bell'}),
                  ]),
                  div(classes: 'app-balance-card', [
                    span(classes: 'app-bal-lbl', [Component.text('Available Balance')]),
                    span(classes: 'app-bal-val', [Component.text('₱142,500.00')]),
                  ]),
                  div(classes: 'app-quick-actions', [
                    div(classes: 'action-btn', []),
                    div(classes: 'action-btn', []),
                    div(classes: 'action-btn', []),
                  ]),
                ]),
              ]),
            ]),
          ]),

          // Service Card 4: AI Development & Integration
          div(classes: 'service-card reveal', [
            div(classes: 'service-icon-wrapper', [
              i([], classes: 'service-icon', attributes: {'data-lucide': 'brain'}),
            ]),
            h3(classes: 'service-card-title', [Component.text('AI & Machine Learning')]),
            p(classes: 'service-card-desc', [
              Component.text(
                'Intelligent agent orchestration, LLM integration, custom RAG (Retrieval-Augmented Generation) pipelines, predictive analytics, and natural language processing built into your web and mobile applications.',
              ),
            ]),
            div(classes: 'mockup-tilt-wrapper', [
              div(classes: 'mockup-card ai-mockup', [
                div(classes: 'mockup-header', [
                  span(classes: 'dot', []),
                  span(classes: 'dot', []),
                  span(classes: 'dot', []),
                  span(classes: 'mockup-title', [Component.text('Agent.py')]),
                ]),
                div(classes: 'mockup-code', [
                  span(classes: 'code-keyword', [Component.text('import ')]),
                  span(classes: 'code-name', [Component.text('google.generativeai ')]),
                  span(classes: 'code-keyword', [Component.text('as ')]),
                  span(classes: 'code-name', [Component.text('genai')]),
                  br(),
                  br(),
                  span(classes: 'code-comment', [Component.text('# Initialize Gemini Agent')]),
                  br(),
                  Component.text('model = genai.GenerativeModel('),
                  br(),
                  RawText('&nbsp;&nbsp;'),
                  span(classes: 'code-string', [Component.text('"gemini-2.5-flash"')]),
                  br(),
                  Component.text(')'),
                  br(),
                  Component.text('response = model.generate_content('),
                  br(),
                  RawText('&nbsp;&nbsp;'),
                  span(classes: 'code-string', [Component.text('"Analyze network state..."')]),
                  br(),
                  Component.text(')'),
                ]),
              ]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }
}
