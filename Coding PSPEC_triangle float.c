#include<stdio.h>

int main(){
    float swap,a,b,c,s[4];
    int i,j;
    printf("Masukan Nilai A, B dan C\n");
    scanf("%f%f%f",&s[0],&s[1],&s[2]);

    for (i = 0 ; i < 2; i++)
        for (j = 0 ; j < 3 - i - 1; j++){
            if (s[j] > s[j+1]){
                swap   = s[j];
                s[j]   = s[j+1];
                s[j+1] = swap;
            }
        }

    a=s[0]; b=s[1];c=s[2];
    //for (i=0; i<3; i++) printf("%.2f ",s[i]);

    if ((a<=0)||(b<=0)||(c<=0)||(c>a+b))
        printf("Gak bisa buat segitiga :(");
    else if (((a==b)&&(a!=c))||((a==c)&&(a!=b))||((b==c)&&(a!=c)))
        printf("Bisa buat Segitiga Sama KAKI laaah");
    else if ((a==b)&&(b==c))
        printf("Bisa buat Segitiga Sama SISI dongg");
    else if ((c*c)==(b*b)+(a*a))
        printf("Bisa buat Segitiga Sama Siku niihh");
    else if (c<a+b)
        printf("Bisa buat Segitiga Bebas Brooo");
    else
        printf("Udah gabisa buat segitiga FIX :(");
}
