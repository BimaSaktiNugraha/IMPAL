#include <stdio.h>

FILE    *temp;

int main(){
    char  id_pemesanan[3];
    char id_pemesan[5];
    char id_jadwal[5];
    char asal[10];
    char tujuan[10];
    char waktu[10];

    printf("\t\t Memasukan data pemesanan \n");
    printf(" Masukan Id_pemesanan : "); scanf("%s",&id_pemesanan);
    printf(" Masukan Id_pemesan   : "); scanf("%s",&id_pemesan);
    printf(" Masukan Id_jadwal    : "); scanf("%s",&id_jadwal);
    printf(" Masukan kota asal    : "); scanf("%s",&asal);
    printf(" Masukan kota tujuan  : "); scanf("%s",&tujuan);
    printf(" Masukan tanggal      : "); scanf("%s",&waktu);

    //printf("%s - %s",asal,tujuan);


    if ((strlen(id_pemesanan)<=3) && (strlen(id_pemesan)<=4) && (strlen(id_jadwal)<=4)){
        system("cls");
        printf("berhasil input !");

        //memasukan data;
        temp=fopen("Datapem.txt","a");
            fprintf(temp,"\n%s",id_pemesanan);
            fprintf(temp,"\t%s",id_pemesan);
            fprintf(temp,"\t%s",id_jadwal);
            fprintf(temp,"\t%s",asal);
            fprintf(temp,"\t\t%s",tujuan);
            fprintf(temp,"\t%s",waktu);
        fclose(temp);
    }
    else
        printf("input gagal");



}
