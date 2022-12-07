
gcc-o2.o:     file format elf64-x86-64


Disassembly of section .text.startup:

0000000000000000 <main>:
   0:	f3 0f 1e fa          	endbr64 
   4:	41 55                	push   %r13
   6:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # d <main+0xd>
   d:	4c 8d 2d 00 00 00 00 	lea    0x0(%rip),%r13        # 14 <main+0x14>
  14:	41 54                	push   %r12
  16:	55                   	push   %rbp
  17:	53                   	push   %rbx
  18:	48 83 ec 18          	sub    $0x18,%rsp
  1c:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  23:	00 00 
  25:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  2a:	31 c0                	xor    %eax,%eax
  2c:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
  31:	e8 00 00 00 00       	call   36 <main+0x36>
  36:	31 f6                	xor    %esi,%esi
  38:	4c 89 ef             	mov    %r13,%rdi
  3b:	31 c0                	xor    %eax,%eax
  3d:	e8 00 00 00 00       	call   42 <main+0x42>
  42:	31 f6                	xor    %esi,%esi
  44:	31 c0                	xor    %eax,%eax
  46:	4c 89 ef             	mov    %r13,%rdi
  49:	e8 00 00 00 00       	call   4e <main+0x4e>
  4e:	83 7c 24 04 01       	cmpl   $0x1,0x4(%rsp)
  53:	7e 30                	jle    85 <main+0x85>
  55:	bd 01 00 00 00       	mov    $0x1,%ebp
  5a:	bb 01 00 00 00       	mov    $0x1,%ebx
  5f:	31 c0                	xor    %eax,%eax
  61:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  68:	41 89 dc             	mov    %ebx,%r12d
  6b:	01 c3                	add    %eax,%ebx
  6d:	4c 89 ef             	mov    %r13,%rdi
  70:	31 c0                	xor    %eax,%eax
  72:	89 de                	mov    %ebx,%esi
  74:	83 c5 01             	add    $0x1,%ebp
  77:	e8 00 00 00 00       	call   7c <main+0x7c>
  7c:	44 89 e0             	mov    %r12d,%eax
  7f:	39 6c 24 04          	cmp    %ebp,0x4(%rsp)
  83:	7f e3                	jg     68 <main+0x68>
  85:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  8a:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
  91:	00 00 
  93:	75 0d                	jne    a2 <main+0xa2>
  95:	48 83 c4 18          	add    $0x18,%rsp
  99:	31 c0                	xor    %eax,%eax
  9b:	5b                   	pop    %rbx
  9c:	5d                   	pop    %rbp
  9d:	41 5c                	pop    %r12
  9f:	41 5d                	pop    %r13
  a1:	c3                   	ret    
  a2:	e8 00 00 00 00       	call   a7 <.LC1+0xa4>
