#include<stdio.h>
float add(float a,float b){
    return a+b;
}

int main(){
    float a[5][5];
    for(int i=0;i<5;i++){
        for(int j=0;j<5;j++){
            a[i][j]=i-j+i*j;
        }
    }
    int n;
    scanf("%d",&n);
    a[3][3]=add(a[3][3],n);
    printf("%d",a[3][3]);
    return 0;
}