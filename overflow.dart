import 'dart:io';

void main(List<String> args) {
  String var1 = ('Nasi + Ayam Goreng + Es Teh');
  String var2 = ('Pizza + Susu');
  String var3 = ('Nasi Balap + Air Gelas Mineral');
  String var4 = ('Keluar Aplikasi');

  int pilih = 0;
  while (pilih == 0) {
    print("Menu Makanan\n1. $var1\n2. $var2\n3. $var3\n4. Exit");
    stdout.write('Pilih Menu: ');
    pilih = int.parse(stdin.readLineSync()!);
    switch (pilih) {
      case 1:
        print("Anda Memilih Menu $var1 dengan harga Rp. 15.000");
        break;
      case 2:
        print("Anda Memilih Menu $var2 dengan harga Rp. 32.000");
        break;
      case 3:
        print("Anda Memilih Menu $var3 dengan Harga Rp. 12.000");
        break;
      case 4:
        print("Keluar Aplikasi");
        break;
    }
  }
}
