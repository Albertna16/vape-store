<?php
include('../connections.php');
session_start();
if (isset($_GET['id'])) {
  $query = "SELECT * FROM product WHERE ID_PRODUCT = :id";
  $stmt = $connection->prepare($query);
  $stmt->bindParam(':id', $_GET['id']);
  $stmt->execute();
  $data = $stmt->fetch(PDO::FETCH_ASSOC);
  if (!$data) {
    header('location: ../view-more-product/all.php');
    exit;
  }
} else {
  header('location: ../view-more-product/all.php');
  exit;
}

$itemCount = 0; // Inisialisasi itemCount dengan nilai awal 0

if (isset($_SESSION["cart_item"]) && is_array($_SESSION["cart_item"])) {
  // Memeriksa apakah $_SESSION["cart_item"] sudah ada dan merupakan array
  $itemCount = count($_SESSION["cart_item"]);
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>PRODUCT DETAIL</title>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/reset.css">

  <!-- Import Google Fonts -->
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400&display=swap');
  </style>

  <script src="https://kit.fontawesome.com/ad6991be8a.js" crossorigin="anonymous"></script>
</head>

<body>
  <?php include('../template/navbar.php'); ?>

  <div class="container-main">
    <div class="product-container">
      <div class="product-box1">
        <img src="../resource/product/img/<?php echo $data['GAMBAR_PRODUCT']; ?>" alt="Gambar Produk" />
        <?php if ($data['STOK_BARANG'] > 0) : ?>
          <a href="../transaksi/addToCart.php?action=plus&id=<?php echo $data['ID_PRODUCT']; ?>&link=product">Beli Sekarang</a>
        <?php else : ?>
          <p style="color: red;">Stok Habis</p>
        <?php endif; ?>
      </div>
      <div class="product-box2">
        <h3><?php echo $data['NAME_PRODUCT']; ?></h3>
        <h6>Rp <?php echo number_format($data['PRICE_PRODUCT'], 0, ',', '.'); ?></h6>
        <p><?php echo $data['DESK_PRODUCT']; ?></p>
        <p><strong>Stok Tersedia:</strong> <?php echo $data['STOK_BARANG'] > 0 ? $data['STOK_BARANG'] : 'Stok Habis'; ?></p>
        <button class="btn-back" onclick="history.back()">Kembali</button>
      </div>
    </div>
  </div>

  <?php include('../template/footer.php'); ?>
</body>

</html>