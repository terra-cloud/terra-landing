import 'package:jaspr/jaspr.dart';

import 'components/navbar.dart';
import 'components/hero.dart';
import 'components/services.dart';
import 'components/process.dart';
import 'components/testimonials.dart';
import 'components/cta.dart';
import 'components/footer.dart';

// The main component of your application.
// Annotated with @client so it is compiled to client-side javascript hydration.
@client
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return Component.fragment([
      Component.element(tag: 'canvas', id: 'stars-canvas'),
      const Navbar(),
      Component.element(tag: 'main', children: [
        const HeroSection(),
        const ServicesSection(),
        const ProcessSection(),
        const TestimonialsSection(),
        const CtaSection(),
      ]),
      const Footer(),
    ]);
  }
}
