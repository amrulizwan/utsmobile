import 'dart:io';

void main() {
  List<String> dataBarang = ['Fresh Tea', 'Surya 12', 'Sampoerna'];
  List<int> hargaBarang = [5000, 22000, 33000];
  menu(dataBarang, hargaBarang);
}

void menu(dataBarang, hargaBarang) {
  print("\n=======================");
  print("MENU");
  print(
      "1. Tampilkan Data\n2. Ubah Data\n3. Hapus Data\n4. Cari Data\n5. Tambah Data\n0. Exit");
  stdout.write("Pilih menu: ");
  try {
    int? pilih = int.parse(stdin.readLineSync()!);
    switch (pilih) {
      case 1:
        tampilkanData(dataBarang, hargaBarang);
        break;
      case 2:
        ubahData(dataBarang, hargaBarang);
        break;
      case 3:
        hapusData(dataBarang, hargaBarang);
        break;
      case 4:
        cariData(dataBarang, hargaBarang);
        break;
      case 5:
        tambahData(dataBarang, hargaBarang);
        break;
      case 0:
        print("Anda keluar dari aplikasi!");
        exit(0);
      default:
        print("Pilih menu yang tersedia!");
        menu(dataBarang, hargaBarang);
        break;
    }
  } catch (e) {
    print("Pastikan input tidak kosong / berupa angka!");
  }
}

void tampilkanData(dataBarang, hargaBarang) {
  print("Daftar Buah");

  if (dataBarang.isNotEmpty) {
    dataBarang.forEach((items) {
      print("${dataBarang.indexOf(items) + 1}. $items");
    });
    menu(dataBarang, hargaBarang);
  } else {
    print("Data masih kosong!");
    menu(dataBarang, hargaBarang);
  }
}

void hapusData(dataBarang, hargaBarang) {
  print('Hapus Data');
  dataBarang.forEach((items) {
    print("${dataBarang.indexOf(items) + 1}. $items");
  });
  print("0. Back");
  stdout.write("Data yang mau dihapus / Back: ");
  int? dataHapus = int.parse(stdin.readLineSync()!);
  if (dataHapus == 0) {
    menu(dataBarang, hargaBarang);
  } else {
    dataBarang.remove(dataBarang[dataHapus - 1]);
    stdout.write("Hapus data lagi? (y/n): ");
    String? pilih2 = stdin.readLineSync()!;
    if (pilih2 == "y") {
      hapusData(dataBarang, hargaBarang);
    } else if (pilih2 == "n") {
      menu(dataBarang, hargaBarang);
    } else {
      print("Pilih sesuai aplikasi!");
    }
  }
}

void ubahData(dataBarang, hargaBarang) {
  print('Ubah Data');
  dataBarang.forEach((items) {
    print("${dataBarang.indexOf(items) + 1}. $items");
  });
  print("0. Back");
  stdout.write("Data yang mau diubah / Back: ");
  int? dataUbah = int.parse(stdin.readLineSync()!);
  if (dataUbah == 0) {
    menu(dataBarang, hargaBarang);
  } else {
    var status = dataBarang.remove(dataBarang[dataUbah - 1]);
    if (status) {
      stdout.write("Masukkan Data Baru: ");
      String? dataBaru = stdin.readLineSync()!;
      dataBarang.insert(dataUbah - 1, dataBaru);
      stdout.write("Ubah data lagi? (y/n): ");
      String? pilih2 = stdin.readLineSync()!;
      if (pilih2 == "y") {
        ubahData(dataBarang, hargaBarang);
      } else if (pilih2 == "n") {
        menu(dataBarang, hargaBarang);
      } else {
        print("Pilih sesuai aplikasi!");
      }
    }
  }
}

void tambahData(dataBarang, hargaBarang) {
  print('Tambah Data');
  dataBarang.forEach((items) {
    print("${dataBarang.indexOf(items) + 1}. $items");
  });
  print("0. Back");
  stdout.write("Masukkan data baru / Back: ");
  String? dataBaru = stdin.readLineSync()!;
  if (dataBaru == "0") {
    menu(dataBarang, hargaBarang);
  } else {
    stdout.write("Harga barang: ");
    int? addHarga = int.parse(stdin.readLineSync()!);
    hargaBarang.add(addHarga);
    dataBarang.add(dataBaru);
    dataBarang.forEach((items) {
      print("${dataBarang.indexOf(items) + 1}. $items");
    });
    stdout.write("Tambah data lagi? (y/n): ");
    String? pilih2 = stdin.readLineSync()!;
    if (pilih2 == "y") {
      tambahData(dataBarang, hargaBarang);
    } else if (pilih2 == "n") {
      menu(dataBarang, hargaBarang);
    } else {
      print("Pilih sesuai aplikasi!");
    }
  }
}

void cariData(dataBuah, hargaBarang) {
  print("0. Back");
  stdout.write("Cari data apa / Back: ");
  String? pilihData = stdin.readLineSync()!;
  if (pilihData == "0") {
    menu(dataBuah, hargaBarang);
  } else {
    if (dataBuah.contains(pilihData)) {
      print(pilihData);
    } else {
      print("Data tidak ditemukan!");
      menu(dataBuah, hargaBarang);
    }
  }
}
