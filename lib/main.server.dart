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

const _siteUrl = 'https://terra-landing-page-7bac2.web.app';
const _siteName = 'Terra.Ph Technologies Inc.';
const _title = 'Terra.Ph Technologies Inc. | Next-Gen Software Development';
const _description =
    'Terra.Ph Technologies Inc. is a SEC-registered software development agency in the Philippines specializing in Web3, DeFi, blockchain, mobile apps, SaaS, e-commerce, and digital marketplaces. Build your next-gen software with us.';
const _ogImage = '$_siteUrl/images/og-preview.png';
const _twitterHandle = '@terraservicesph';

// JSON-LD structured data for rich search results
const _jsonLd = '''
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "name": "$_siteName",
  "alternateName": "Terra.Ph",
  "url": "$_siteUrl",
  "logo": "$_siteUrl/logo.png",
  "image": "$_ogImage",
  "description": "$_description",
  "email": "terraservices.ph@gmail.com",
  "foundingDate": "2023",
  "areaServed": "Worldwide",
  "serviceType": ["Web3 Development", "DeFi Platforms", "Mobile App Development", "Blockchain Solutions", "SaaS Development", "E-Commerce Development"],
  "knowsAbout": ["Web3", "DeFi", "Blockchain", "Solidity", "Flutter", "React Native", "SaaS", "E-Commerce"],
  "address": {
    "@type": "PostalAddress",
    "addressCountry": "PH"
  },
  "sameAs": [],
  "legalName": "Terra.Ph Technologies Inc.",
  "identifier": {
    "@type": "PropertyValue",
    "name": "SEC Registration Number",
    "value": "2023100123109-10"
  }
}
''';

void main() {
  // Initializes the server environment with the generated default options.
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  // Starts the app.
  runApp(
    Document(
      title: _title,
      meta: {
        // Core SEO
        'description': _description,
        'keywords':
            'web3 development Philippines, defi platform development, mobile app development Philippines, blockchain development, SaaS development, e-commerce marketplace, software agency Philippines, SEC registered tech company, flutter developer, react native developer, smart contract development, solidity developer',
        'robots': 'index, follow',
        'viewport': 'width=device-width, initial-scale=1.0',
        'author': _siteName,

        // Open Graph (Facebook, LinkedIn, WhatsApp, Slack etc.)
        'og:type': 'website',
        'og:url': _siteUrl,
        'og:site_name': _siteName,
        'og:title': _title,
        'og:description': _description,
        'og:image': _ogImage,
        'og:image:width': '1200',
        'og:image:height': '630',
        'og:image:alt': 'Terra.Ph Technologies Inc. — Next-Gen Software Development',
        'og:locale': 'en_PH',

        // Twitter Card
        'twitter:card': 'summary_large_image',
        'twitter:site': _twitterHandle,
        'twitter:creator': _twitterHandle,
        'twitter:title': _title,
        'twitter:description': _description,
        'twitter:image': _ogImage,
        'twitter:image:alt': 'Terra.Ph Technologies Inc. — Next-Gen Software Development',

        // Mobile & Browser
        'theme-color': '#0a0a1a',
        'mobile-web-app-capable': 'yes',
        'apple-mobile-web-app-capable': 'yes',
        'apple-mobile-web-app-status-bar-style': 'black-translucent',
        'apple-mobile-web-app-title': 'Terra.Ph',
        'application-name': 'Terra.Ph',

        // Geo targeting (Philippines-based company)
        'geo.region': 'PH',
        'geo.placename': 'Philippines',
        'language': 'English',
      },
      head: [
        // Favicon & icons
        link(rel: 'icon', type: 'image/png', href: '/logo.png'),
        link(rel: 'apple-touch-icon', href: '/logo.png'),

        // Canonical URL
        link(rel: 'canonical', href: _siteUrl),

        // Fonts
        link(rel: 'preconnect', href: 'https://fonts.googleapis.com'),
        link(rel: 'preconnect', href: 'https://fonts.gstatic.com', attributes: {'crossorigin': 'anonymous'}),
        link(
          rel: 'stylesheet',
          href: 'https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&family=Plus+Jakarta+Sans:wght@300;400;500;600;700&display=swap',
        ),

        // Styles
        link(rel: 'stylesheet', href: '/style.css'),
        Component.element(tag: 'style', children: [
          Component.text(
            'body.js-ready .reveal { opacity: 0; transform: translateY(40px) scale(0.98); filter: blur(5px); } '
            'body.js-ready .reveal.visible { opacity: 1; transform: none; filter: none; }',
          ),
        ]),

        // JSON-LD Structured Data (Organization schema)
        Component.element(
          tag: 'script',
          attributes: {'type': 'application/ld+json'},
          children: [Component.text(_jsonLd)],
        ),

        // Scripts
        script(src: 'https://unpkg.com/lucide@latest/dist/umd/lucide.min.js', defer: true),
        script(src: 'https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js', defer: true),
        script(src: '/script.js', defer: true),
      ],
      body: const App(),
    ),
  );
}
