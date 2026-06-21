import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class TestimonialsSection extends StatelessComponent {
  const TestimonialsSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'testimonials', id: 'testimonials', [
      div(classes: 'container', [
        div(classes: 'section-header reveal', [
          span(classes: 'section-tagline', [Component.text('Reviews')]),
          h2(classes: 'section-title', [Component.text('Client Success Stories')]),
          p(classes: 'section-desc', [
            Component.text('See what founders and enterprise product leaders say about working with Terra.Ph.'),
          ]),
        ]),

        div(classes: 'testimonial-deck-container reveal', [
          div(classes: 'testimonial-deck', id: 'testimonial-deck', [
            // Card 1
            div(classes: 'testimonial-card active', [
              div(classes: 'quote-icon-wrapper', [
                i(classes: 'quote-icon', attributes: {'data-lucide': 'quote'}, []),
              ]),
              p(classes: 'testimonial-quote', [
                Component.text(
                  '"Terra.Ph built our DeFi staking application from scratch. The smart contracts passed security audits with flying colors, and their team was incredibly professional throughout the launch."',
                ),
              ]),
              div(classes: 'testimonial-author', [
                div(classes: 'author-avatar', [
                  img(classes: 'author-img', src: 'images/alex_avatar.png', alt: 'Alex Gevero'),
                ]),
                div(classes: 'author-info', [
                  h4(classes: 'author-name', [Component.text('Alex Gevero')]),
                ]),
              ]),
            ]),

            // Card 2
            div(classes: 'testimonial-card', [
              div(classes: 'quote-icon-wrapper', [
                i(classes: 'quote-icon', attributes: {'data-lucide': 'quote'}, []),
              ]),
              p(classes: 'testimonial-quote', [
                Component.text(
                  '"Their mastery of cross-platform mobile development is exceptional. The React Native app they developed runs with native fluidness, allowing us to hit both iOS and Android in 3 months."',
                ),
              ]),
              div(classes: 'testimonial-author', [
                div(classes: 'author-avatar', [
                  img(classes: 'author-img', src: 'images/maria_avatar.png', alt: 'Maria Dela Cruz'),
                ]),
                div(classes: 'author-info', [
                  h4(classes: 'author-name', [Component.text('Maria Dela Cruz')]),
                ]),
              ]),
            ]),

            // Card 3
            div(classes: 'testimonial-card', [
              div(classes: 'quote-icon-wrapper', [
                i(classes: 'quote-icon', attributes: {'data-lucide': 'quote'}, []),
              ]),
              p(classes: 'testimonial-quote', [
                Component.text(
                  '"Implementing our B2B SaaS analytics architecture was a massive undertaking. Terra.Ph delivered a scalable, secure, and beautiful platform that our enterprise clients love."',
                ),
              ]),
              div(classes: 'testimonial-author', [
                div(classes: 'author-avatar', [
                  img(classes: 'author-img', src: 'images/justin_avatar.png', alt: 'Justin Tan'),
                ]),
                div(classes: 'author-info', [
                  h4(classes: 'author-name', [Component.text('Justin Tan')]),
                ]),
              ]),
            ]),
          ]),

          // Controls
          div(classes: 'testimonial-controls', [
            button(
              classes: 'deck-btn',
              id: 'deck-prev',
              attributes: {'aria-label': 'Previous Testimonial'},
              [
                i(attributes: {'data-lucide': 'chevron-left'}, []),
              ],
            ),
            button(
              classes: 'deck-btn',
              id: 'deck-next',
              attributes: {'aria-label': 'Next Testimonial'},
              [
                i(attributes: {'data-lucide': 'chevron-right'}, []),
              ],
            ),
          ]),
        ]),
      ]),
    ]);
  }
}
