
;; Function main (main, funcdef_no=0, decl_uid=2344, cgraph_uid=1, symbol_order=0)

int main ()
{
  int n;
  int t;
  int i;
  int b;
  int a;
  int D.2355;

  a = 0;
  b = 1;
  i = 1;
  scanf ("%d", &n);
  printf ("%d\n", a);
  printf ("%d\n", a);
  goto <D.2352>;
  <D.2353>:
  t = b;
  b = a + b;
  printf ("%d\n", b);
  a = t;
  i = i + 1;
  <D.2352>:
  n.0_1 = n;
  if (i < n.0_1) goto <D.2353>; else goto <D.2351>;
  <D.2351>:
  D.2355 = 0;
  goto <D.2357>;
  <D.2357>:
  n = {CLOBBER};
  goto <D.2356>;
  D.2355 = 0;
  goto <D.2356>;
  <D.2356>:
  return D.2355;
}


