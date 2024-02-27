import 'package:flutter/material.dart';
import 'package:infaq/ui/common/app_shared_style.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TermsConditionsTextWidget extends StatelessWidget {
  const TermsConditionsTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign:
          getValueForScreenType(context: context, mobile: TextAlign.justify),
      TextSpan(
        children: <TextSpan>[
          // Heading
          TextSpan(
            text: 'Syarat dan Ketentuan\n',
            style: ktsBodyLarge.copyWith(
                fontWeight: FontWeight.w900, fontSize: 18),
          ),
          // Subheading
          TextSpan(
            text:
                'Bismillaahirrohmaanirrohiim\nAssalamu’alaikum Warahmatullohi Wabarakatuh\n',
            style: ktsBodyRegular.copyWith(
                fontSize: 16, fontStyle: FontStyle.italic),
          ),
          // Paragraph
          TextSpan(
            text:
                '\nKetika Anda memberikan kontribusi berupa infaq, zakat, atau wakaf melalui Amala Infaq Online, akan ada biaya transaksi yang dikenakan oleh penyedia layanan pembayaran eksternal, detailnya bisa diperiksa di tautan berikut. Selain itu, ada juga biaya layanan platform yang dipergunakan untuk mendukung kegiatan syiar Al Quran melalui Amala App, informasi lebih lanjut mengenai biaya ini dapat ditemukan di tautan berikut.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Paragraph
          TextSpan(
            text:
                '\nSelamat datang di situs amala.gspdt.co.id dan Aplikasi Amala App, suatu ekosistem digital untuk komunitas pengajian dan kelompok belajar online. Kami mengundang Anda untuk membaca Syarat dan Ketentuan Penggunaan kami secara saksama. Dokumen ini memuat aturan yang mengatur akses serta penggunaan Aplikasi Amala App. Dengan menggunakan aplikasi ini, Anda menyatakan persetujuan terhadap Syarat dan Ketentuan yang telah kami tetapkan.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Paragraph
          TextSpan(
            text:
                '\nHanya pengguna terdaftar dengan akun yang dapat mengakses fitur tertentu yang dilindungi kata sandi dalam Aplikasi dan/atau menggunakan layanan kami secara terbatas. Kami melarang keras upaya untuk memperoleh akses tanpa izin ke dalam fitur terlindungi atau layanan lainnya. Pelanggaran atas aturan ini akan ditindak sesuai dengan hukum Indonesia dan peraturan yang berlaku.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Subheading
          TextSpan(
            text: '\nPendahuluan',
            style: ktsBodyRegular.copyWith(
                fontSize: 16, fontWeight: FontWeight.w700),
          ),
          // Paragraph
          TextSpan(
            text:
                '\nKami ucapkan selamat datang dan terima kasih telah memutuskan untuk bergabung bersama Amala App, sebuah platform komunitas untuk pengajian dan kelompok belajar online. Dengan proses pendaftaran, penggunaan layanan, situs web, atau aplikasi kami, serta mengakses konten atau material yang disediakan, Anda secara resmi menyetujui dan terikat pada kesepakatan dengan entitas Amala App sesuai dengan ketentuan yang diuraikan berikut ini.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Paragraph
          TextSpan(
            text:
                '\nKami menghargai keputusan Anda untuk mempercayakan Amala App sebagai mitra belajar Anda dan ingin menegaskan bahwa dengan melanjutkan, Anda telah mengonfirmasi pemahaman dan penerimaan Anda terhadap syarat dan ketentuan yang tercantum dalam Perjanjian ini, dan berkomitmen untuk mematuhinya.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),

          // Subheading
          TextSpan(
            text: '\nSyarat Penggunaan Aplikasi',
            style: ktsBodyRegular.copyWith(
                fontSize: 16, fontWeight: FontWeight.w700),
          ),
          // Paragraph
          TextSpan(
            text:
                '\nDengan mendaftar pada platform kami, Anda memberikan persetujuan untuk pengumpulan dan pengolahan data pribadi Anda, termasuk namun tidak terbatas pada alamat email, nama lengkap, tanggal lahir, jenis kelamin, nomor telepon, dan negara asal. Kami mengharapkan partisipasi Anda untuk menyediakan data yang akurat dan terkini, termasuk kepatuhan dalam memberikan dokumen identifikasi sesuai permintaan kami untuk verifikasi. Harap beritahu kami segera apabila terdapat perubahan informasi yang telah Anda berikan, seperti perubahan pada alamat email atau nomor telepon.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Paragraph
          TextSpan(
            text:
                '\nDengan menggunakan layanan ini, Anda wajib mengikuti segala aturan, petunjuk, kebijakan, dan peraturan yang kami tetapkan terkait dengan Amala App, termasuk segala perubahan yang mungkin kami lakukan dari waktu ke waktu. Anda akan dianggap telah mengetahui dan menyetujui segala perubahan yang kami publikasikan melalui aplikasi atau melalui sarana komunikasi lainnya.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Paragraph
          TextSpan(
            text:
                '\nAnda berkomitmen untuk tidak menggunakan Amala App untuk kegiatan yang tidak sah, mencoba mengakses secara ilegal, atau mengganggu operasional dan penggunaan normal dari aplikasi. Penggunaan Amala App dibolehkan hanya setelah Anda menyelesaikan proses pendaftaran, dimana Anda akan mendapatkan hak untuk mengunduh dan mengakses Amala App.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),

          // Subheading
          TextSpan(
            text: '\nMenggali Kemudahan dengan Amala App',
            style: ktsBodyRegular.copyWith(
                fontSize: 16, fontWeight: FontWeight.w700),
          ),
          // Paragraph
          TextSpan(
            text:
                '\nDengan Amala App, Anda akan mendapatkan akses ke beragam Fitur dan konten eksklusif. Kami menyediakan beberapa fitur tanpa biaya sebagai bagian dari Layanan Gratis kami, sementara fitur-fitur lainnya tersedia melalui pembelian dalam aplikasi di Google Playstore atau Apple Appstore, yang kami sebut sebagai Layanan Premium. Kami berkomitmen untuk memberikan penjelasan terperinci tentang layanan yang akan Anda terima saat Anda memilih untuk berlangganan layanan kami.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),

          // Subheading
          TextSpan(
            text: '\nPetunjuk Penggunaan Aplikasi Amala App',
            style: ktsBodyRegular.copyWith(
                fontSize: 16, fontWeight: FontWeight.w700),
          ),
          // Paragraph
          TextSpan(
            text:
                '\nDengan mengutamakan penghormatan terhadap hak kekayaan intelektual, Aplikasi Amala App menetapkan serangkaian pedoman dasar untuk diikuti oleh penggunanya agar pengalaman menggunakan aplikasi ini tetap menyenangkan dan sesuai dengan norma hukum. Kami mengajak Anda untuk mematuhi panduan berikut selama interaksi Anda dengan Aplikasi Amala App.\nAdapun tindakan-tindakan yang dilarang keras meliputi:\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          TextSpan(
            text:
                '\n1. Memperbanyak, mendistribusikan, meniru, atau mengekspos konten kepada khalayak ramai tanpa menyatakan bahwa materi tersebut merupakan hak milik Amala App, yang merupakan pelanggaran terhadap hak kekayaan intelektual termasuk namun tidak terbatas pada hak cipta, terkait dengan Konten dan Fitur dari Amala App atau segmen darinya.',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          TextSpan(
            text:
                '\n2. Melakukan reverse engineering, dekompilasi, disasembli, modifikasi, atau menciptakan karya yang berasal dari Konten dan Fitur Amala App atau segmen darinya tanpa izin dari perundang-undangan yang berlaku.',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          TextSpan(
            text:
                '\n3. Menghilangkan atau mengubah hak cipta, tanda dagang, atau notifikasi kekayaan intelektual lainnya yang tercantum dalam atau yang disediakan melalui Konten dan Fitur Amala App (termasuk tetapi tidak terbatas pada tujuan untuk menyembunyikan atau memodifikasi indikasi kepemilikan atau asal-usul Materi).\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Paragraph
          TextSpan(
            text:
                '\nKami menyediakan hak akses kepada Anda untuk menggunakan aplikasi Amala App beserta kontennya melalui lisensi, bukan penjualan, dengan Amala App tetap memegang hak kepemilikan atas semua salinan aplikasi dan kontennya meskipun telah terpasang di perangkat mobile, tablet, atau perangkat lain yang Anda gunakan.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Paragraph
          TextSpan(
            text:
                '\nKepemilikan atas semua merek dagang, merek layanan, nama dagang, logo, nama domain, dan elemen identitas merek lainnya dari Amala App tetap berada di bawah kendali Amala App. Anda tidak diberikan hak untuk menggunakan elemen-elemen merek tersebut untuk tujuan apapun tanpa izin.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Paragraph
          TextSpan(
            text:
                '\nAnda memiliki kebebasan untuk mengakses dan menggunakan fitur-fitur dalam Aplikasi Amala App sesuai dengan kebutuhan pribadi Anda, termasuk akses ke "Layanan Gratis" dan "Layanan Premium" yang telah Anda bayar.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Paragraph
          TextSpan(
            text:
                '\nDengan menggunakan Aplikasi Amala App, Anda berkomitmen untuk mengikuti ketentuan penggunaan yang telah ditetapkan dan tidak akan menggunakannya untuk tujuan yang tidak diizinkan oleh kesepakatan ini. Hak, kepemilikan, atau kepentingan apa pun terkait Konten dan Fitur Aplikasi Amala App, selain yang secara eksplisit diberikan kepada Anda, tetap berada pada Amala App.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Paragraph
          TextSpan(
            text:
                '\nDengan memanfaatkan layanan yang kami tawarkan melalui Amala App, Anda secara otomatis memberi kami izin untuk:\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Bullet points or numbered list
          TextSpan(
            text:
                '\n• Menggunakan sumber daya dari perangkat Anda, termasuk prosesor, bandwidth, dan perangkat keras penyimpanan, untuk memastikan pengoperasian yang lancar dari konten dan fitur yang tersedia di Amala App.',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Bullet points or numbered list
          TextSpan(
            text:
                '\n• Menampilkan iklan dan informasi relevan lainnya kepada Anda.',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Bullet points or numbered list
          TextSpan(
            text:
                '\n• Memperbolehkan para mitra kami untuk menggunakan hak yang sama. Sebagai bagian dari layanan yang kami sediakan, konten yang Anda akses, termasuk cara konten tersebut ditampilkan dan ditempatkan, mungkin dipengaruhi oleh kepentingan bisnis. Ini termasuk konten yang kami lisensikan atau sediakan khusus untuk Amala App, seperti podcast, yang mungkin termasuk iklan sebagai bagian integral dari konten tersebut. Dalam situasi seperti itu, kami berkomitmen untuk menyajikan konten ini kepada Anda dalam format aslinya, tanpa modifikasi.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),

          // Paragraph
          TextSpan(
            text:
                '\nPlatform Amala Infaq Online merupakan kolaborasi antara Aplikasi Amala dan beragam mitra terpercaya, termasuk Lembaga Amil Zakat, institusi pendidikan, Dewan Kemakmuran Masjid (DKM), serta komunitas sosial yang beroperasi di Indonesia. Platform ini dirancang untuk mendukung berbagai aktivitas sosial yang diinisiasi oleh para mitra kami. Melalui layanan ini, kami menawarkan:\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Bullet points or numbered list
          TextSpan(
            text:
                '\n• Akses informasi terkait inisiatif sosial yang diperkenalkan oleh mitra kami.',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Bullet points or numbered list
          TextSpan(
            text:
                '\n• Seruan untuk mendukung kegiatan sosial dengan kajian dan pemahaman ayat-ayat Al Quran.',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Bullet points or numbered list
          TextSpan(
            text:
                '\n• Kesempatan untuk berkontribusi pada kegiatan sosial melalui infaq dalam bentuk materi.',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Bullet points or numbered list
          TextSpan(
            text:
                '\n• Kemudahan dalam melakukan infaq, zakat, dan wakaf melalui berbagai metode pembayaran seperti transfer bank, e-wallet, mobile banking, dan internet banking, serta opsi pembayaran lain yang disediakan oleh pihak ketiga.',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Bullet points or numbered list
          TextSpan(
            text:
                '\n• Penyampaian laporan aktivitas sosial yang diorganisir oleh mitra kepada pengguna.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),

          // Paragraph
          TextSpan(
            text:
                '\nMengenai opsi pembayaran dari pihak ketiga, pengguna setuju untuk mengikuti ketentuan berikut:\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          TextSpan(
            text:
                '\n1. Semua infaq, zakat, dan wakaf akan dikelola melalui rekening Amala App, yang dijaga agar terbebas dari pendapatan bunga, bagi hasil, atau pendapatan lainnya.',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          TextSpan(
            text:
                '\n2. Amala App tidak berhak menggunakan dana infaq, zakat, atau wakaf yang sedang dikelola.',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          TextSpan(
            text:
                '\n3. Informasi yang diberikan selama transaksi infaq, zakat, atau wakaf akan diserahkan kepada pihak penggalang dana untuk tujuan pelaporan dan keperluan lain yang berkaitan dengan program sosial yang mereka kelola.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),

          // Paragraph
          TextSpan(
            text:
                '\nSetiap kontribusi Anda dalam bentuk zakat, infaq, atau wakaf yang Anda lakukan melalui platform ini akan tertunduk pada tarif transaksi yang telah ditetapkan oleh penyedia layanan pembayaran kami, termasuk pajak yang berlaku. Berikut adalah rincian biaya transaksi untuk berbagai metode pembayaran:\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          TextSpan(
            text: '\n1. Transfer melalui Bank: Rp 3.850 per transaksi',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          TextSpan(
            text: '\n2. Menggunakan LinkAja: 1.5% dari jumlah transaksi',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          TextSpan(
            text: '\n3. Pembayaran via OVO: 3% dari total transaksi',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          TextSpan(
            text: '\n4. Transaksi dengan GO-Pay: 2% dari nilai transaksi',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          TextSpan(
            text: '\n5. Melalui DANA: 1.65% dari transaksi',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          TextSpan(
            text:
                '\n6. Shopee-Pay menetapkan biaya sebesar 1.5% per transaksi\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),

          // Paragraph
          TextSpan(
            text:
                '\nJumlah yang disumbangkan melalui infaq, zakat, atau wakaf setelah pemotongan biaya transaksi (jumlah bersih) akan dikenai biaya penggunaan platform. Biaya ini digunakan untuk mendukung penyebaran ajaran Al Quran melalui aplikasi Amala. Rinciannya adalah sebagai berikut:\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Bullet points or numbered list
          TextSpan(
            text:
                '\n• Untuk infaq, biaya layanan ditentukan berdasarkan perjanjian dengan mitra penggalangan dana, dengan batas maksimal 5% dari jumlah bersih.',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Bullet points or numbered list
          TextSpan(
            text:
                '\n• Untuk zakat, biaya layanan disesuaikan dengan kesepakatan bersama mitra penggalangan zakat, mengikuti ketentuan hak amil.',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Bullet points or numbered list
          TextSpan(
            text:
                '\n• Untuk wakaf, dikenakan biaya sebesar 5% dari jumlah bersih.',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Bullet points or numbered list
          TextSpan(
            text:
                '\n• Penggalangan dana untuk bencana alam tidak akan dikenakan biaya layanan platform.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),

          // Subheading
          TextSpan(
            text: '\nHak Milik Intelektual',
            style: ktsBodyRegular.copyWith(
                fontSize: 16, fontWeight: FontWeight.w700),
          ),
          // Paragraph
          TextSpan(
            text:
                '\nSeluruh konten dan fitur dari Aplikasi Amala merupakan hak eksklusif Amala App. Anda menyetujui untuk menggunakan konten dan fitur tersebut secara pribadi dan tidak untuk keperluan komersial. Anda dilarang keras menyalin, meniru, menyebarkan, mengirimkan, menyiarkan, menampilkan, menjual, memberi lisensi, atau memanfaatkan konten dan fitur ini untuk tujuan apapun tanpa mendapatkan izin tertulis dari Amala App terlebih dahulu.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
          // Paragraph
          TextSpan(
            text:
                '\nNama dan logo Amala App, beserta aplikasi dan layanannya, adalah subjek yang dilindungi oleh hak cipta, merek dagang, dan hak lainnya sesuai dengan legislasi Republik Indonesia. Kami memegang seluruh hak, title, dan kepentingan atas Aplikasi Amala App, termasuk namun tidak terbatas pada hak kekayaan intelektual terkait. Anda berkomitmen untuk tidak melakukan penggunaan, penyalinan, atau distribusi dari data yang tidak diperkenankan, termasuk namun tidak terbatas pada konten yang diunduh dari aplikasi ini untuk keperluan komersial.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),

          // Subheading
          TextSpan(
            text: '\nBatasan Layanan dan Perubahan',
            style: ktsBodyRegular.copyWith(
                fontSize: 16, fontWeight: FontWeight.w700),
          ),
          // Paragraph
          TextSpan(
            text:
                '\nAmala App berkomitmen untuk melakukan usaha terbaiknya dalam menjaga ketersediaan layanan aplikasi secara konsisten. Akan tetapi, gangguan sementara mungkin terjadi karena masalah teknis atau kebutuhan pemeliharaan. Dalam batasan yang diizinkan oleh hukum yang berlaku, Amala App memiliki hak untuk sesekali mengubah atau menghentikan, baik sementara maupun permanen, fitur dan fungsi Aplikasi Amala App, dengan atau tanpa pemberitahuan terlebih dahulu, tanpa ada kewajiban terhadap Anda, kecuali apabila dilarang oleh hukum, untuk setiap gangguan, modifikasi, atau penghentian layanan Aplikasi Amala atau fitur-fiturnya. Anda menyadari, setuju, dan menerima semua pernyataan di atas.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),

          // Subheading
          TextSpan(
            text: '\nKontak Kami',
            style: ktsBodyRegular.copyWith(
                fontSize: 16, fontWeight: FontWeight.w700),
          ),
          // Paragraph
          TextSpan(
            text:
                '\nApabila Anda membutuhkan informasi lebih lanjut atau memiliki pertanyaan seputar Aplikasi Amala App, jangan ragu untuk menghubungi tim dukungan pelanggan kami. Anda bisa mengirimkan pesan WhatsApp ke nomor 0813 1302 3004 atau mengirimkan email pertanyaan Anda ke alamat amala@gspdt.co.id. Kami siap membantu Anda dengan segala kebutuhan terkait aplikasi kami.\n',
            style: ktsBodyRegular.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
