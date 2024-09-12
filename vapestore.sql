SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS `vapestore` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vapestore`;

CREATE TABLE `admin` (
  `ID_ADMIN` int(11) NOT NULL,
  `NAMA_ADMIN` varchar(255) DEFAULT NULL,
  `EMAIL_ADMIN` varchar(255) DEFAULT NULL,
  `USERNAME_ADMIN` varchar(255) DEFAULT NULL,
  `PASSWORD_ADMIN` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `admin` (`ID_ADMIN`, `NAMA_ADMIN`, `EMAIL_ADMIN`, `USERNAME_ADMIN`, `PASSWORD_ADMIN`) VALUES
(1, 'Admin', 'admin@gmail.com', 'admin', 'iniadmin');

CREATE TABLE `product` (
  `ID_PRODUCT` int(11) NOT NULL,
  `ID_ADMIN` int(11) DEFAULT NULL,
  `NAME_PRODUCT` varchar(255) DEFAULT NULL,
  `PRICE_PRODUCT` decimal(10,0) DEFAULT NULL,
  `KATEGORI_PRODUCT` varchar(255) DEFAULT NULL,
  `DESK_PRODUCT` varchar(512) DEFAULT NULL,
  `GAMBAR_PRODUCT` varchar(255) DEFAULT NULL,
  `STOK_BARANG` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `product` (`ID_PRODUCT`, `ID_ADMIN`, `NAME_PRODUCT`, `PRICE_PRODUCT`, `KATEGORI_PRODUCT`, `DESK_PRODUCT`, `GAMBAR_PRODUCT`, `STOK_BARANG`) VALUES
(1, 1, 'RDA Druga 24mm', '115000', 'Atomizer', 'Atomizer RDA Druga dengan diameter 24mm dirancang khusus untuk menghasilkan rasa yang optimal. Dengan build deck yang mudah digunakan dan sistem airflow yang dapat disesuaikan, produk ini sangat ideal untuk pengguna yang ingin merasakan intensitas rasa dari setiap hisapan. Terbuat dari bahan berkualitas tinggi, atomizer ini juga mendukung berbagai jenis coil dan dapat digunakan oleh pengguna dari tingkat pemula hingga yang lebih berpengalaman.', '648456931f0ce.png', 50),
(2, 1, 'Centaurus M200', '580000', 'Mod', 'Mod high-end Centaurus M200 dilengkapi dengan chipset terbaru yang menawarkan performa unggul, stabilitas, dan keamanan tingkat tinggi. Desainnya yang elegan dan premium memberikan tampilan yang mewah serta ergonomis untuk kenyamanan penggunaan sehari-hari. Mod ini mendukung berbagai mode vaping dan dilengkapi dengan layar OLED yang menampilkan informasi penting seperti wattage, resistance, dan status baterai.', '6484579c4642a.png', 30),
(3, 1, 'AWT 18650', '13000', 'Baterai', 'Baterai AWT 18650 adalah pilihan ideal bagi pengguna yang menginginkan daya tahan baterai yang lama dan kapasitas besar. Dikenal dengan umur panjangnya, baterai ini menawarkan performa stabil dan aman saat digunakan di berbagai jenis perangkat vaping. Cocok untuk penggunaan pada mod mekanikal maupun reguler, baterai ini juga memiliki proteksi dari overcharge dan overdischarge.', '648457cfa8251.png', 100),
(4, 1, 'VGOD RDTA', '227500', 'Atomizer', 'Atomizer RDTA VGOD hadir dengan build deck yang luas, memungkinkan pengguna untuk memasang coil dengan mudah. Kapasitas e-liquid yang besar memungkinkan pengguna untuk menikmati vaping lebih lama tanpa harus sering mengisi ulang. Sistem airflow yang disesuaikan memberikan pengalaman vaping yang intens dengan produksi uap yang tebal, menjadikannya pilihan yang sempurna bagi para cloud chaser.', '64845885e5fde.png', 40),
(5, 1, 'ZEUS X RTA 25mm', '410000', 'Atomizer', 'ZEUS X RTA adalah atomizer rebuildable dengan diameter 25mm yang didesain untuk memberikan aliran udara yang superior. RTA ini memiliki sistem top airflow yang anti bocor, sehingga memastikan pengalaman vaping yang bebas dari masalah. Dengan kemampuan untuk menampung jumlah e-liquid yang cukup besar dan build deck yang mudah diakses, ZEUS X RTA cocok untuk pengguna yang ingin memaksimalkan rasa sekaligus menghasilkan uap yang melimpah.', '64846609c73d7.png', 25),
(6, 1, 'CANDI DTA', '55000', 'Atomizer', 'CANDI DTA adalah atomizer yang praktis dan mudah digunakan, khusus dirancang untuk pemula yang baru mengenal dunia vaping. Desainnya yang kompak serta sistem wicking yang sederhana memungkinkan pengguna untuk langsung merasakan pengalaman vaping tanpa ribet. Produk ini menawarkan rasa yang memuaskan dan uap yang cukup tebal, ideal untuk penggunaan sehari-hari.', '648471e79295a.png', 60),
(7, 1, 'Dovpo Panda', '490000', 'Mod', 'Mod Dovpo Panda menawarkan desain yang unik dengan motif panda yang menggemaskan, dilengkapi dengan performa yang andal dan daya tahan tinggi. Mod ini dirancang untuk memberikan output yang konsisten, cocok untuk pengguna yang menginginkan tampilan yang berbeda namun tetap mengutamakan kualitas. Dengan fitur keamanan yang lengkap, Dovpo Panda memastikan pengalaman vaping yang aman dan nyaman.', '64847357cf0fa.png', 15),
(8, 1, 'Mdura', '420000', 'Mod', 'Mod Mdura menawarkan fitur tahan air dan tahan banting, membuatnya sempurna untuk pengguna yang menginginkan mod tangguh untuk penggunaan luar ruangan. Dengan daya tahan baterai yang lama dan fitur pengaturan watt yang presisi, Mdura memberikan performa yang handal sepanjang hari. Layar OLED yang besar dan mudah dibaca memberikan akses cepat ke berbagai informasi penting.', '6484737202a50.png', 20),
(9, 1, 'Ijoy Jupiter', '300000', 'Mod', 'Mod Ijoy Jupiter dilengkapi dengan baterai internal yang besar dan desain modern yang menarik. Mod ini sangat cocok untuk pengguna yang menginginkan perangkat yang praktis tanpa harus repot mengganti baterai. Dengan berbagai fitur keamanan dan mode vaping, Ijoy Jupiter memberikan fleksibilitas dan kemudahan dalam penggunaan, ideal untuk vaping di mana saja.', '6484738b8fd55.png', 35),
(10, 1, 'Sony VTC 5', '44100', 'Baterai', 'Baterai Sony VTC 5 adalah pilihan terbaik bagi pengguna yang membutuhkan output daya yang stabil dan aman untuk mod vaping mereka. Dengan kapasitas besar dan performa yang tahan lama, baterai ini sangat cocok untuk perangkat yang membutuhkan daya tinggi. Selain itu, baterai ini dilengkapi dengan proteksi untuk mencegah overcharge, overdischarge, serta arus pendek, menjadikannya pilihan yang sangat andal dan aman untuk vaping harian.', '648473f049c23.png', 150),
(11, 1, 'Kleporn 60ml', '130000', 'Liquid', 'E-liquid Kleporn menawarkan pengalaman rasa unik yang menggabungkan gurihnya popcorn dengan sentuhan manis yang pas. Dengan formula yang dirancang untuk menghasilkan uap yang tebal dan rasa yang autentik, Kleporn cocok untuk pengguna yang menyukai rasa camilan manis dengan nuansa gurih. Hadir dalam kemasan 60ml, liquid ini ideal untuk penggunaan jangka panjang tanpa sering melakukan pengisian ulang.', '6484747d2c870.png', 80),
(12, 1, 'Iceland Mango 30ml', '110000', 'Liquid', 'Iceland Mango menghadirkan sensasi segar dari mangga yang dipadukan dengan efek dingin, memberikan sensasi rasa yang menyejukkan di setiap hisapan. E-liquid ini cocok untuk pengguna yang menyukai rasa buah yang menyegarkan dengan tambahan menthol untuk efek pendingin. Dikemas dalam botol 30ml, Iceland Mango sangat pas untuk penggunaan sehari-hari dengan pengalaman rasa yang menenangkan dan menyegarkan.', '648474a0c01d7.png', 90),
(13, 1, 'Muffin & Xes', '130000', 'Liquid', 'Muffin & Xes adalah e-liquid yang menawarkan rasa kue muffin yang lembut dan manis. Setiap hisapan memberikan sensasi seperti menikmati kue muffin yang baru dipanggang, lengkap dengan nuansa gurih dan manis yang seimbang. Liquid ini sangat cocok bagi penggemar dessert yang mencari sensasi rasa kue yang otentik dalam bentuk vape. Dikemas dalam botol 60ml, Muffin & Xes menawarkan pengalaman vaping yang lezat dan memuaskan.', '648474c6baacc.png', 75),
(14, 1, 'Hokkaido Strawberry', '130000', 'Liquid', 'Hokkaido Strawberry adalah e-liquid dengan rasa stroberi manis yang berasal dari Hokkaido, Jepang. Liquid ini menawarkan rasa buah yang autentik dan lembut, dengan keseimbangan manis yang tidak terlalu kuat. Ideal untuk penggemar rasa buah yang ringan namun kaya akan aroma, Hokkaido Strawberry memberikan sensasi yang menyegarkan dan enak dinikmati setiap saat. Liquid ini juga menghasilkan uap yang tebal dengan aroma stroberi yang menggoda.', '648474f8cbbfa.png', 70);

CREATE TABLE `report` (
  `ID_REPORT` int(11) NOT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `DESK_REPORT` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `report` (`ID_REPORT`, `ID_USER`, `DESK_REPORT`) VALUES
(1, 1, 'Sebagai seorang pengguna, saya ingin memberikan ulasan tentang website Vape yang saya temui. Website ini sangat informatif dan mudah digunakan bagi penggemar vaping seperti saya. Halaman utamanya memiliki tampilan yang menarik dengan navigasi yang jelas, memungkinkan saya untuk dengan mudah menemukan produk yang saya cari. Selain itu, terdapat juga informasi yang lengkap tentang berbagai jenis vape, aksesori, dan e-liquid yang tersedia'),
(2, 2, 'Sebagai seorang pengguna, saya ingin memberikan ulasan lain tentang website Vape yang saya telusuri. Website ini benar-benar menjadi sumber daya yang komprehensif bagi semua hal terkait vaping. Desainnya yang intuitif dan responsif membuat navigasi menjadi sangat mudah dan menyenangkan. Dari halaman produk hingga forum komunitas, semuanya tersedia di satu tempat yang terorganisir dengan baik. Selain itu, website ini juga menawarkan ulasan pengguna yang membantu saya dalam memilih produk yang tepat untuk kebutuhan saya. Fitur \"pembanding produk\" sangat berguna untuk membandingkan spesifikasi dan fitur dari berbagai merek dan model vape. Saya juga mengapresiasi adanya blog yang terus diperbarui dengan konten menarik tentang tren terbaru, keamanan, dan inovasi dalam dunia vaping. Secara keseluruhan, website Vape ini merupakan sumber informasi yang sangat berharga bagi pengguna seperti saya yang ingin menjelajahi dunia vaping dengan lebih baik.');

CREATE TABLE `transaksi` (
  `ID_TRANSAKSI` int(11) NOT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `TANGGAL_TRANSAKSI` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `transaksi` (`ID_TRANSAKSI`, `ID_USER`, `TANGGAL_TRANSAKSI`) VALUES
(1, 1, NOW());

CREATE TABLE `transaksi_item` (
  `ID` int(11) NOT NULL,
  `ID_TRANSAKSI` int(11) DEFAULT NULL,
  `ID_PRODUCT` int(11) DEFAULT NULL,
  `JUMLAH` decimal(10,0) DEFAULT NULL,
  `HARGA` decimal(8,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `transaksi_item` (`ID`, `ID_TRANSAKSI`, `ID_PRODUCT`, `JUMLAH`, `HARGA`) VALUES
(1, 1, 1, '3', (SELECT price_product FROM product WHERE id_product = 1)),
(2, 1, 2, '4', (SELECT price_product FROM product WHERE id_product = 2));

CREATE TABLE `user` (
  `ID_USER` int(11) NOT NULL,
  `NAMA_USER` varchar(255) DEFAULT NULL,
  `EMAIL_USER` varchar(255) DEFAULT NULL,
  `USERNAME_USER` varchar(255) DEFAULT NULL,
  `PASSWORD_USER` varchar(255) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `NUMBER_PHONE` varchar(255) DEFAULT NULL,
  `SALDO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `user` (`ID_USER`, `NAMA_USER`, `EMAIL_USER`, `USERNAME_USER`, `PASSWORD_USER`, `ADDRESS`, `NUMBER_PHONE`, `SALDO`) VALUES
