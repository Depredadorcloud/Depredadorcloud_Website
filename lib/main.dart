import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:seo_renderer/seo_renderer.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:particles_flutter/particles_flutter.dart';

// --- Localization System ---
enum AppLanguage { en, es }

class Translations {
  static const Map<AppLanguage, Map<String, String>> data = {
    AppLanguage.es: {
      'title': 'DepredadorCloud | Centro de Informática y Mecánica Pesada',
      'nav_it': 'INFORMÁTICA',
      'nav_mechanics': 'MECÁNICA',
      'nav_about': 'NOSOTROS',
      'nav_contact': 'CONTACTO',
      'hero_subtitle': 'Sinergia de Informática Avanzada y Mecánica Pesada',
      'hero_desc':
          'Ubicados en El Salvador. Integramos Computer Science y Mecánica Pesada en un taller de vanguardia orquestado por I.A.',
      'it_mode': 'MODO IT',
      'mechanic_mode': 'MODO MECÁNICO',
      'explore_it': 'Explorar Informática',
      'explore_mech': 'Explorar Mecánica',
      'intersection_title': 'LA INTERSECCIÓN',
      'intersection_subtitle': 'Donde el código se convierte en torque.',
      'footer_copy':
          '© 2026 DepredadorCloud. El Salvador - Centro de Informática y Mecánica Pesada.',
      'it_services_title': 'Servicios de TI e Infraestructura',
      'mech_services_title': 'Sistemas de Mecánica Pesada e Industrial',
      'nav_agents': 'AGENTES',
      'diag_title': 'Diagnóstico Neural',
      'diag_subtitle':
          'Selecciona un síntoma para recibir una recomendación inmediata de Juan Sabe.',
      'recommendation': 'Recomendación de Juan Sabe v6.0 ULTRA:',
      'architect_title': 'THE ARCHITECT',
      'architect_subtitle': 'Soberanía Políglota y Orquestación de Torque',
    },
    AppLanguage.en: {
      'title': 'DepredadorCloud | IT & Heavy Mechanics Center',
      'nav_it': 'IT SERVICES',
      'nav_mechanics': 'MECHANICS',
      'nav_about': 'ABOUT US',
      'nav_contact': 'CONTACT',
      'hero_subtitle': 'Synergy of Advanced IT and Heavy Mechanics',
      'hero_desc':
          'Located in El Salvador. We integrate Computer Science and Heavy Mechanics in a cutting-edge workshop orchestrated by A.I.',
      'it_mode': 'IT MODE',
      'mechanic_mode': 'MECHANIC MODE',
      'explore_it': 'Explore IT',
      'explore_mech': 'Explore Mechanics',
      'intersection_title': 'THE INTERSECTION',
      'intersection_subtitle': 'Where code becomes torque.',
      'footer_copy':
          '© 2026 DepredadorCloud. El Salvador - IT & Heavy Mechanics Center.',
      'it_services_title': 'IT Services & Infrastructure',
      'mech_services_title': 'Heavy & Industrial Mechanic Systems',
      'nav_agents': 'AGENTS',
      'diag_title': 'Neural Diagnostics',
      'diag_subtitle':
          'Select a symptom to receive an immediate recommendation from Juan Sabe.',
      'recommendation': 'Juan Sabe v6.0 ULTRA Recommendation:',
      'architect_title': 'THE ARCHITECT',
      'architect_subtitle': 'Polyglot Sovereignty & Torque Orchestration',
    },
  };

  static String t(String key, AppLanguage lang) {
    return data[lang]?[key] ?? key;
  }
}

final ValueNotifier<AppLanguage> languageNotifier = ValueNotifier(
  AppLanguage.es,
);

void main() {
  runApp(const RobotDetector(child: DepredadorCloudApp()));
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(path: '/it', builder: (context, state) => const ITPage()),
    GoRoute(
      path: '/mechanics',
      builder: (context, state) => const MechanicsPage(),
    ),
    GoRoute(
      path: '/agents',
      builder: (context, state) => const AgentsPage(),
    ),
  ],
);

