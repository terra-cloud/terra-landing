import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return footer(classes: 'footer', [
      div(classes: 'container footer-container', [
        // Brand Column
        div(classes: 'footer-col footer-brand', [
          a(classes: 'brand', href: '#', [
            img(classes: 'brand-logo', src: 'logo.png', alt: 'Terra.Ph Logo'),
            span(classes: 'brand-name', [Component.text('Terra.Ph')]),
          ]),
          p(classes: 'footer-tagline', [
            Component.text('Architecting premium software solutions for modern enterprises and startups worldwide.'),
          ]),
          div(classes: 'social-links', [
            a(
              classes: 'social-link',
              href: '#',
              attributes: {'aria-label': 'LinkedIn'},
              [
                i(attributes: {'data-lucide': 'linkedin'}, []),
              ],
            ),
            a(
              classes: 'social-link',
              href: '#',
              attributes: {'aria-label': 'Twitter'},
              [
                i(attributes: {'data-lucide': 'twitter'}, []),
              ],
            ),
            a(
              classes: 'social-link',
              href: '#',
              attributes: {'aria-label': 'Github'},
              [
                i(attributes: {'data-lucide': 'github'}, []),
              ],
            ),
            a(
              classes: 'social-link',
              href: '#',
              attributes: {'aria-label': 'Facebook'},
              [
                i(attributes: {'data-lucide': 'facebook'}, []),
              ],
            ),
          ]),
        ]),

        // Services Column
        div(classes: 'footer-col', [
          h4(classes: 'footer-heading', [Component.text('Services')]),
          ul(classes: 'footer-links', [
            li([
              a(href: '#services', [Component.text('Web3 & DeFi Development')]),
            ]),
            li([
              a(href: '#services', [Component.text('Cross-Platform Mobile Apps')]),
            ]),
            li([
              a(href: '#services', [Component.text('Blockchain Solutions')]),
            ]),
            li([
              a(href: '#services', [Component.text('SaaS & Platform Engineering')]),
            ]),
            li([
              a(href: '#services', [Component.text('E-Commerce & Marketplaces')]),
            ]),
          ]),
        ]),

        // Company Column
        div(classes: 'footer-col', [
          h4(classes: 'footer-heading', [Component.text('Company')]),
          ul(classes: 'footer-links', [
            li([
              a(href: '#about', [Component.text('About Us')]),
            ]),
            li([
              a(href: '#process', [Component.text('Our Process')]),
            ]),
            li([
              a(href: '#testimonials', [Component.text('Success Stories')]),
            ]),
            li([
              a(href: '#contact', [Component.text('Work With Us')]),
            ]),
          ]),
        ]),

        // SEC registration column
        div(classes: 'footer-col footer-sec', [
          h4(classes: 'footer-heading', [Component.text('Government Registration')]),
          div(classes: 'sec-details-card', [
            div(classes: 'sec-status', [
              span(classes: 'sec-status-dot', []),
              span([Component.text('SEC Registered Status')]),
            ]),
            ul(classes: 'sec-info-list', [
              li([
                span(classes: 'lbl', [Component.text('Entity Name:')]),
                span(classes: 'val', [Component.text('Terra.Ph Technologies Inc.')]),
              ]),
              li([
                span(classes: 'lbl', [Component.text('SEC Number:')]),
                span(classes: 'val', [Component.text('2023100123109-10')]),
              ]),
              li([
                span(classes: 'lbl', [Component.text('Date Registered:')]),
                span(classes: 'val', [Component.text('October 31, 2023')]),
              ]),
            ]),
            a(
              classes: 'sec-verify-link',
              href: 'https://checkwithsec.sec.gov.ph/check-with-sec/index',
              attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
              [
                span([Component.text('Verify on SEC Portal')]),
                i([], attributes: {'data-lucide': 'external-link'}),
              ],
            ),
          ]),
        ]),
      ]),

      // Massive background watermark
      div(classes: 'footer-bg-text', [Component.text('TERRA')]),

      // Footer bottom
      div(classes: 'footer-bottom', [
        div(classes: 'container footer-bottom-container', [
          p(classes: 'copyright', [Component.text('© 2026 Terra.Ph Technologies Inc. All rights reserved.')]),
          p(classes: 'regulatory-disclaimer', [
            Component.text(
              'Disclaimer: Terra.Ph Technologies Inc. is a software development and technology service provider. We do not offer financial, investment, or banking services directly.',
            ),
          ]),
        ]),
      ]),
    ]);
  }
}
