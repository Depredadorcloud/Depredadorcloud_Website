import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:seo_renderer/seo_renderer.dart';

void main() {
  runApp(const RobotDetector(child: DepredadorCloudApp()));
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/it',
      builder: (context, state) => const ITPage(),
    ),
    GoRoute(
      path: '/mechanics',
      builder: (context, state) => const MechanicsPage(),
    ),
  ],
);

class DepredadorCloudApp extends StatelessWidget {
  const DepredadorCloudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'DepredadorCloud | Centro de Informática y Mecánica Pesada',
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
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Service Toggle: false = IT Mode (Blue), true = Mechanic Mode (Orange)
  bool isMechanicMode = false;

  Color get accentColor => isMechanicMode ? const Color(0xFFf97316) : const Color(0xFF0ea5e9);
  String get modeTitle => isMechanicMode ? 'Mecánica Pesada' : 'Informática Avanzada';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background UI
          Positioned.fill(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: isMechanicMode ? const Alignment(0.8, 0.8) : const Alignment(-0.8, -0.8),
                  radius: 1.2,
                  colors: [
                    accentColor.withOpacity(0.08),
                    const Color(0xFF020617),
                  ],
                ),
              ),
            ),
          ),
          
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 120),
                
                // Hero Section with Split-Screen Visual
                ResponsiveRowColumn(
                  layout: ResponsiveBreakpoints.of(context).isMobile
                      ? ResponsiveRowColumnType.COLUMN
                      : ResponsiveRowColumnType.ROW,
                  rowMainAxisAlignment: MainAxisAlignment.center,
                  columnCrossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextRenderer(
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
                            const SizedBox(height: 16),
                            TextRenderer(
                              child: Text(
                                'Centro de\n$modeTitle',
                                style: GoogleFonts.spaceGrotesk(
                                  fontSize: 64,
                                  fontWeight: FontWeight.w800,
                                  height: 1.1,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            const TextRenderer(
                              child: Text(
                                'Sinergia industrial única en El Salvador. Integramos Computer Science y Mecánica Pesada en un taller de vanguardia orquestado por I.A.',
                                style: TextStyle(fontSize: 18, color: Color(0xFF94a3b8), height: 1.6),
                              ),
                            ),
                            const SizedBox(height: 48),
                            
                            // Interaction: Service Toggle
                            Row(
                              children: [
                                Text('IT MODE', style: TextStyle(color: !isMechanicMode ? const Color(0xFF0ea5e9) : Colors.grey, fontWeight: FontWeight.bold)),
                                Switch(
                                  value: isMechanicMode,
                                  onChanged: (val) => setState(() => isMechanicMode = val),
                                  activeColor: const Color(0xFFf97316),
                                  inactiveThumbColor: const Color(0xFF0ea5e9),
                                ),
                                Text('MECHANIC MODE', style: TextStyle(color: isMechanicMode ? const Color(0xFFf97316) : Colors.grey, fontWeight: FontWeight.bold)),
                              ],
                            ),
                            
                            const SizedBox(height: 40),
                            ElevatedButton.icon(
                              onPressed: () => context.go(isMechanicMode ? '/mechanics' : '/it'),
                              icon: const Icon(LucideIcons.arrowRight),
                              label: Text('Explorar ${modeTitle.split(' ')[0]}'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: accentColor,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                                textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: accentColor.withOpacity(0.5), width: 2),
                            boxShadow: [
                              BoxShadow(color: accentColor.withOpacity(0.2), blurRadius: 40, spreadRadius: 10),
                            ],
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: ImageRenderer(
                            alt: 'DepredadorCloud Split Hero',
                            child: Image.asset('assets/img/hero_split.png', fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 100),
                
                // The Intersection Section (Tech + Industry)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
                  color: const Color(0xFF0f172a).withOpacity(0.5),
                  child: Column(
                    children: [
                      Text(
                        'LA INTERSECCIÓN',
                        style: GoogleFonts.spaceGrotesk(fontSize: 48, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Donde el código se convierte en torque.',
                        style: TextStyle(fontSize: 20, color: Color(0xFF94a3b8)),
                      ),
                      const SizedBox(height: 64),
                      ResponsiveRowColumn(
                        layout: ResponsiveBreakpoints.of(context).isMobile
                            ? ResponsiveRowColumnType.COLUMN
                            : ResponsiveRowColumnType.ROW,
                        children: [
                          _buildInterSectionCard(LucideIcons.cpu, 'IoT Industrial', 'Sensorización de motores diesel para mantenimiento predictivo.'),
                          _buildInterSectionCard(LucideIcons.binary, 'Custom Software', 'Interfaces de control para sistemas hidráulicos automatizados.'),
                          _buildInterSectionCard(LucideIcons.shieldAlert, 'Cyber-Mecánica', 'Protección contra intrusiones en redes operativas de taller.'),
                        ],
                      ),
                    ],
                  ),
                ),
                
                const FooterSection(),
              ],
            ),
          ),
          
          // Navbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              color: const Color(0xFF020617).withOpacity(0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                       Image.asset('assets/img/logo.png', width: 40),
                       const SizedBox(width: 12),
                       Text('DEPREDADOR', style: GoogleFonts.spaceGrotesk(fontSize: 20, fontWeight: FontWeight.bold)),
                       Text('CLOUD', style: GoogleFonts.spaceGrotesk(fontSize: 20, fontWeight: FontWeight.bold, color: const Color(0xFFf97316))),
                    ],
                  ),
                  const Row(
                    children: [
                      _NavBtn('IT'),
                      _NavBtn('MECHANICS'),
                      _NavBtn('NOSOTROS'),
                      _NavBtn('CONTACTO'),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInterSectionCard(IconData icon, String title, String desc) {
    return ResponsiveRowColumnItem(
      rowFlex: 1,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: const Color(0xFF0f172a),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white10),
        ),
        child: Column(
          children: [
            Icon(icon, size: 40, color: const Color(0xFFf97316)),
            const SizedBox(height: 16),
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(desc, textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFF94a3b8))),
          ],
        ),
      ),
    );
  }
}

class _NavBtn extends StatelessWidget {
  final String text;
  const _NavBtn(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF94a3b8))),
    );
  }
}

// Placeholder pages for Router
class ITPage extends StatelessWidget { const ITPage({super.key}); @override Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('IT Services Section'))); }
class MechanicsPage extends StatelessWidget { const MechanicsPage({super.key}); @override Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('Mechanics Services Section'))); }

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: const Text(
         '© 2026 DepredadorCloud. El Salvador - Centro de Informática y Mecánica Pesada.',
         textAlign: TextAlign.center,
         style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
