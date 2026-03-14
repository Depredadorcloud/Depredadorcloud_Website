import 'dart:ui';
import 'dart:js' as js;
import 'dart:js_util' as js_util;
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
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;

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
      'nav_web3': 'WEB3',
      'web3_title': 'Nodo Web3',
      'web3_subtitle': 'Conecta tu wallet para acceder al ecosistema descentralizado de DepredadorCloud.',
      'web3_connect': 'Conectar Wallet',
      'web3_disconnect': 'Desconectar',
      'web3_no_metamask': 'MetaMask no detectado',
      'web3_no_metamask_desc': 'Instala la extensión MetaMask para conectar tu wallet EVM.',
      'web3_install': 'Instalar MetaMask',
      'web3_address': 'Dirección',
      'web3_network': 'Red',
      'web3_balance': 'Balance',
      'web3_connected': 'CONECTADO',
      'web3_disconnected': 'DESCONECTADO',
      'web3_what_title': '¿Por qué Web3?',
      'web3_what_desc': 'DepredadorCloud integra contratos inteligentes para pagos de servicios, verificación de identidad descentralizada y trazabilidad de activos industriales en cadena.',
      'web3_card1_title': 'Pagos On-Chain',
      'web3_card1_desc': 'Paga servicios de TI y mecánica directamente en MATIC, ETH u otros tokens ERC-20.',
      'web3_card2_title': 'NFT de Activos',
      'web3_card2_desc': 'Cada pieza de maquinaria pesada puede ser tokenizada como NFT con historial de mantenimiento inmutable.',
      'web3_card3_title': 'DAO de Clientes',
      'web3_card3_desc': 'Los holders de tokens DC participan en decisiones de servicios y prioridades de la plataforma.',
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
      'nav_web3': 'WEB3',
      'web3_title': 'Web3 Node',
      'web3_subtitle': 'Connect your wallet to access the DepredadorCloud decentralized ecosystem.',
      'web3_connect': 'Connect Wallet',
      'web3_disconnect': 'Disconnect',
      'web3_no_metamask': 'MetaMask Not Detected',
      'web3_no_metamask_desc': 'Install the MetaMask extension to connect your EVM wallet.',
      'web3_install': 'Install MetaMask',
      'web3_address': 'Address',
      'web3_network': 'Network',
      'web3_balance': 'Balance',
      'web3_connected': 'CONNECTED',
      'web3_disconnected': 'DISCONNECTED',
      'web3_what_title': 'Why Web3?',
      'web3_what_desc': 'DepredadorCloud integrates smart contracts for service payments, decentralized identity verification, and on-chain industrial asset traceability.',
      'web3_card1_title': 'On-Chain Payments',
      'web3_card1_desc': 'Pay for IT and mechanic services directly in MATIC, ETH, or other ERC-20 tokens.',
      'web3_card2_title': 'Asset NFTs',
      'web3_card2_desc': 'Each piece of heavy machinery can be tokenized as an NFT with immutable maintenance history.',
      'web3_card3_title': 'Client DAO',
      'web3_card3_desc': 'DC token holders participate in service decisions and platform priorities.',
    },
  };

  static String t(String key, AppLanguage lang) {
    return data[lang]?[key] ?? key;
  }
}

final ValueNotifier<AppLanguage> languageNotifier = ValueNotifier(
  AppLanguage.es,
);

// --- Web3 Wallet ---

class WalletState {
  final bool connected;
  final String? address;
  final String? chainName;
  final String? balance;
  const WalletState({
    this.connected = false,
    this.address,
    this.chainName,
    this.balance,
  });
}

final ValueNotifier<WalletState> walletNotifier = ValueNotifier(
  const WalletState(),
);

class WalletService {
  static bool get isMetaMaskAvailable =>
      js.context.hasProperty('ethereum') &&
      js.context['ethereum'] != null;

