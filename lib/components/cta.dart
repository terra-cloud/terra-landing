import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class CtaSection extends StatelessComponent {
  const CtaSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'cta-section', id: 'contact', [
      div(classes: 'container', [
        div(classes: 'cta-card reveal', [
          
          // Fly-in elements
          div(classes: 'fly-in-element fly-tl', id: 'fly-app', [
            div(classes: 'app-window', [
              div(classes: 'window-dot red', []),
              div(classes: 'window-dot yellow', []),
              div(classes: 'window-dot green', []),
              span(classes: 'window-title', [Component.text('App.tsx')]),
              div(classes: 'code-snippet', [Component.text("import { DeFi } from 'terra-sdk';")]),
            ]),
          ]),
          
          div(classes: 'fly-in-element fly-tr', id: 'fly-wallet', [
            div(classes: 'wallet-badge', [
              i([], classes: 'wallet-icon', attributes: {'data-lucide': 'wallet'}),
              div(classes: 'wallet-data', [
                span(classes: 'w-lbl', [Component.text('Connected Node')]),
                span(classes: 'w-val', [Component.text('mainnet.terra.ph')]),
              ]),
            ]),
          ]),

          div(classes: 'fly-in-element fly-bl', id: 'fly-success', [
            div(classes: 'badge-success', [
              i([], classes: 'success-icon', attributes: {'data-lucide': 'check-circle-2'}),
              span([Component.text('Audit Passed 100%')]),
            ]),
          ]),

          div(classes: 'fly-in-element fly-br', id: 'fly-chart', [
            div(classes: 'mini-chart-card', [
              div(classes: 'mini-chart-line', []),
              span(classes: 'chart-value', [Component.text('₱1.2M Vol')]),
            ]),
          ]),

          // Main Content
          div(classes: 'cta-content', [
            h2(classes: 'cta-title', [
              Component.text('Your Vision, Our Code.'), br(),
              Component.text("Let's Build the Future."),
            ]),
            p(classes: 'cta-desc', [
              Component.text('Whether you are building a DeFi protocol, a SaaS product, or a cross-platform mobile application—our engineers will deliver a world-class system.'),
            ]),

            form(classes: 'contact-form', id: 'contact-form', [
              div(classes: 'form-row', [
                input(
                  classes: 'form-input', 
                  type: InputType.text, 
                  attributes: {'required': 'true', 'name': 'name', 'id': 'name', 'placeholder': 'Your Name'}, 
                ),
                input(
                  classes: 'form-input', 
                  type: InputType.email, 
                  attributes: {'required': 'true', 'name': 'email', 'id': 'email', 'placeholder': 'Your Email'}, 
                ),
              ]),
              div(classes: 'form-row', [
                select(
                  classes: 'form-input', 
                  attributes: {'required': 'true', 'name': 'project_type', 'id': 'project_type'}, 
                  [
                    option(value: '', attributes: {'disabled': 'true', 'selected': 'true'}, [Component.text('Select Project Type')]),
                    option(value: 'web3', [Component.text('Web3 & DeFi')]),
                    option(value: 'mobile', [Component.text('Mobile App')]),
                    option(value: 'saas', [Component.text('SaaS / Cloud')]),
                    option(value: 'marketplace', [Component.text('E-Commerce / Marketplace')]),
                    option(value: 'blockchain', [Component.text('Blockchain / Custom Token')]),
                  ]
                ),
              ]),
              div(classes: 'form-row', [
                textarea(
                  classes: 'form-input form-textarea', 
                  placeholder: 'Describe your project...', 
                  attributes: {'required': 'true', 'name': 'message', 'id': 'message'}, 
                  []
                ),
              ]),
              button(classes: 'btn btn-primary btn-submit', type: ButtonType.submit, [
                span([Component.text('Send Message')]),
                i([], attributes: {'data-lucide': 'send'}),
              ]),
            ]),

            div(classes: 'success-message', id: 'form-success', [
              i([], classes: 'success-check-icon', attributes: {'data-lucide': 'check-circle'}),
              h3([Component.text('Thank You!')]),
              p([Component.text('Your message has been sent successfully. Our team will get back to you shortly.')]),
            ]),
          ]),

        ]),
      ]),
    ]);
  }
}
