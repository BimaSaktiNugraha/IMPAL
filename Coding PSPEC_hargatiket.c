#include <stdio.h>

int main(){
    int jumlah_tiket, harga_tiket,jenis;

    printf("\t\tHitung Harga Tiket \n\n");

    printf("Masukan Jumlah tiket yang anda inginkan : "); scanf("%d",&jumlah_tiket);
    printf("Masukan Jenis Tiket                     : "); scanf("%d",&jenis);

    if (jenis==1) harga_tiket = 50000;
    else if (jenis==2) harga_tiket = 85000;
    else if (jenis==3) harga_tiket = 100000;
    else if (jenis==4) harga_tiket = 125000;
    else if (jenis==5) harga_tiket = 200000;
    else if (jenis==6) harga_tiket = 250000;
    else
        harga_tiket = 0;

    system("cls");


    printf("Tiket Dengan Jumlah : %d\n",jumlah_tiket);
    printf("Tiket Dengan Jenis  : %d\n",jenis);
    printf("Seharga             : %d\n",jumlah_tiket*harga_tiket);
}
