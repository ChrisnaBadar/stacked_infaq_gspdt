import 'package:flutter/material.dart';
import 'package:infaq/ui/common/app_shared_style.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PrivacyPolicyTextWidget extends StatelessWidget {
  const PrivacyPolicyTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.justify,
      TextSpan(
        children: <TextSpan>[
          // Heading: Kebijakan Privasi
          TextSpan(
            text: 'Kebijakan Privasi\n',
            style: ktsBodyLarge.copyWith(
                fontWeight: FontWeight.w700, fontSize: 18),
          ),
          // Sub-heading: Pendahuluan
          TextSpan(
            text: '\nPendahuluan\n',
            style: ktsBodyLarge.copyWith(
                fontWeight: FontWeight.w700, fontSize: 16),
          ),
          // Content: Pendahuluan
          TextSpan(
            text:
                'Laman ini dirancang untuk memberitahukan Anda tentang kebijakan yang diterapkan oleh PT. Global Solution Provider (disebut "AmalaApp" atau "Kami") berkaitan dengan proses pengambilan, pemakaian, penyimpanan, pembaruan, penyebaran, dan penghapusan informasi pribadi Anda yang kami peroleh melalui penggunaan aplikasi AmalaApp ("Aplikasi") dan website yang dijalankan di domain serta sub-domain Amala.gspdt.co.id / gspdt.co.id ("Website").\nInformasi Pribadi yang Anda berikan melalui Aplikasi/Website AmalaApp ditujukan eksklusif untuk kepentingan AmalaApp. Kami memanfaatkan Informasi Pribadi Anda semata-mata untuk tujuan pengembangan dan peningkatan mutu layanan AmalaApp atau keperluan lain yang sesuai dan tidak melanggar hukum yang berlaku di Indonesia, seperti yang diuraikan dalam Kebijakan Perlindungan Data Pribadi ini.\nDengan menyerahkan Informasi Pribadi Anda di Aplikasi/Website AmalaApp, Anda menyatakan persetujuan Anda terhadap syarat dan ketentuan yang ditetapkan dalam Kebijakan Perlindungan Data Pribadi Layanan AmalaApp ini. Dalam mengolah Informasi Pribadi Anda, AmalaApp mungkin berkolaborasi dengan pihak ketiga lainnya, dengan tetap mendapatkan izin dari Anda sebagai pemilik Informasi Pribadi dan selalu mengutamakan aspek kerahasiaan dari Informasi Pribadi Anda.\nKami berdedikasi untuk menjaga kerahasiaan Anda. Kami bertekad untuk menjamin semua pihak bahwa kami tidak akan menjual informasi Anda kepada entitas mana pun yang tidak relevan, mengingat kami sangat menghargai kerahasiaan Anda.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Sub-heading: Informasi Pribadi
          TextSpan(
            text: '\nInformasi Pribadi\n',
            style: ktsBodyLarge.copyWith(
                fontWeight: FontWeight.w700, fontSize: 16),
          ),
          // Content: Informasi Pribadi
          TextSpan(
            text:
                'Dalam konteks Kebijakan Privasi ini, "Informasi Pribadi" merujuk pada segala detail otentik dan spesifik yang secara inheren terkait dan dapat digunakan untuk mengidentifikasi individu secara langsung atau tidak langsung saat berinteraksi dengan Aplikasi/Situs AmalaApp.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Further sections can be added here in the same pattern

          // Sub-heading: Objektif Kebijakan Ini
          TextSpan(
            text: '\nObjektif Kebijakan Ini\n',
            style: ktsBodyLarge.copyWith(
                fontWeight: FontWeight.w700, fontSize: 16),
          ),
          // Content: Objektif Kebijakan Ini
          TextSpan(
            text:
                'Kebijakan Privasi ini bertujuan untuk memaparkan metode pengumpulan, penyimpanan, dan penggunaan data pribadi Anda selama Anda mengakses atau memanfaatkan Situs atau Aplikasi AmalaApp. Lebih lanjut, dokumen ini menguraikan jenis data pribadi yang kami kumpul dan bagaimana kami memanfaatkan data tersebut untuk memastikan penyediaan layanan kami berlangsung optimal.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Sub-heading: Cara Kami Mengumpulkan Informasi Pribadi Anda
          TextSpan(
            text: '\nCara Kami Mengumpulkan Informasi Pribadi Anda\n',
            style: ktsBodyLarge.copyWith(
                fontWeight: FontWeight.w700, fontSize: 16),
          ),
          // Content: Cara Kami Mengumpulkan Informasi Pribadi Anda
          TextSpan(
            text:
                'Proses pengumpulan informasi pribadi Anda terjadi saat Anda mendaftarkan diri untuk menggunakan Aplikasi AmalaApp. Kami memperoleh informasi pribadi khusus seperti nama, nomor telepon, alamat email, tanggal lahir, dan gender Anda setelah mendapatkan persetujuan Anda terlebih dahulu.\nJenis Data Pribadi dan Informasi yang Dikumpulkan oleh Kami:\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Sub-heading: Penggunaan Informasi Pribadi
          TextSpan(
            text: '\nDetail Perangkat\n',
            style: ktsBodyLarge.copyWith(
                fontWeight: FontWeight.w700, fontSize: 16),
          ),
          // Content: Penggunaan Informasi Pribadi
          TextSpan(
            text:
                'Kami mengumpulkan detail perangkat Anda termasuk tipe perangkat keras, sistem operasi yang digunakan, identitas unik perangkat, data jaringan seluler, dan lokasi dasar. Kami menggunakan data ini untuk memperbaiki pengalaman Anda dalam menggunakan aplikasi kami dan memberikan masukan untuk peningkatan kualitas Aplikasi AmalaApp.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Sub-heading: Pengungkapan Informasi Pribadi
          TextSpan(
            text: '\nEmail Anda\n',
            style: ktsBodyLarge.copyWith(
                fontWeight: FontWeight.w700, fontSize: 16),
          ),
          // Content: Pengungkapan Informasi Pribadi
          TextSpan(
            text:
                'Untuk proses masuk menggunakan Google dan Facebook yang AmalaApp tawarkan, tujuannya adalah untuk mengenali Anda saat mengakses fitur yang memerlukan verifikasi identitas. Alamat email Anda secara otomatis akan tersimpan dalam database cloud kami ketika Anda memanfaatkan fitur tersebut. Kami menjamin Google dan Facebook tidak memiliki akses ke kata sandi Anda, dan kami hanya mengumpulkan alamat email untuk memudahkan pengelolaan bookmark Anda. Keamanan akun email Anda tetap terjaga.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Sub-heading: Keamanan Informasi Pribadi
          TextSpan(
            text: '\nData Lokasi\n',
            style: ktsBodyLarge.copyWith(
                fontWeight: FontWeight.w700, fontSize: 16),
          ),
          // Content: Keamanan Informasi Pribadi
          TextSpan(
            text:
                'AmalaApp membutuhkan akses ke GPS untuk mengaktifkan fitur Jadwal Sholat agar berfungsi secara akurat, membutuhkan informasi geografis Anda untuk menghitung waktu sholat. Data lokasi yang kami kumpulkan hanya mencakup area umum, tanpa detil seperti nama kota atau negara.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),

          // Sub-heading: Hak Anda
          TextSpan(
            text: '\nIzin Penyimpanan\n',
            style: ktsBodyLarge.copyWith(
                fontWeight: FontWeight.w700, fontSize: 16),
          ),
          // Content: Hak Anda
          TextSpan(
            text:
                'Kami memerlukan akses ke penyimpanan perangkat Anda agar beberapa fitur aplikasi, seperti pengunduhan file audio dan gambar, dapat berfungsi dengan baik.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Sub-heading: Kebijakan Cookie
          TextSpan(
            text: '\nCookie\n',
            style: ktsBodyLarge.copyWith(
                fontWeight: FontWeight.w700, fontSize: 16),
          ),
          // Content: Kebijakan Cookie
          TextSpan(
            text:
                'Cookie merupakan file kecil yang disimpan oleh browser internet pada perangkat Anda. Ini memungkinkan situs web untuk menyimpan informasi atau mengingat preferensi Anda seiring waktu. Walaupun kebanyakan browser mendukung cookie, Anda bisa mengatur browser untuk menolak cookie tertentu. Kami menggunakan cookie untuk berbagai tujuan, seperti mengingat preferensi Anda selama menggunakan Aplikasi AmalaApp.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Sub-heading: Tautan ke Situs Lain
          TextSpan(
            text: '\nPengelolaan Data Pribadi\n',
            style: ktsBodyLarge.copyWith(
                fontWeight: FontWeight.w700, fontSize: 16),
          ),
          // Content: Tautan ke Situs Lain
          TextSpan(
            text:
                'Anda menyetujui bahwa AmalaApp berhak untuk menggunakan, menyimpan, memanfaatkan, dan mengungkapkan data pribadi Anda kepada pihak ketiga terkait, termasuk afiliasi kami, sesuai dengan persetujuan yang Anda berikan baik saat menyediakan data pribadi maupun ketika Anda menyetujui perubahan kebijakan privasi kami, untuk tujuan-tujuan berikut:\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // dotted

          // Sub-heading: Perubahan pada Kebijakan Privasi Ini
          TextSpan(
            text: '\nKeamanan Informasi\n',
            style: ktsBodyLarge.copyWith(
                fontWeight: FontWeight.w700, fontSize: 16),
          ),
          // Content: Perubahan pada Kebijakan Privasi Ini
          TextSpan(
            text:
                'Kami menerapkan langkah keamanan administratif dan teknis untuk menjaga kerahasiaan data pribadi Anda, termasuk alamat email, melalui penggunaan server pribadi.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Concluding Statement
          TextSpan(
            text: '\nPerlindungan Data Pribadi\n',
            style: ktsBodyLarge.copyWith(
                fontWeight: FontWeight.w700, fontSize: 16),
          ),
          // Content: Concluding Statement
          TextSpan(
            text:
                'AmalaApp berdedikasi untuk melindungi data pribadi pengguna dengan menerapkan langkah teknis dan organisasi yang sesuai. Namun, penting untuk diingat bahwa tidak ada sistem yang sepenuhnya aman. Kami telah menerapkan kebijakan seperti pseudonimisasi, enkripsi, dan penyimpanan yang aman untuk mencegah akses tidak sah.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),

          // Concluding Statement
          TextSpan(
            text: '\nTautan Eksternal\n',
            style: ktsBodyLarge.copyWith(
                fontWeight: FontWeight.w700, fontSize: 16),
          ),
          // Content: Concluding Statement
          TextSpan(
            text:
                'Situs dan aplikasi kami mungkin menampilkan iklan dan promosi dari pihak ketiga yang bisa mengarahkan Anda ke situs lain. Kami tidak bertanggung jawab atas praktik privasi atau konten dari situs pihak ketiga tersebut. Harap berhati-hati saat memberikan data pribadi di situs lain dan membaca kebijakan privasi mereka.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),

          // Concluding Statement
          TextSpan(
            text: '\nPerubahan Kebijakan Privasi\n',
            style: ktsBodyLarge.copyWith(
                fontWeight: FontWeight.w700, fontSize: 16),
          ),
          // Content: Concluding Statement
          TextSpan(
            text:
                'Kami berhak memperbarui Kebijakan Privasi ini sesuai kebutuhan. Perubahan akan diumumkan melalui Aplikasi/Situs AmalaApp. Kami menyarankan Anda untuk secara berkala meninjau bagian ini untuk informasi terbaru.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),

          // Concluding Statement
          TextSpan(
            text: '\nDisclaimer\n',
            style: ktsBodyLarge.copyWith(
                fontWeight: FontWeight.w700, fontSize: 16),
          ),
          // Content: Concluding Statement
          TextSpan(
            text:
                'Aplikasi AmalaApp adalah hak milik penuh dari AmalaApp. Kami berhak untuk memperbarui, mengedit, atau menghapus informasi yang disediakan. Kami menghimbau Anda untuk selalu memeriksa aplikasi atau situs kami untuk informasi layanan terbaru.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),

          // Concluding Statement
          TextSpan(
            text: '\nKontak Kami\n',
            style: ktsBodyLarge.copyWith(
                fontWeight: FontWeight.w700, fontSize: 16),
          ),
          // Content: Concluding Statement
          TextSpan(
            text:
                'Terima kasih telah membaca Kebijakan Privasi kami. Jika Anda memiliki pertanyaan, silakan hubungi layanan pelanggan kami di WA: 0813 1302 3004 atau kirimkan email ke amala@gspdt.co.id.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