(1, 'Lionel Messi', 'Messi10@gmail.com', 'lionelmessi', 'yayaya', 'Nganjuk', '0895366968783', '2500000'),
(2, 'Jordi Alba', 'alba17@gmail.com', 'jordialba', 'yeyeye', 'Banyuwangi', '0895366968782', '3400000');

ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_ADMIN`);

ALTER TABLE `product`
  ADD PRIMARY KEY (`ID_PRODUCT`),
  ADD KEY `FK_RELATIONSHIP_4` (`ID_ADMIN`);

ALTER TABLE `report`
  ADD PRIMARY KEY (`ID_REPORT`),
  ADD KEY `FK_RELATIONSHIP_8` (`ID_USER`);

ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`ID_TRANSAKSI`),
  ADD KEY `FK_RELATIONSHIP_5` (`ID_USER`);

ALTER TABLE `transaksi_item`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_RELATIONSHIP_6` (`ID_TRANSAKSI`),
  ADD KEY `FK_RELATIONSHIP_7` (`ID_PRODUCT`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`ID_USER`);

ALTER TABLE `admin`
  MODIFY `ID_ADMIN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `product`
  MODIFY `ID_PRODUCT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `report`
  MODIFY `ID_REPORT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `transaksi`
  MODIFY `ID_TRANSAKSI` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `transaksi_item`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `user`
  MODIFY `ID_USER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `product`
  ADD CONSTRAINT `FK_RELATIONSHIP_4` FOREIGN KEY (`ID_ADMIN`) REFERENCES `admin` (`ID_ADMIN`);

ALTER TABLE `report`
  ADD CONSTRAINT `FK_RELATIONSHIP_8` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`);

ALTER TABLE `transaksi`
  ADD CONSTRAINT `FK_RELATIONSHIP_5` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`);

ALTER TABLE `transaksi_item`
  ADD CONSTRAINT `FK_RELATIONSHIP_6` FOREIGN KEY (`ID_TRANSAKSI`) REFERENCES `transaksi` (`ID_TRANSAKSI`),
  ADD CONSTRAINT `FK_RELATIONSHIP_7` FOREIGN KEY (`ID_PRODUCT`) REFERENCES `product` (`ID_PRODUCT`);
COMMIT;