  static String _chainName(String id) {
    switch (id) {
      case '0x1':      return 'Ethereum Mainnet';
      case '0x89':     return 'Polygon';
      case '0xa':      return 'Optimism';
      case '0xa4b1':   return 'Arbitrum One';
      case '0xaa36a7': return 'Sepolia Testnet';
      case '0x13882':  return 'Polygon Amoy';
      default:         return 'Chain $id';
    }
  }

  static String _rpcUrl(String chainId) {
    switch (chainId) {
      case '0x89':     return 'https://polygon-rpc.com';
      case '0xaa36a7': return 'https://rpc.sepolia.org';
      default:         return 'https://cloudflare-eth.com';
    }
  }

  static Future<String> _fetchBalance(String address, String chainId) async {
    try {
      final client = Web3Client(_rpcUrl(chainId), http.Client());
      final addr = EthereumAddress.fromHex(address);
      final bal = await client.getBalance(addr);
      await client.dispose();
      final eth = bal.getValueInUnit(EtherUnit.ether);
      return '${eth.toStringAsFixed(4)} ETH';
    } catch (_) {
      return '-- ETH';
    }
  }

  static Future<void> connect() async {
    if (!isMetaMaskAvailable) return;
    try {
      final accounts = await js_util.promiseToFuture<List<dynamic>>(
        js_util.callMethod(
          js.context['ethereum'],
          'request',
          [js_util.jsify({'method': 'eth_requestAccounts'})],
        ),
      );
      if (accounts.isEmpty) return;
      final address = accounts.first as String;
      final chainId = await js_util.promiseToFuture<String>(
        js_util.callMethod(
          js.context['ethereum'],
          'request',
          [js_util.jsify({'method': 'eth_chainId'})],
        ),
      );
      final balance = await _fetchBalance(address, chainId);
      walletNotifier.value = WalletState(
        connected: true,
        address: address,
        chainName: _chainName(chainId),
        balance: balance,
      );
    } catch (_) {}
  }

  static void disconnect() {
    walletNotifier.value = const WalletState();
  }

  static String truncate(String addr) =>
      '${addr.substring(0, 6)}...${addr.substring(addr.length - 4)}';
}

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
    GoRoute(
      path: '/web3',
      builder: (context, state) => const Web3Page(),
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
                  _NavBtn(
                    Translations.t('nav_web3', lang),
                    onTap: () => context.go('/web3'),
                    accent: true,
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
                  const SizedBox(width: 8),
                  const ConnectWalletButton(),
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
  final bool accent;
  const _NavBtn(this.text, {this.onTap, this.accent = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: accent
                ? const Color(0xFF0ea5e9)
                : const Color(0xFF94a3b8),
            letterSpacing: accent ? 1.2 : 0,
          ),
        ),
      ),
    );
  }
}

// --- Web3 Widgets ---

