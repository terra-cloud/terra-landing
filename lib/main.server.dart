/// The entrypoint for the **server** environment.
///
/// The [main] method will only be executed on the server during pre-rendering.
/// To run code on the client, check the `main.client.dart` file.
library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';

// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.server.options.dart';

void main() {
  // Initializes the server environment with the generated default options.
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  // Starts the app.
  runApp(
    Document(
      title: 'Terra.Ph Technologies Inc. | Next-Gen Software Development',
      meta: {
        'description':
            'Terra.Ph Technologies Inc. is an SEC-registered software development agency specializing in Web3, DeFi, mobile apps, blockchain, SaaS, e-commerce, and marketplaces.',
        'keywords':
            'web3, defi, mobile app development, blockchain, SaaS, e-commerce, marketplace, software agency, SEC registered',
      },
      head: [
        link(rel: 'icon', type: 'image/png', href: '/logo.png'),
        link(rel: 'preconnect', href: 'https://fonts.googleapis.com'),
        link(rel: 'preconnect', href: 'https://fonts.gstatic.com', attributes: {'crossorigin': 'anonymous'}),
        link(
          rel: 'stylesheet',
          href:
              'https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&family=Plus+Jakarta+Sans:wght@300;400;500;600;700&display=swap',
        ),
        link(rel: 'stylesheet', href: '/style.css'),
        Component.element(tag: 'style', children: [Component.text('.reveal { opacity: 0; }')]),
        script(src: 'https://unpkg.com/lucide@latest/dist/umd/lucide.min.js', defer: true),
        script(src: 'https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js', defer: true),
        script(src: '/script.js', defer: true),
      ],
      body: const App(),
    ),
  );
}
