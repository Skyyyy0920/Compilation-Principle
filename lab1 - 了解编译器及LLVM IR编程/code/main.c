#include<stdio.h>

int main() {
    int a, b, i, t, n;
    a = 0;
    b = 1;
    i = 1;
    scanf("%d", &n);
    printf("%d\n", a);
    printf("%d\n", a);
    while (i < n) {
        t = b;
        b = a + b;
        printf("%f\n", b);
        a = t;
        i = i + 1;
    }
    return 0;
}
