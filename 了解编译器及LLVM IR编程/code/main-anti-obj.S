
main.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <main>:
   0:	f3 0f 1e fa          	endbr64 
   4:	55                   	push   %rbp
   5:	48 89 e5             	mov    %rsp,%rbp
   8:	48 83 ec 20          	sub    $0x20,%rsp
   c:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  13:	00 00 
  15:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  19:	31 c0                	xor    %eax,%eax
  1b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
  22:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%rbp)
  29:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%rbp)
  30:	48 8d 45 e4          	lea    -0x1c(%rbp),%rax
  34:	48 89 c6             	mov    %rax,%rsi
  37:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 3e <main+0x3e>
  3e:	48 89 c7             	mov    %rax,%rdi
  41:	b8 00 00 00 00       	mov    $0x0,%eax
  46:	e8 00 00 00 00       	call   4b <main+0x4b>
  4b:	8b 45 e8             	mov    -0x18(%rbp),%eax
  4e:	89 c6                	mov    %eax,%esi
  50:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 57 <main+0x57>
  57:	48 89 c7             	mov    %rax,%rdi
  5a:	b8 00 00 00 00       	mov    $0x0,%eax
  5f:	e8 00 00 00 00       	call   64 <main+0x64>
  64:	8b 45 e8             	mov    -0x18(%rbp),%eax
  67:	89 c6                	mov    %eax,%esi
  69:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 70 <main+0x70>
  70:	48 89 c7             	mov    %rax,%rdi
  73:	b8 00 00 00 00       	mov    $0x0,%eax
  78:	e8 00 00 00 00       	call   7d <main+0x7d>
  7d:	eb 2f                	jmp    ae <main+0xae>
  7f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  82:	89 45 f4             	mov    %eax,-0xc(%rbp)
  85:	8b 45 e8             	mov    -0x18(%rbp),%eax
  88:	01 45 ec             	add    %eax,-0x14(%rbp)
  8b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8e:	89 c6                	mov    %eax,%esi
  90:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 97 <main+0x97>
  97:	48 89 c7             	mov    %rax,%rdi
  9a:	b8 00 00 00 00       	mov    $0x0,%eax
  9f:	e8 00 00 00 00       	call   a4 <main+0xa4>
  a4:	8b 45 f4             	mov    -0xc(%rbp),%eax
  a7:	89 45 e8             	mov    %eax,-0x18(%rbp)
  aa:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
  ae:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  b1:	39 45 f0             	cmp    %eax,-0x10(%rbp)
  b4:	7c c9                	jl     7f <main+0x7f>
  b6:	b8 00 00 00 00       	mov    $0x0,%eax
  bb:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  bf:	64 48 2b 14 25 28 00 	sub    %fs:0x28,%rdx
  c6:	00 00 
  c8:	74 05                	je     cf <main+0xcf>
  ca:	e8 00 00 00 00       	call   cf <main+0xcf>
  cf:	c9                   	leave  
  d0:	c3                   	ret    
