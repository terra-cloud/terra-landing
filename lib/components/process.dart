import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class ProcessSection extends StatelessComponent {
  const ProcessSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'process', id: 'process', [
      div(classes: 'container', [
        div(classes: 'section-header reveal', [
          span(classes: 'section-tagline', [Component.text('Workflow')]),
          h2(classes: 'section-title', [Component.text('Our Development Process')]),
          p(classes: 'section-desc', [
            Component.text('How we translate your requirements into secure, launch-ready software.'),
          ]),
        ]),

        div(classes: 'process-timeline', [
          // Step 1
          div(classes: 'process-item reveal', [
            div(classes: 'process-num', [Component.text('01')]),
            div(classes: 'process-card', [
              h3(classes: 'process-card-title', [Component.text('Discovery & Architecture')]),
              p(classes: 'process-card-desc', [
                Component.text(
                  'We align on product objectives, define the scope, map out the systems architecture, and draft the technical specifications.',
                ),
              ]),
            ]),
          ]),

          // Step 2
          div(classes: 'process-item reveal', [
            div(classes: 'process-num', [Component.text('02')]),
            div(classes: 'process-card', [
              h3(classes: 'process-card-title', [Component.text('Agile Development')]),
              p(classes: 'process-card-desc', [
                Component.text(
                  'Our expert engineers build the platform in iterative sprints, providing staging environments so you can see live progress.',
                ),
              ]),
            ]),
          ]),

          // Step 3
          div(classes: 'process-item reveal', [
            div(classes: 'process-num', [Component.text('03')]),
            div(classes: 'process-card', [
              h3(classes: 'process-card-title', [Component.text('Rigorous Testing & Auditing')]),
              p(classes: 'process-card-desc', [
                Component.text(
                  'We conduct automated unit tests, end-to-end integration tests, and smart contract security audits to ensure zero vulnerabilities.',
                ),
              ]),
            ]),
          ]),

          // Step 4
          div(classes: 'process-item reveal', [
            div(classes: 'process-num', [Component.text('04')]),
            div(classes: 'process-card', [
              h3(classes: 'process-card-title', [Component.text('Launch & Scale')]),
              p(classes: 'process-card-desc', [
                Component.text(
                  'We deploy the applications, monitor server performance, manage store listings, and support scaling infrastructure as you grow.',
                ),
              ]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }
}
