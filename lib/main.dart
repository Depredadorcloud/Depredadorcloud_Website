import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

void main() {
  runApp(const DepredadorCloudApp());
}

class DepredadorCloudApp extends StatelessWidget {
  const DepredadorCloudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DepredadorCloud | Centro de Informática y Mecánica Pesada',
      debugShowCheckedModeBanner: false,
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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 50 && !_isScrolled) {
        setState(() => _isScrolled = true);
      } else if (_scrollController.offset <= 50 && _isScrolled) {
        setState(() => _isScrolled = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Glows
          Positioned(
            top: -200,
            left: -200,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF0ea5e9).withOpacity(0.15),
                    Colors.transparent
                  ],
                  stops: const [0.0, 0.6],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -200,
            right: -200,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFFf97316).withOpacity(0.1),
                    Colors.transparent
                  ],
                  stops: const [0.0, 0.6],
                ),
              ),
            ),
          ),
          // Scrollable Content
          SingleChildScrollView(
            controller: _scrollController,
            child: const Column(
              children: [
                SizedBox(height: 100), // Spacing for Navbar
                HeroSection(),
                ServicesSection(),
                AboutSection(),
                FooterSection(),
              ],
            ),
          ),
          // Navbar overlay
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(isScrolled: _isScrolled),
          ),
        ],
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  final bool isScrolled;
  const NavBar({super.key, required this.isScrolled});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: isScrolled ? const Color(0xFF0f172a).withOpacity(0.9) : const Color(0xFF0f172a).withOpacity(0.65),
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: isScrolled ? 16 : 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/img/logo.png', width: 45, height: 45),
              const SizedBox(width: 12),
              Text(
                'DEPREDADOR',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Colors.white,
                ),
              ),
              Text(
                'CLOUD',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: const Color(0xFFf97316),
                ),
              ),
            ],
          ),
          Row(
            children: [
              _NavText('Inicio'),
              _NavText('Servicios'),
              _NavText('Nosotros'),
              const SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0ea5e9), Color(0xFF2563eb)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0ea5e9).withOpacity(0.5),
                      blurRadius: 15,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                child: const Text('Contactar', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _NavText extends StatelessWidget {
  final String text;
  const _NavText(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF94a3b8))),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.spaceGrotesk(fontSize: 56, fontWeight: FontWeight.w800, height: 1.1, color: Colors.white),
                    children: const [
                      TextSpan(text: 'Sinergia de '),
                      TextSpan(text: 'Informática Avanzada\n', style: TextStyle(color: Color(0xFF0ea5e9))),
                      TextSpan(text: 'y '),
                      TextSpan(text: 'Mecánica Pesada', style: TextStyle(color: Color(0xFFf97316))),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Impulsando el futuro industrial y tecnológico desde El Salvador. DepredadorCloud es un taller único en su clase que integra servicios de Informática Avanzada (Computer Science) y Mecánica Pesada en unas solas instalaciones.',
                  style: TextStyle(fontSize: 18, color: Color(0xFF94a3b8), height: 1.6),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [Color(0xFF0ea5e9), Color(0xFF2563eb)]),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [BoxShadow(color: const Color(0xFF0ea5e9).withOpacity(0.5), blurRadius: 15, offset: const Offset(0, 4))],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                      child: const Row(
                        children: [
                          Text('Explorar Servicios', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
                          SizedBox(width: 8),
                          Icon(LucideIcons.arrowRight, size: 20, color: Colors.white),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [Color(0xFF6366f1), Color(0xFF0ea5e9)]),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [BoxShadow(color: const Color(0xFF6366f1).withOpacity(0.5), blurRadius: 15, offset: const Offset(0, 4))],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                      child: const Row(
                        children: [
                          Text('Portal de Inteligencia', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
                          SizedBox(width: 8),
                          Icon(LucideIcons.shieldAlert, size: 20, color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                Container(
                  padding: const EdgeInsets.only(top: 32),
                  decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color(0x1AFFFFFF)))),
                  child: Row(
                    children: [
                      _buildStat('99.9%', 'Uptime Servidores'),
                      const SizedBox(width: 48),
                      _buildStat('24/7', 'Soporte Mecánico'),
                      const SizedBox(width: 48),
                      _buildStat('100+', 'Nodos Agritech/TI'),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 64),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF0ea5e9)),
                boxShadow: [BoxShadow(color: const Color(0xFF0ea5e9).withOpacity(0.3), blurRadius: 30)],
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset('assets/img/hero.png', fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String number, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF0ea5e9),
            shadows: [Shadow(color: const Color(0xFF0ea5e9).withOpacity(0.8), blurRadius: 10)],
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Color(0xFF94a3b8), letterSpacing: 1),
        ),
      ],
    );
  }
}

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: GoogleFonts.spaceGrotesk(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
              children: const [
                TextSpan(text: 'Nuestras '),
                TextSpan(text: 'Capacidades', style: TextStyle(color: Color(0xFFf97316))),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Infraestructura hiperconvergente para demandas industriales extremas en El Salvador.',
            style: TextStyle(fontSize: 16, color: Color(0xFF94a3b8)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 64),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 32,
            mainAxisSpacing: 32,
            childAspectRatio: 1.6,
            children: const [
              _ServiceCard(
                icon: LucideIcons.server,
                title: 'Infraestructura TI Soberana',
                description: 'Servidores de alto rendimiento, RAG clusters, y despliegues orquestados (Paul Kruger, Omega-1) con seguridad de grado militar y telemetría avanzada.',
              ),
              _ServiceCard(
                icon: LucideIcons.wrench,
                title: 'Mecánica Pesada Automatizada',
                description: 'Mantenimiento preventivo, reparación de motores industriales y calibración de maquinaria pesada. Servicio realizado en nuestro taller singular.',
              ),
              _ServiceCard(
                icon: LucideIcons.shieldCheck,
                title: 'Cyberseguridad & Redes',
                description: 'Defensa proactiva con monitoreo de paquetes, cortafuegos de hardware y despliegues Palantir Event Forwarding para caza de amenazas.',
              ),
              _ServiceCard(
                icon: LucideIcons.satellite,
                title: 'Integración Agritech/Satélite',
                description: 'Unificación de datos satelitales con maquinaria de campo. Optimización de rutas, análisis topográfico y gestión de flotas vía telemetría en tiempo real.',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ServiceCard({required this.icon, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0f172a),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0x1AFFFFFF)),
      ),
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF0ea5e9).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF0ea5e9), size: 28),
          ),
          const SizedBox(height: 24),
          Text(title, style: GoogleFonts.spaceGrotesk(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white)),
          const SizedBox(height: 16),
          Text(description, style: const TextStyle(fontSize: 15, color: Color(0xFF94a3b8), height: 1.5)),
        ],
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      margin: const EdgeInsets.symmetric(vertical: 80),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, const Color(0xFF0f172a).withOpacity(0.4)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0x1AFFFFFF)),
              ),
              child: Image.asset('assets/img/logo.png', height: 250),
            ),
          ),
          const SizedBox(width: 64),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.spaceGrotesk(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
                    children: const [
                      TextSpan(text: 'El Núcleo de '),
                      TextSpan(text: 'DepredadorCloud', style: TextStyle(color: Color(0xFFf97316))),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Ubicados en El Salvador, nacimos de la necesidad de fusionar la potencia computacional pura con la fuerza imparable de la maquinaria industrial pesada. Nuestro taller único integra todos los servicios de Informática Avanzada (Computer Science) y Mecánica Pesada bajo un solo techo.',
                  style: TextStyle(fontSize: 18, color: Color(0xFF94a3b8), height: 1.6),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Nuestro Centro de Informática y Mecánica Pesada es el corazón orquestador detrás de la infraestructura SISA, integrando telecomunicaciones operativas, redes y gestión simultánea con la reparación física de activos pesados en la misma base.',
                  style: TextStyle(fontSize: 18, color: Color(0xFF94a3b8), height: 1.6),
                ),
                const SizedBox(height: 32),
                _buildFeatureRow(LucideIcons.checkCircle2, 'Operaciones 24/7/365 en El Salvador.'),
                _buildFeatureRow(LucideIcons.checkCircle2, 'Orquestación en Sistemas Híbridos (Nube + Edge).'),
                _buildFeatureRow(LucideIcons.checkCircle2, 'Sinergia Total: Taller de Mecánica Pesada y Data Center combinados.'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFf97316), size: 20),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16, color: Colors.white))),
        ],
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
      color: const Color(0xFF0f172a),
      padding: const EdgeInsets.only(top: 64, bottom: 32),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/img/logo.png', width: 60),
                    const SizedBox(height: 16),
                    Text('DEPREDADORCLOUD', style: GoogleFonts.spaceGrotesk(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 8),
                    const Text('Centro de Informática y Mecánica Pesada', style: TextStyle(color: Color(0xFF94a3b8))),
                    const Text('Sinergia Industrial en El Salvador', style: TextStyle(color: Color(0xFF94a3b8))),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Contacto de Control', style: GoogleFonts.spaceGrotesk(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 24),
                    const Row(children: [Icon(LucideIcons.mail, size: 18, color: Color(0xFF0ea5e9)), SizedBox(width: 8), Text('sistemas@depredadorcloud.com', style: TextStyle(color: Color(0xFF94a3b8)))]),
                    const SizedBox(height: 12),
                    const Row(children: [Icon(LucideIcons.mapPin, size: 18, color: Color(0xFF0ea5e9)), SizedBox(width: 8), Text('El Salvador - Base Operativa Principal', style: TextStyle(color: Color(0xFF94a3b8)))]),
                    const SizedBox(height: 12),
                    const Row(children: [Icon(LucideIcons.terminal, size: 18, color: Color(0xFF0ea5e9)), SizedBox(width: 8), Text('Terminal: Activa', style: TextStyle(color: Color(0xFF94a3b8)))]),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 64),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 32),
            decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color(0x1AFFFFFF)))),
            child: const Text(
              '© 2026 DepredadorCloud. Todos los derechos reservados. Sistema Operacional Juan Sabe.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF94a3b8), fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
