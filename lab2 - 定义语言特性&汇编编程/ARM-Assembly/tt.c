int main()
{
    int i, n, f;
    n = getint();
    i = 2;
    f = 1;
while (i <= n)
{
    f = f * i;
    i = i + 1;
}
    putint(f);
    return 0;
}