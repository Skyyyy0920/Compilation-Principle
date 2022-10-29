int add(int a,int b){
    return a+b;
}

int main(){
    int a[5][5];
    for(int i=0;i<5;i++){
        for(int j=0;j<5;j++){
            a[i][j]=i-j+i/j;
        }
    }
    int n;
    n = getint();
    a[3][3]=add(a[3][3],n);
    putint(a[3][3]);
    return 0;
}