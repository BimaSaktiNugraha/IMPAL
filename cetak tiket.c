#include<stdio.h>

FILE *tiket;
typedef struct{
    char id[5];
    char nama[15];
    char asal[15];
    char tujuan[15];
    char tanggal[15];
}tikets;

int main(){
    tikets tik[100];

    int i=0;
    tiket = fopen("yang mau dibaca.txt","r");
    while (!feof(tiket))
    {
        i++;
        fscanf(tiket,"\t%s",&tik[i].id);
        fscanf(tiket,"\t%s",&tik[i].nama);
        fscanf(tiket,"\t%s",&tik[i].asal);
        fscanf(tiket,"\t%s",&tik[i].tujuan);
        fscanf(tiket,"\t%s\n",&tik[i].tanggal);
    } fclose(tiket);
    int n=i;

    char cari[5];
    printf("\t\t menu Cetak TIKET \n\n");
    printf(" Masukan Id Tiket  : "); scanf("%s",&cari);

    int ketemu=0;
    for(i=1;i<=n;i++){
        if (strcmp(tik[i].id,cari)==0){
            system("cls");
            printf(" \t\t CETAK TIKET \n\n");
            printf(" ID TIKET   : %s\n",tik[i].id);
            printf(" NAMA       : %s\n",tik[i].nama);
            printf(" ASAL       : %s\n",tik[i].asal);
            printf(" TUJUAN     : %s\n",tik[i].tujuan);
            printf(" TANGGAL    : %s\n",tik[i].tanggal);
            ketemu=1;
        }
    }
    if (ketemu==0)
        printf("tiket tidak ada :(");
}