class DepredadorCloudApp extends StatelessWidget {
  const DepredadorCloudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppLanguage>(
      valueListenable: languageNotifier,
      builder: (context, lang, child) {
        return MaterialApp.router(
          routerConfig: _router,
          title: Translations.t('title', lang),
          debugShowCheckedModeBanner: false,
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            ],
          ),
          theme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: const Color(0xFF020617),
            primaryColor: const Color(0xFF0ea5e9),
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFF0ea5e9),
              secondary: Color(0xFFf97316),
              surface: Color(0xFF0f172a),
            ),
            textTheme: GoogleFonts.outfitTextTheme(ThemeData.dark().textTheme),
          ),
        );
      },
    );
  }
}

// --- Common Components ---

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppLanguage>(
      valueListenable: languageNotifier,
      builder: (context, lang, _) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          color: const Color(0xFF020617).withOpacity(0.9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => context.go('/'),
                child: Row(
                  children: [
                    Image.asset('assets/img/logo.png', width: 40),
                    const SizedBox(width: 12),
                    Text(
                      'DEPREDADOR',
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'CLOUD',
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFf97316),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  _NavBtn(
                    Translations.t('nav_it', lang),
                    onTap: () => context.go('/it'),
                  ),
                  _NavBtn(
                    Translations.t('nav_mechanics', lang),
                    onTap: () => context.go('/mechanics'),
                  ),
                  _NavBtn(
                    Translations.t('nav_agents', lang),
                    onTap: () => context.go('/agents'),
                  ),
                  _NavBtn(Translations.t('nav_about', lang)),
                  _NavBtn(
                    Translations.t('nav_contact', lang),
                    onTap: () async {
                      final Uri url = Uri.parse(
                        'mailto:contacto@depredadorcloud.com',
                      );
                      if (await canLaunchUrl(url)) await launchUrl(url);
                    },
                  ),
                  const SizedBox(width: 20),
                  // Language Toggle
                  TextButton(
                    onPressed: () {
                      languageNotifier.value = lang == AppLanguage.es
                          ? AppLanguage.en
                          : AppLanguage.es;
                    },
                    child: Text(
                      lang == AppLanguage.es ? 'EN' : 'ES',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _NavBtn extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  const _NavBtn(this.text, {this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: Color(0xFF94a3b8),
          ),
        ),
      ),
    );
  }
}

// --- Pages ---

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMechanicMode = false;

  @override
  Widget build(BuildContext context) {
    final lang = languageNotifier.value;
    final accentColor = isMechanicMode
        ? const Color(0xFFf97316)
        : const Color(0xFF0ea5e9);
    final modeTitle = isMechanicMode
        ? Translations.t('nav_mechanics', lang)
        : Translations.t('nav_it', lang);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: isMechanicMode
                      ? const Alignment(0.8, 0.8)
                      : const Alignment(-0.8, -0.8),
                  radius: 1.2,
                  colors: [
                    accentColor.withOpacity(0.08),
                    const Color(0xFF020617),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: CircularParticle(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                particleColor: accentColor.withOpacity(0.3),
                numberOfParticles: isMechanicMode ? 30 : 60,
                speedOfParticles: 0.5,
                maxParticleSize: isMechanicMode ? 5 : 3,
                awayRadius: 100,
                isRandSize: true,
                isRandomColor: false,
                isLineVisible:
                    !isMechanicMode, // Show connecting lines only in IT mode
                lineColor: accentColor.withOpacity(0.1),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 120),
                // Hero
                ResponsiveRowColumn(
                  layout: ResponsiveBreakpoints.of(context).isMobile
                      ? ResponsiveRowColumnType.COLUMN
                      : ResponsiveRowColumnType.ROW,
                  rowMainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeInDown(
                              child: TextRenderer(
                                child: Text(
                                  'DepredadorCloud',
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: accentColor,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            FadeInLeft(
                              delay: const Duration(milliseconds: 200),
                              child: SizedBox(
                                height:
                                    ResponsiveBreakpoints.of(context).isMobile
                                    ? 120
                                    : 130, // Fixed height to prevent dancing layouts
                                child: DefaultTextStyle(
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize:
                                        ResponsiveBreakpoints.of(
                                          context,
                                        ).isMobile
                                        ? 42
                                        : 54,
                                    fontWeight: FontWeight.w800,
                                    height: 1.1,
                                    color: Colors.white,
                                  ),
                                  child: AnimatedTextKit(
                                    key: ValueKey<String>(
                                      Translations.t('hero_subtitle', lang),
                                    ), // Forces rebuild on language change
                                    animatedTexts: [
                                      TypewriterAnimatedText(
                                        Translations.t('hero_subtitle', lang),
                                        speed: const Duration(milliseconds: 50),
                                      ),
                                    ],
                                    isRepeatingAnimation: false,
                                    displayFullTextOnTap: true,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            FadeInLeft(
                              delay: const Duration(milliseconds: 300),
                              child: TextRenderer(
                                child: Text(
                                  Translations.t('hero_desc', lang),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF94a3b8),
                                    height: 1.6,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 48),
                            FadeInUp(
                              delay: const Duration(milliseconds: 400),
                              child: Row(
                                children: [
                                  Text(
                                    Translations.t('it_mode', lang),
                                    style: TextStyle(
                                      color: !isMechanicMode
                                          ? const Color(0xFF0ea5e9)
                                          : Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Switch(
                                    value: isMechanicMode,
                                    onChanged: (v) =>
                                        setState(() => isMechanicMode = v),
                                    activeColor: const Color(0xFFf97316),
                                    inactiveThumbColor: const Color(0xFF0ea5e9),
                                  ),
                                  Text(
                                    Translations.t('mechanic_mode', lang),
                                    style: TextStyle(
                                      color: isMechanicMode
                                          ? const Color(0xFFf97316)
                                          : Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 40),
                            FadeInUp(
                              delay: const Duration(milliseconds: 500),
                              child: ElevatedButton.icon(
                                onPressed: () => context.go(
                                  isMechanicMode ? '/mechanics' : '/it',
                                ),
                                icon: const Icon(LucideIcons.arrowRight),
                                label: Text(
                                  isMechanicMode
                                      ? Translations.t('explore_mech', lang)
                                      : Translations.t('explore_it', lang),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: accentColor,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 32,
                                    vertical: 20,
                                  ),
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: FadeInRight(
                        child: Padding(
                          padding: const EdgeInsets.all(40),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: accentColor.withOpacity(0.5),
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: accentColor.withOpacity(0.2),
                                  blurRadius: 40,
                                  spreadRadius: 10,
                                ),
                              ],
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: ImageRenderer(
                              alt: 'Hero Image',
                              child: Image.asset(
                                'assets/img/hero_split.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
                // Intersection Section
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 80,
                    horizontal: 40,
                  ),
                  color: const Color(0xFF0f172a).withOpacity(0.5),
                  child: Column(
                    children: [
                      Text(
                        Translations.t('intersection_title', lang),
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        Translations.t('intersection_subtitle', lang),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color(0xFF94a3b8),
                        ),
                      ),
                      const SizedBox(height: 64),
                      ResponsiveRowColumn(
                        layout: ResponsiveBreakpoints.of(context).isMobile
                            ? ResponsiveRowColumnType.COLUMN
                            : ResponsiveRowColumnType.ROW,
                        children: [
                          ResponsiveRowColumnItem(
                            child: _buildCard(
                              LucideIcons.cpu,
                              'IoT Industrial',
                              lang == AppLanguage.es
                                  ? 'Sensorización de motores diesel para mantenimiento predictivo.'
                                  : 'Diesel engine sensing for predictive maintenance.',
                            ),
                          ),
                          ResponsiveRowColumnItem(
                            child: _buildCard(
                              LucideIcons.binary,
                              'Custom Software',
                              lang == AppLanguage.es
                                  ? 'Interfaces de control para sistemas hidráulicos automatizados.'
                                  : 'Control interfaces for automated hydraulic systems.',
                            ),
                          ),
                          ResponsiveRowColumnItem(
                            child: _buildCard(
                              LucideIcons.shieldAlert,
                              'Cyber-Mecánica',
                              lang == AppLanguage.es
                                  ? 'Protección contra intrusiones en redes operativas de taller.'
                                  : 'Intrusion protection in operational workshop networks.',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 100),
                      const InteractiveDiagnostics(),
                    ],
                  ),
                ),
                const FooterSection(),
              ],
            ),
          ),
          const NavBar(),
        ],
      ),
    );
  }

  Widget _buildCard(IconData icon, String title, String desc) {
    return ResponsiveRowColumnItem(
      rowFlex: 1,
      child: FadeInUp(
        duration: const Duration(milliseconds: 600),
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Tilt(
            borderRadius: BorderRadius.circular(12),
            tiltConfig: const TiltConfig(angle: 15, enableRevert: true),
            lightConfig: const LightConfig(
              color: Colors.white12,
              minIntensity: 0.1,
              maxIntensity: 0.8,
            ),
            shadowConfig: const ShadowConfig(
              minIntensity: 0.1,
              maxIntensity: 0.4,
              offsetFactor: 0.08,
              color: Colors.black,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0f172a).withOpacity(0.6),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Column(
                    children: [
                      Icon(icon, size: 40, color: const Color(0xFFf97316)),
                      const SizedBox(height: 16),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        desc,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Color(0xFF94a3b8)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// --- Detailed Pages ---

class ITPage extends StatelessWidget {
  const ITPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = languageNotifier.value;
    final isEs = lang == AppLanguage.es;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 120),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 60,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Translations.t('it_services_title', lang),
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF0ea5e9),
                        ),
                      ),
                      const SizedBox(height: 40),
                      FadeInRight(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xFF0ea5e9).withOpacity(0.3),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF0ea5e9).withOpacity(0.1),
                                blurRadius: 40,
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Flexible(
                            child: ImageRenderer(
                              alt: 'IT Command Center',
                              child: Image.asset(
                                'assets/img/it/banner.png',
                                height:
                                    ResponsiveBreakpoints.of(context).isMobile
                                    ? 250
                                    : 400,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      GridView.count(
                        crossAxisCount:
                            ResponsiveBreakpoints.of(context).isDesktop ? 2 : 1,
                        shrinkWrap: true,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 30,
                        childAspectRatio: 2.2,
                        children: [
                          _ServiceDetailCard(
                            icon: LucideIcons.cloud,
                            title: isEs
                                ? 'Soluciones Cloud e Infraestructura'
                                : 'Cloud Solutions & Infrastructure',
                            desc: isEs
                                ? 'Despliegues híbridos escalables para empresas industriales.'
                                : 'Scalable hybrid deployments for industrial enterprises.',
                          ),
                          _ServiceDetailCard(
                            icon: LucideIcons.hardDrive,
                            title: isEs
                                ? 'Mantenimiento de Hardware'
                                : 'Hardware Maintenance',
                            desc: isEs
                                ? 'Hardware as a Service (HaaS) y reparación técnica experta.'
                                : 'Hardware as a Service (HaaS) and expert technical repair.',
                          ),
                          _ServiceDetailCard(
                            icon: LucideIcons.code,
                            title: isEs
                                ? 'Desarrollo de Software / I.A.'
                                : 'Software Development / A.I.',
                            desc: isEs
                                ? 'Orquestación de agentes IA soberanos (Juan Sabe) para logística.'
                                : 'Sovereign AI agent orchestration (Juan Sabe) for logistics.',
                          ),
                          _ServiceDetailCard(
                            icon: LucideIcons.shieldCheck,
                            title: isEs
                                ? 'Ciberseguridad Avanzada'
                                : 'Advanced Cybersecurity',
                            desc: isEs
                                ? 'Defensa de red basada en telemetría Palantir WEF y monitoreo activo.'
                                : 'Network defense based on Palantir WEF telemetry and active monitoring.',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const FooterSection(),
              ],
            ),
          ),
          const NavBar(),
        ],
      ),
    );
  }
}

class MechanicsPage extends StatelessWidget {
  const MechanicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = languageNotifier.value;
    final isEs = lang == AppLanguage.es;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 120),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 60,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Translations.t('mech_services_title', lang),
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFf97316),
                        ),
                      ),
                      const SizedBox(height: 40),
                      FadeInRight(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xFFf97316).withOpacity(0.3),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFf97316).withOpacity(0.1),
                                blurRadius: 40,
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Flexible(
                            child: ImageRenderer(
                              alt: 'Heavy Machinery Workshop',
                              child: Image.asset(
                                'assets/img/mechanic/banner.png',
                                height:
                                    ResponsiveBreakpoints.of(context).isMobile
                                    ? 250
                                    : 400,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      GridView.count(
                        crossAxisCount:
                            ResponsiveBreakpoints.of(context).isDesktop ? 2 : 1,
                        shrinkWrap: true,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 30,
                        childAspectRatio: 2.2,
                        children: [
                          _ServiceDetailCard(
                            icon: LucideIcons.monitorDot,
                            title: isEs
                                ? 'Diagnóstico Computarizado'
                                : 'Computerized Diagnostics',
                            desc: isEs
                                ? 'Escaneo profundo de ECUs y sistemas electrónicos de maquinaria pesada.'
                                : 'Deep scanning of ECUs and heavy machinery electronic systems.',
                            accent: const Color(0xFFf97316),
                          ),
                          _ServiceDetailCard(
                            icon: LucideIcons.layers,
                            title: isEs
                                ? 'Sistemas Hidráulicos'
                                : 'Hydraulic Systems',
                            desc: isEs
                                ? 'Optimización y reparación de bombas, válvulas y actuadores industriales.'
                                : 'Optimization and repair of industrial pumps, valves, and actuators.',
                            accent: const Color(0xFFf97316),
                          ),
                          _ServiceDetailCard(
                            icon: LucideIcons.settings,
                            title: isEs
                                ? 'Motores Diesel y Transmisión'
                                : 'Diesel Engines & Transmission',
                            desc: isEs
                                ? 'Reparación mayor y preventivo para flotas de minería y construcción.'
                                : 'Major overhaul and preventive maintenance for mining and construction fleets.',
                            accent: const Color(0xFFf97316),
                          ),
                          _ServiceDetailCard(
                            icon: LucideIcons.activity,
                            title: isEs ? 'Telemetría IoT' : 'IoT Telemetry',
                            desc: isEs
                                ? 'Monitoreo de estado de flota en tiempo real para prevención de fallas.'
                                : 'Real-time fleet status monitoring for fault prevention.',
                            accent: const Color(0xFFf97316),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const FooterSection(),
              ],
            ),
          ),
          const NavBar(),
        ],
      ),
    );
  }
}

class _ServiceDetailCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;
  final Color accent;
  const _ServiceDetailCard({
    required this.icon,
    required this.title,
    required this.desc,
    this.accent = const Color(0xFF0ea5e9),
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 500),
      child: Tilt(
        borderRadius: BorderRadius.circular(16),
        tiltConfig: const TiltConfig(angle: 10),
        lightConfig: LightConfig(
          color: accent.withOpacity(0.2),
          minIntensity: 0.1,
          maxIntensity: 0.5,
        ),
        shadowConfig: const ShadowConfig(
          minIntensity: 0.1,
          maxIntensity: 0.3,
          offsetFactor: 0.05,
          color: Colors.black,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: const Color(0xFF0f172a).withOpacity(0.6),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.05)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: accent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icon, color: accent, size: 30),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          desc,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF94a3b8),
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InteractiveDiagnostics extends StatefulWidget {
  const InteractiveDiagnostics({super.key});

  @override
  State<InteractiveDiagnostics> createState() => _InteractiveDiagnosticsState();
}

class _InteractiveDiagnosticsState extends State<InteractiveDiagnostics> {
  String? selectedSymptom;
  String? recommendation;
  bool isIt = true;

  final Map<String, Map<AppLanguage, String>> techDiag = {
    'Network Instability': {
      AppLanguage.en:
          'Deploying adaptive load balancing and WEF telemetry monitoring.',
      AppLanguage.es:
          'Despliegue de balanceo de carga adaptativo y monitoreo de telemetría WEF.',
    },
    'System Sluggishness': {
      AppLanguage.en:
          'Optimizing VDS nodes and high-frequency memory allocation.',
      AppLanguage.es:
          'Optimización de nodos VDS y asignación de memoria de alta frecuencia.',
    },
    'Security Breach': {
      AppLanguage.en:
          'Initiating global IP lockdown and Palantir-based threat hunting.',
      AppLanguage.es:
          'Iniciando bloqueo global de IPs y búsqueda de amenazas basada en Palantir.',
    },
    'Power Loss': {
      AppLanguage.en:
          'Fuel injector synchronization and ECU re-mapping required.',
      AppLanguage.es:
          'Se requiere sincronización de inyectores y re-mapeo de la ECU.',
    },
    'Hydraulic Failure': {
      AppLanguage.en:
          'Pressure sensor recalibration and valve actuator vetting.',
      AppLanguage.es:
          'Recalibración de sensores de presión y revisión de actuadores de válvulas.',
    },
    'Overheating': {
      AppLanguage.en:
          'IoT thermal sensing array installation for predictive cooling.',
      AppLanguage.es:
          'Instalación de matriz de sensores térmicos IoT para enfriamiento predictivo.',
    },
    'Physical AI Sync': {
      AppLanguage.en:
          'Deploying Robotics IoT Sovereign Node with multi-agent consensus.',
      AppLanguage.es:
          'Despliegue de Nodo Soberano de Robótica IoT con consenso multi-agente.',
    },
    'Digital Workforce': {
      AppLanguage.en:
          'Activating CUA-RAG hybrid nodes for GUI workflow automation.',
      AppLanguage.es:
          'Activando nodos híbridos CUA-RAG para automatización de flujos GUI.',
    },
  };

  @override
  Widget build(BuildContext context) {
    final lang = languageNotifier.value;
    final itSymptoms = lang == AppLanguage.es
        ? [
            'Inestabilidad de Red',
            'Lentitud de Sistema',
            'Brecha de Seguridad',
            'Fuerza de Trabajo Digital'
          ]
        : [
            'Network Instability',
            'System Sluggishness',
            'Security Breach',
            'Digital Workforce'
          ];
    final mechSymptoms = lang == AppLanguage.es
        ? [
            'Pérdida de Potencia',
            'Falla Hidráulica',
            'Sobrecalentamiento',
            'Sincronización AI Física'
          ]
        : [
            'Power Loss',
            'Hydraulic Failure',
            'Overheating',
            'Physical AI Sync'
          ];

    return Container(
      width: 800,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: const Color(0xFF020617),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white10),
        boxShadow: [
          BoxShadow(
            color: (isIt ? const Color(0xFF0ea5e9) : const Color(0xFFf97316))
                .withOpacity(0.1),
            blurRadius: 30,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            Translations.t('diag_title', lang),
            style: GoogleFonts.spaceGrotesk(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            Translations.t('diag_subtitle', lang),
            style: const TextStyle(color: Color(0xFF94a3b8)),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _DiagModeBtn(
                'IT',
                isIt,
                (v) => setState(
                  () => {
                    isIt = v,
                    selectedSymptom = null,
                    recommendation = null,
                  },
                ),
              ),
              const SizedBox(width: 20),
              _DiagModeBtn(
                'MECHANIC',
                !isIt,
                (v) => setState(
                  () => {
                    isIt = !v,
                    selectedSymptom = null,
                    recommendation = null,
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: (isIt ? itSymptoms : mechSymptoms)
                .map(
                  (s) => ChoiceChip(
                    label: Text(s),
                    selected: selectedSymptom == s,
                    onSelected: (val) {
                      setState(() {
                        selectedSymptom = val ? s : null;
                        if (val) {
                          // Normalize lookup key to English for the map
                          String lookupKey = s;
                          if (lang == AppLanguage.es) {
                            if (s == 'Inestabilidad de Red') {
                              lookupKey = 'Network Instability';
                            }
                            if (s == 'Lentitud de Sistema') {
                              lookupKey = 'System Sluggishness';
                            }
                            if (s == 'Brecha de Seguridad') {
                              lookupKey = 'Security Breach';
                            }
                            if (s == 'Pérdida de Potencia') {
                              lookupKey = 'Power Loss';
                            }
                            if (s == 'Falla Hidráulica') {
                              lookupKey = 'Hydraulic Failure';
                            }
                            if (s == 'Sobrecalentamiento') {
                              lookupKey = 'Overheating';
                            }
                            if (s == 'Fuerza de Trabajo Digital' ||
                                s == 'Digital Workforce') {
                              lookupKey = 'Digital Workforce';
                            }
                            if (s == 'Sincronización AI Física' ||
                                s == 'Physical AI Sync') {
                              lookupKey = 'Physical AI Sync';
                            }
                          } else {
                            // En
                            if (s == 'Digital Workforce') {
                              lookupKey = 'Digital Workforce';
                            }
                            if (s == 'Physical AI Sync') {
                              lookupKey = 'Physical AI Sync';
                            }
                          }
                          recommendation = techDiag[lookupKey]?[lang];
                        } else {
                          recommendation = null;
                        }
                      });
                    },
                    selectedColor: isIt
                        ? const Color(0xFF0ea5e9).withOpacity(0.3)
                        : const Color(0xFFf97316).withOpacity(0.3),
                    labelStyle: TextStyle(
                      color: selectedSymptom == s
                          ? (isIt
                                ? const Color(0xFF0ea5e9)
                                : const Color(0xFFf97316))
                          : Colors.grey,
                    ),
                  ),
                )
                .toList(),
          ),
          if (recommendation != null) ...[
            const SizedBox(height: 48),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.03),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    Translations.t('recommendation', lang),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    recommendation!,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _DiagModeBtn extends StatelessWidget {
  final String label;
  final bool active;
  final Function(bool) onTap;
  const _DiagModeBtn(this.label, this.active, this.onTap);
  @override
  Widget build(BuildContext context) {
    final color = label == 'IT'
        ? const Color(0xFF0ea5e9)
        : const Color(0xFFf97316);
    return InkWell(
      onTap: () => onTap(true),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: active ? color.withOpacity(0.1) : Colors.transparent,
          border: Border.all(color: active ? color : Colors.white10),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: active ? color : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: ValueListenableBuilder<AppLanguage>(
        valueListenable: languageNotifier,
        builder: (context, lang, _) {
          return Text(
            Translations.t('footer_copy', lang),
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey),
          );
        },
      ),
    );
  }
}

class AgentsPage extends StatelessWidget {
  const AgentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = languageNotifier.value;
    final isEs = lang == AppLanguage.es;
    return Scaffold(
      backgroundColor: const Color(0xFF020617),
      body: Stack(
        children: [
          // Background Particles
          Positioned.fill(
            child: CircularParticle(
              key: UniqueKey(),
              awayRadius: 80,
              numberOfParticles: 100,
              speedOfParticles: 1,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              particleColor: const Color(0xFFf97316).withOpacity(0.2),
              awayAnimationDuration: const Duration(milliseconds: 600),
              maxParticleSize: 3,
              isRandSize: true,
              isLineVisible: true,
              lineColor: const Color(0xFFf97316).withOpacity(0.1),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 120),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInDown(
                        child: Text(
                          isEs ? 'CENTRO NEURAL AGENTEVOLVER' : 'AGENTEVOLVER NEURAL CENTER',
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 56,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFf97316),
                            letterSpacing: -1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      FadeInLeft(
                        child: Text(
                          isEs 
                            ? 'Orquestación de Agentes Multilenguaje (Rust, Zig, Go, Python)'
                            : 'Multi-language Agent Orchestration (Rust, Zig, Go, Python)',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            color: const Color(0xFF94a3b8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                      const SizedBox(height: 60),
                      // The Architect Section
                      FadeInUp(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(40),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFFf97316).withOpacity(0.1),
                                Colors.transparent
                              ],
                            ),
                            borderRadius: BorderRadius.circular(32),
                            border: Border.all(
                              color: const Color(0xFFf97316).withOpacity(0.3),
                            ),
                          ),
                          child: ResponsiveRowColumn(
                            layout: ResponsiveBreakpoints.of(context).isMobile
                                ? ResponsiveRowColumnType.COLUMN
                                : ResponsiveRowColumnType.ROW,
                            children: [
                              ResponsiveRowColumnItem(
                                rowFlex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFf97316),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        'MASTER IDENTITY',
                                        style: GoogleFonts.spaceGrotesk(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      Translations.t('architect_title', lang),
                                      style: GoogleFonts.spaceGrotesk(
                                        fontSize: 42,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      Translations.t('architect_subtitle', lang),
                                      style: GoogleFonts.inter(
                                        fontSize: 20,
                                        color: const Color(0xFFf97316),
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    Text(
                                      isEs
                                          ? 'El núcleo de orquestación de Juan Sabe. Integra memorias soberanas (Contexa) y coordina flotas de agentes políglotas con latencia cero.'
                                          : 'The orchestration core of Juan Sabe. Integrates sovereign memories (Contexa) and coordinates polyglot agent fleets with zero latency.',
                                      style: const TextStyle(
                                        color: Color(0xFF94a3b8),
                                        fontSize: 16,
                                        height: 1.6,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ResponsiveRowColumnItem(
                                rowFlex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Image.asset(
                                    'assets/img/agents/the_architect.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 80),
                      GridView.count(
                        crossAxisCount:
                            ResponsiveBreakpoints.of(context).isDesktop ? 3 : 1,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 30,
                        childAspectRatio: 1.0,
                        children: [
                          _AgentPulseCard(
                            name: 'NEURAL MATH',
                            status: 'ACTIVE',
                            lang: 'Python (SymPy + Sandbox)',
                            desc: isEs
                                ? 'Derivación simbólica y verificación numérica.'
                                : 'Symbolic derivation and numerical verification.',
                            icon: LucideIcons.binary,
                            color: const Color(0xFF0ea5e9),
                          ),
                          _AgentPulseCard(
                            name: 'ROBOTICS NODE',
                            status: 'SIMULATING',
                            lang: 'Python (Jetson VLA)',
                            desc: isEs
                                ? 'Control de flotas (System 1/2) y patrullaje autónomo.'
                                : 'Fleet control (System 1/2) and autonomous patrol.',
                            icon: LucideIcons.bot,
                            color: const Color(0xFF8b5cf6),
                          ),
                          _AgentPulseCard(
                            name: 'CUA-RAG WORKER',
                            status: 'ACTIVE',
                            lang: 'Python (OpenCUA)',
                            desc: isEs
                                ? 'Automatización de flujos GUI y recuperación híbrida.'
                                : 'GUI workflow automation and hybrid retrieval.',
                            icon: LucideIcons.mousePointer2,
                            color: const Color(0xFFec4899),
                          ),
                          _AgentPulseCard(
                            name: 'CORE SENTINEL',
                            status: 'STABLE',
                            lang: 'Rust (Memory Safe)',
                            desc: isEs
                                ? 'Seguridad ZeroTrust y escaneo de comandos bash.'
                                : 'ZeroTrust security and bash command scanning.',
                            icon: LucideIcons.shieldAlert,
                            color: const Color(0xFFef4444),
                          ),
                          _AgentPulseCard(
                            name: 'EDGE PULSAR',
                            status: 'STABLE',
                            lang: 'Zig (Low Latency)',
                            desc: isEs
                                ? 'Binarios de 18KB para procesos de tiempo real.'
                                : '18KB binaries for real-time processes.',
                            icon: LucideIcons.zap,
                            color: const Color(0xFFeab308),
                          ),
                          _AgentPulseCard(
                            name: 'GO CONDUIT',
                            status: 'CONNECTED',
                            lang: 'Go (High Concurrency)',
                            desc: isEs
                                ? 'Conexión a herramientas MCP y conduits concurrentes.'
                                : 'Connection to MCP tools and concurrent conduits.',
                            icon: LucideIcons.layers,
                            color: const Color(0xFF6366f1),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const FooterSection(),
              ],
            ),
          ),
          const NavBar(),
        ],
      ),
    );
  }
}

class _AgentPulseCard extends StatelessWidget {
  final String name;
  final String status;
  final String lang;
  final String desc;
  final IconData icon;
  final Color color;

  const _AgentPulseCard({
    required this.name,
    required this.status,
    required this.lang,
    required this.desc,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Tilt(
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.03),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: color.withOpacity(0.2), width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: color, size: 32),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status,
                    style: GoogleFonts.spaceGrotesk(
                      color: color,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              name,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              lang,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              desc,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: const Color(0xFF94a3b8),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
