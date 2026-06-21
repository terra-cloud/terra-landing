import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class HeroSection extends StatelessComponent {
  const HeroSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'hero', id: 'about', [
      div(classes: 'hero-container', [
        div(classes: 'hero-content', [
          h1(classes: 'hero-title', [
            Component.text('Architecting '),
            span(classes: 'typed-text', []),
            span(classes: 'typed-cursor', [Component.text('|')]),
            Component.text(' Software'),
          ]),
          p(classes: 'hero-subtitle', [
            Component.text(
              'We turn complex visions into robust digital realities. Specializing in Web3, DeFi, cross-platform mobile apps, blockchain, SaaS, and digital marketplaces.',
            ),
          ]),
          div(classes: 'hero-actions', [
            a(classes: 'btn btn-primary', href: '#contact', [Component.text('Start Your Project')]),
            a(classes: 'btn btn-secondary', href: '#services', [Component.text('Explore Services')]),
          ]),
          div(classes: 'hero-sec-banner', [
            i(classes: 'sec-icon', attributes: {'data-lucide': 'shield-check'}, []),
            span([
              strong([Component.text('SEC Registered: ')]),
              Component.text('Terra.Ph Technologies Inc. (№ 2023100123109-10)'),
            ]),
          ]),
        ]),
        div(classes: 'blob-wrapper', [
          div(id: 'blob-canvas-container', []),
          // Floating Card Left
          div(classes: 'floating-card float-left', id: 'card-stats-projects', [
            div(classes: 'floating-card-header', [
              span([Component.text('Web3 & DeFi')]),
              div(classes: 'arrow-circle', [
                i(attributes: {'data-lucide': 'arrow-up-right'}, []),
              ]),
            ]),
            div(classes: 'floating-card-body', [
              span(classes: 'stat-number', [Component.text('46+')]),
              span(classes: 'stat-label', [Component.text('Deployments Launched')]),
            ]),
          ]),
          // Floating Card Right
          div(classes: 'floating-card float-right', id: 'card-stats-success', [
            div(classes: 'floating-card-header', [
              span([Component.text('Success Rate')]),
              div(classes: 'arrow-circle', [
                i(attributes: {'data-lucide': 'arrow-up-right'}, []),
              ]),
            ]),
            div(classes: 'floating-card-body', [
              span(classes: 'stat-number', id: 'success-percent', [Component.text('96%')]),
              div(classes: 'progress-bar-container', [
                div(
                  classes: 'progress-bar-fill',
                  styles: Styles(width: 96.percent),
                  [],
                ),
              ]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }
}