class ConnectWalletButton extends StatelessWidget {
  const ConnectWalletButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<WalletState>(
      valueListenable: walletNotifier,
      builder: (context, wallet, _) {
        final lang = languageNotifier.value;
        if (wallet.connected && wallet.address != null) {
          return OutlinedButton.icon(
            onPressed: WalletService.disconnect,
            icon: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(0xFF22c55e),
                shape: BoxShape.circle,
              ),
            ),
            label: Text(
              WalletService.truncate(wallet.address!),
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFF22c55e), width: 1.5),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        }
        return ElevatedButton.icon(
          onPressed: () async {
            if (!WalletService.isMetaMaskAvailable) {
              context.go('/web3');
            } else {
              await WalletService.connect();
            }
          },
          icon: const Icon(LucideIcons.wallet, size: 14),
          label: Text(
            Translations.t('web3_connect', lang),
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0ea5e9),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      },
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
                connectDots: !isMechanicMode,
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
              isRandomColor: false,
              connectDots: true,
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

// ─────────────────────────────────────────────────────────
// Web3Page
// ─────────────────────────────────────────────────────────

class Web3Page extends StatelessWidget {
  const Web3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppLanguage>(
      valueListenable: languageNotifier,
      builder: (context, lang, _) {
        return ValueListenableBuilder<WalletState>(
          valueListenable: walletNotifier,
          builder: (context, wallet, _) {
            final hasMetaMask = WalletService.isMetaMaskAvailable;
            return Scaffold(
              body: Stack(
                children: [
                  // Background gradient
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: RadialGradient(
                          center: Alignment(-0.6, -0.5),
                          radius: 1.2,
                          colors: [
                            Color(0x200ea5e9),
                            Color(0xFF020617),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40, 130, 40, 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header
                          FadeInDown(
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF0ea5e9).withOpacity(0.12),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: const Color(0xFF0ea5e9).withOpacity(0.3),
                                    ),
                                  ),
                                  child: const Icon(
                                    LucideIcons.link,
                                    color: Color(0xFF0ea5e9),
                                    size: 28,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Translations.t('web3_title', lang),
                                      style: GoogleFonts.spaceGrotesk(
                                        fontSize: 42,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'EVM · Smart Contracts · DeFi',
                                      style: GoogleFonts.spaceGrotesk(
                                        fontSize: 14,
                                        color: const Color(0xFF0ea5e9),
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          FadeInLeft(
                            child: Text(
                              Translations.t('web3_subtitle', lang),
                              style: const TextStyle(
                                fontSize: 17,
                                color: Color(0xFF94a3b8),
                                height: 1.6,
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),

                          // Wallet Card
                          FadeInUp(
                            child: _WalletCard(
                              wallet: wallet,
                              lang: lang,
                              hasMetaMask: hasMetaMask,
                            ),
                          ),
                          const SizedBox(height: 60),

                          // Why Web3 section
                          FadeInUp(
                            delay: const Duration(milliseconds: 200),
                            child: Text(
                              Translations.t('web3_what_title', lang),
                              style: GoogleFonts.spaceGrotesk(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          FadeInUp(
                            delay: const Duration(milliseconds: 250),
                            child: Text(
                              Translations.t('web3_what_desc', lang),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF94a3b8),
                                height: 1.7,
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),

                          // Feature cards grid
                          GridView.count(
                            crossAxisCount:
                                ResponsiveBreakpoints.of(context).isDesktop ? 3 : 1,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 1.6,
                            children: [
                              _Web3FeatureCard(
                                icon: LucideIcons.coins,
                                title: Translations.t('web3_card1_title', lang),
                                desc: Translations.t('web3_card1_desc', lang),
                                color: const Color(0xFF0ea5e9),
                              ),
                              _Web3FeatureCard(
                                icon: LucideIcons.gem,
                                title: Translations.t('web3_card2_title', lang),
                                desc: Translations.t('web3_card2_desc', lang),
                                color: const Color(0xFFf97316),
                              ),
                              _Web3FeatureCard(
                                icon: LucideIcons.vote,
                                title: Translations.t('web3_card3_title', lang),
                                desc: Translations.t('web3_card3_desc', lang),
                                color: const Color(0xFF8b5cf6),
                              ),
                            ],
                          ),
                          const SizedBox(height: 60),
                          const FooterSection(),
                        ],
                      ),
                    ),
                  ),
                  const NavBar(),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _WalletCard extends StatefulWidget {
  final WalletState wallet;
  final AppLanguage lang;
  final bool hasMetaMask;
  const _WalletCard({
    required this.wallet,
    required this.lang,
    required this.hasMetaMask,
  });
  @override
  State<_WalletCard> createState() => _WalletCardState();
}

class _WalletCardState extends State<_WalletCard> {
  bool _loading = false;

  Future<void> _handleConnect() async {
    setState(() => _loading = true);
    await WalletService.connect();
    if (mounted) setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    final lang = widget.lang;
    final wallet = widget.wallet;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.all(36),
          decoration: BoxDecoration(
            color: const Color(0xFF0f172a).withOpacity(0.7),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: wallet.connected
                  ? const Color(0xFF22c55e).withOpacity(0.4)
                  : const Color(0xFF0ea5e9).withOpacity(0.2),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: (wallet.connected
                        ? const Color(0xFF22c55e)
                        : const Color(0xFF0ea5e9))
                    .withOpacity(0.08),
                blurRadius: 40,
                spreadRadius: 5,
              ),
            ],
          ),
          child: wallet.connected
              ? _connectedView(lang, wallet)
              : !widget.hasMetaMask
                  ? _noMetaMaskView(lang)
                  : _connectView(lang),
        ),
      ),
    );
  }

  Widget _connectedView(AppLanguage lang, WalletState wallet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Color(0xFF22c55e),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              Translations.t('web3_connected', lang),
              style: GoogleFonts.spaceGrotesk(
                fontSize: 13,
                color: const Color(0xFF22c55e),
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),
        _InfoRow(
          icon: LucideIcons.user,
          label: Translations.t('web3_address', lang),
          value: wallet.address ?? '',
          monospace: true,
        ),
        const SizedBox(height: 16),
        _InfoRow(
          icon: LucideIcons.network,
          label: Translations.t('web3_network', lang),
          value: wallet.chainName ?? '--',
        ),
        const SizedBox(height: 16),
        _InfoRow(
          icon: LucideIcons.coins,
          label: Translations.t('web3_balance', lang),
          value: wallet.balance ?? '--',
          valueColor: const Color(0xFF22c55e),
        ),
        const SizedBox(height: 32),
        OutlinedButton.icon(
          onPressed: WalletService.disconnect,
          icon: const Icon(LucideIcons.logOut, size: 16),
          label: Text(Translations.t('web3_disconnect', lang)),
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF94a3b8),
            side: const BorderSide(color: Color(0xFF334155)),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          ),
        ),
      ],
    );
  }

  Widget _connectView(AppLanguage lang) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: const Color(0xFF94a3b8).withOpacity(0.5),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              Translations.t('web3_disconnected', lang),
              style: GoogleFonts.spaceGrotesk(
                fontSize: 13,
                color: const Color(0xFF94a3b8),
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),
        Text(
          Translations.t('web3_connect', lang),
          style: GoogleFonts.spaceGrotesk(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'MetaMask · WalletConnect · EVM',
          style: TextStyle(color: Color(0xFF64748b), fontSize: 14),
        ),
        const SizedBox(height: 32),
        ElevatedButton.icon(
          onPressed: _loading ? null : _handleConnect,
          icon: _loading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : const Icon(LucideIcons.wallet, size: 18),
          label: Text(
            _loading ? '...' : Translations.t('web3_connect', lang),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0ea5e9),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _noMetaMaskView(AppLanguage lang) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(LucideIcons.alertTriangle,
                color: Color(0xFFf97316), size: 20),
            const SizedBox(width: 10),
            Text(
              Translations.t('web3_no_metamask', lang),
              style: GoogleFonts.spaceGrotesk(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFf97316),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          Translations.t('web3_no_metamask_desc', lang),
          style: const TextStyle(
            color: Color(0xFF94a3b8),
            fontSize: 15,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 28),
        ElevatedButton.icon(
          onPressed: () async {
            final url = Uri.parse('https://metamask.io/download/');
            if (await canLaunchUrl(url)) launchUrl(url);
          },
          icon: const Icon(LucideIcons.externalLink, size: 16),
          label: Text(Translations.t('web3_install', lang)),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFf97316),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool monospace;
  final Color? valueColor;
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.monospace = false,
    this.valueColor,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: const Color(0xFF0ea5e9)),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label.toUpperCase(),
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF64748b),
                letterSpacing: 1.2,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              value,
              style: TextStyle(
                fontSize: 14,
                color: valueColor ?? Colors.white,
                fontFamily: monospace ? 'monospace' : null,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Web3FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;
  final Color color;
  const _Web3FeatureCard({
    required this.icon,
    required this.title,
    required this.desc,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF0f172a).withOpacity(0.6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.06),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              desc,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF94a3b8),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
