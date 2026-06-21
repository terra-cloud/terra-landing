import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class Navbar extends StatelessComponent {
  const Navbar({super.key});

  @override
  Component build(BuildContext context) {
    return Component.fragment([
      header(classes: 'navbar', [
        div(classes: 'nav-container', [
          a(classes: 'brand', href: '#', [
            img(classes: 'brand-logo', src: 'logo.png', alt: 'Terra.Ph Logo'),
            span(classes: 'brand-name', [Component.text('Terra.Ph')]),
          ]),
          div(classes: 'sec-badge', [
            span(classes: 'badge-dot', []),
            Component.text('SEC Registered'),
          ]),
          nav(classes: 'nav-menu', [
            a(classes: 'nav-link', href: '#about', [Component.text('About')]),
            a(classes: 'nav-link', href: '#services', [Component.text('Services')]),
            a(classes: 'nav-link', href: '#process', [Component.text('Process')]),
            a(classes: 'nav-link', href: '#testimonials', [Component.text('Testimonials')]),
          ]),
          div(classes: 'nav-actions', [
            a(classes: 'btn btn-nav', href: '#contact', [Component.text('Get a Quote')]),
          ]),
          button(
            classes: 'mobile-menu-toggle',
            id: 'mobile-toggle',
            attributes: {'aria-label': 'Toggle Navigation'},
            [
              i(attributes: {'data-lucide': 'menu'}, []),
            ],
          ),
        ]),
      ]),
      // Mobile Dropdown Menu
      div(classes: 'mobile-menu', id: 'mobile-menu', [
        nav(classes: 'mobile-nav-links', [
          a(classes: 'mobile-link', href: '#about', [Component.text('About')]),
          a(classes: 'mobile-link', href: '#services', [Component.text('Services')]),
          a(classes: 'mobile-link', href: '#process', [Component.text('Process')]),
          a(classes: 'mobile-link', href: '#testimonials', [Component.text('Testimonials')]),
          a(classes: 'mobile-link btn btn-cta-mobile', href: '#contact', [Component.text('Get a Quote')]),
        ]),
      ]),
    ]);
  }
}
