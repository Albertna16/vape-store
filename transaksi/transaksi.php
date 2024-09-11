<?php
include('../connections.php');
session_start();
$userId = $_SESSION['userId'];
$datetime = date('Y-m-d H:i:s');
$totalBayar = $_POST['totalBayar'];
$status = '';

// Mendapatkan informasi saldo user
$query = "SELECT * FROM user WHERE ID_USER = :id";
$stmt = $connection->prepare($query);
$stmt->bindParam(':id', $userId);
$stmt->execute();
$result = $stmt->fetch(PDO::FETCH_ASSOC);

// Cek apakah saldo cukup
if ($totalBayar > $result['SALDO']) {
    $status = 'saldokurang';
    header('location: keranjang.php?status=' . $status);
    exit;
}

// Memasukkan data transaksi baru
$query = "INSERT INTO transaksi (ID_USER, TANGGAL_TRANSAKSI) VALUES (:ID_USER, :TANGGAL_TRANSAKSI)";
$stmt = $connection->prepare($query);
$stmt->bindParam(':ID_USER', $userId);
$stmt->bindParam(':TANGGAL_TRANSAKSI', $datetime);
$stmt->execute();

// Mendapatkan ID transaksi yang baru saja dimasukkan
$transaksiId = $connection->lastInsertId();

// Memproses setiap item di keranjang belanja
if (!empty($_SESSION["cart_item"])) {
    foreach ($_SESSION["cart_item"] as $item) {
        $productId = $item['id'];
        $jumlah = $item['quantity'];
        $totalHarga = $item['price'] * $jumlah;

        // Memasukkan item transaksi ke tabel transaksi_item
        $query = "INSERT INTO transaksi_item (ID_TRANSAKSI, ID_PRODUCT, JUMLAH, HARGA) VALUES (:ID_TRANSAKSI, :ID_PRODUCT, :JUMLAH, :HARGA)";
        $stmt = $connection->prepare($query);
        $stmt->bindParam(':ID_TRANSAKSI', $transaksiId);
        $stmt->bindParam(':ID_PRODUCT', $productId);
        $stmt->bindParam(':JUMLAH', $jumlah);
        $stmt->bindParam(':HARGA', $totalHarga);
        $stmt->execute();

        // Mengurangi stok barang sesuai dengan jumlah yang dibeli
        $query = "UPDATE product SET STOK_BARANG = STOK_BARANG - :jumlah WHERE ID_PRODUCT = :ID_PRODUCT AND STOK_BARANG >= :jumlah";
        $stmt = $connection->prepare($query);
        $stmt->bindParam(':jumlah', $jumlah);
        $stmt->bindParam(':ID_PRODUCT', $productId);
        $stmt->execute();
    }

    // Mengurangi saldo user
    $query = "UPDATE user SET SALDO = (:saldo - :totalBayar) WHERE ID_USER = :id";
    $stmt = $connection->prepare($query);
    $stmt->bindParam(':id', $userId);
    $stmt->bindParam(':saldo', $result['SALDO']);
    $stmt->bindParam(':totalBayar', $totalBayar);
    $stmt->execute();

    // Kosongkan keranjang belanja setelah transaksi berhasil
    unset($_SESSION['cart_item']);
    $status = 'ok';
    header('location: keranjang.php?status=' . $status);
    exit;
}

// Jika keranjang kosong, kembalikan ke halaman keranjang
header('location: keranjang.php');
exit;
