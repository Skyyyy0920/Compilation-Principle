/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* "%code top" blocks.  */
#line 1 "src/parser.y"

    #include <iostream>
    #include <assert.h>
    #include <string>
    #include <cstring>
    #include <stack>
    #include "parser.h"
    using namespace std;
    extern Ast ast;

    Type* declType;
    stack<string> varlist;

    int yylex();
    int yyerror( char const * );

#line 85 "src/parser.cpp"




# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

#include "parser.h"
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_ID = 3,                         /* ID  */
  YYSYMBOL_INTEGER = 4,                    /* INTEGER  */
  YYSYMBOL_FLOATNUM = 5,                   /* FLOATNUM  */
  YYSYMBOL_IF = 6,                         /* IF  */
  YYSYMBOL_ELSE = 7,                       /* ELSE  */
  YYSYMBOL_EQUAL = 8,                      /* EQUAL  */
  YYSYMBOL_NOTEQUAL = 9,                   /* NOTEQUAL  */
  YYSYMBOL_CONST = 10,                     /* CONST  */
  YYSYMBOL_INT = 11,                       /* INT  */
  YYSYMBOL_VOID = 12,                      /* VOID  */
  YYSYMBOL_FLOAT = 13,                     /* FLOAT  */
  YYSYMBOL_LPAREN = 14,                    /* LPAREN  */
  YYSYMBOL_RPAREN = 15,                    /* RPAREN  */
  YYSYMBOL_LBRACK = 16,                    /* LBRACK  */
  YYSYMBOL_RBRACK = 17,                    /* RBRACK  */
  YYSYMBOL_LBRACE = 18,                    /* LBRACE  */
  YYSYMBOL_RBRACE = 19,                    /* RBRACE  */
  YYSYMBOL_SEMICOLON = 20,                 /* SEMICOLON  */
  YYSYMBOL_COMMA = 21,                     /* COMMA  */
  YYSYMBOL_MOD = 22,                       /* MOD  */
  YYSYMBOL_MUL = 23,                       /* MUL  */
  YYSYMBOL_DIV = 24,                       /* DIV  */
  YYSYMBOL_ADD = 25,                       /* ADD  */
  YYSYMBOL_SUB = 26,                       /* SUB  */
  YYSYMBOL_OR = 27,                        /* OR  */
  YYSYMBOL_AND = 28,                       /* AND  */
  YYSYMBOL_NON = 29,                       /* NON  */
  YYSYMBOL_GREATER = 30,                   /* GREATER  */
  YYSYMBOL_LESS = 31,                      /* LESS  */
  YYSYMBOL_GORE = 32,                      /* GORE  */
  YYSYMBOL_LORE = 33,                      /* LORE  */
  YYSYMBOL_ASSIGN = 34,                    /* ASSIGN  */
  YYSYMBOL_WHILE = 35,                     /* WHILE  */
  YYSYMBOL_RETURN = 36,                    /* RETURN  */
  YYSYMBOL_BREAK = 37,                     /* BREAK  */
  YYSYMBOL_CONTINUE = 38,                  /* CONTINUE  */
  YYSYMBOL_THEN = 39,                      /* THEN  */
  YYSYMBOL_YYACCEPT = 40,                  /* $accept  */
  YYSYMBOL_Program = 41,                   /* Program  */
  YYSYMBOL_Stmts = 42,                     /* Stmts  */
  YYSYMBOL_Stmt = 43,                      /* Stmt  */
  YYSYMBOL_LVal = 44,                      /* LVal  */
  YYSYMBOL_ExprStmt = 45,                  /* ExprStmt  */
  YYSYMBOL_AssignStmt = 46,                /* AssignStmt  */
  YYSYMBOL_BlankStmt = 47,                 /* BlankStmt  */
  YYSYMBOL_BlockStmt = 48,                 /* BlockStmt  */
  YYSYMBOL_49_1 = 49,                      /* $@1  */
  YYSYMBOL_IfStmt = 50,                    /* IfStmt  */
  YYSYMBOL_WhileStmt = 51,                 /* WhileStmt  */
  YYSYMBOL_BreakStmt = 52,                 /* BreakStmt  */
  YYSYMBOL_ContinueStmt = 53,              /* ContinueStmt  */
  YYSYMBOL_ReturnStmt = 54,                /* ReturnStmt  */
  YYSYMBOL_Exp = 55,                       /* Exp  */
  YYSYMBOL_Cond = 56,                      /* Cond  */
  YYSYMBOL_PrimaryExp = 57,                /* PrimaryExp  */
  YYSYMBOL_UnaryExp = 58,                  /* UnaryExp  */
  YYSYMBOL_MulExp = 59,                    /* MulExp  */
  YYSYMBOL_AddExp = 60,                    /* AddExp  */
  YYSYMBOL_RelExp = 61,                    /* RelExp  */
  YYSYMBOL_EqExp = 62,                     /* EqExp  */
  YYSYMBOL_LAndExp = 63,                   /* LAndExp  */
  YYSYMBOL_LOrExp = 64,                    /* LOrExp  */
  YYSYMBOL_Type = 65,                      /* Type  */
  YYSYMBOL_DeclStmt = 66,                  /* DeclStmt  */
  YYSYMBOL_VarDeclStmt = 67,               /* VarDeclStmt  */
  YYSYMBOL_VarDefList = 68,                /* VarDefList  */
  YYSYMBOL_VarDef = 69,                    /* VarDef  */
  YYSYMBOL_InitVal = 70,                   /* InitVal  */
  YYSYMBOL_ConstDeclStmt = 71,             /* ConstDeclStmt  */
  YYSYMBOL_ConstDefList = 72,              /* ConstDefList  */
  YYSYMBOL_ConstDef = 73,                  /* ConstDef  */
  YYSYMBOL_ConstInitVal = 74,              /* ConstInitVal  */
  YYSYMBOL_ConstExp = 75,                  /* ConstExp  */
  YYSYMBOL_FuncDef = 76,                   /* FuncDef  */
  YYSYMBOL_77_2 = 77,                      /* $@2  */
  YYSYMBOL_78_3 = 78,                      /* $@3  */
  YYSYMBOL_FuncFParams = 79,               /* FuncFParams  */
  YYSYMBOL_FuncFParam = 80,                /* FuncFParam  */
  YYSYMBOL_FuncRParams = 81,               /* FuncRParams  */
  YYSYMBOL_FuncRParam = 82                 /* FuncRParam  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  57
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   159

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  40
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  43
/* YYNRULES -- Number of rules.  */
#define YYNRULES  87
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  143

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   294


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    53,    53,    58,    59,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    77,    93,    98,   105,
     111,   110,   119,   124,   127,   132,   137,   142,   147,   150,
     156,   160,   164,   165,   169,   173,   177,   179,   185,   191,
     196,   208,   210,   216,   222,   230,   232,   238,   246,   248,
     254,   260,   266,   274,   276,   282,   290,   292,   300,   302,
     310,   315,   319,   326,   328,   332,   335,   339,   342,   349,
     369,   375,   379,   384,   388,   416,   420,   424,   427,   424,
     452,   456,   459,   465,   478,   479,   483,   489
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "ID", "INTEGER",
  "FLOATNUM", "IF", "ELSE", "EQUAL", "NOTEQUAL", "CONST", "INT", "VOID",
  "FLOAT", "LPAREN", "RPAREN", "LBRACK", "RBRACK", "LBRACE", "RBRACE",
  "SEMICOLON", "COMMA", "MOD", "MUL", "DIV", "ADD", "SUB", "OR", "AND",
  "NON", "GREATER", "LESS", "GORE", "LORE", "ASSIGN", "WHILE", "RETURN",
  "BREAK", "CONTINUE", "THEN", "$accept", "Program", "Stmts", "Stmt",
  "LVal", "ExprStmt", "AssignStmt", "BlankStmt", "BlockStmt", "$@1",
  "IfStmt", "WhileStmt", "BreakStmt", "ContinueStmt", "ReturnStmt", "Exp",
  "Cond", "PrimaryExp", "UnaryExp", "MulExp", "AddExp", "RelExp", "EqExp",
  "LAndExp", "LOrExp", "Type", "DeclStmt", "VarDeclStmt", "VarDefList",
  "VarDef", "InitVal", "ConstDeclStmt", "ConstDefList", "ConstDef",
  "ConstInitVal", "ConstExp", "FuncDef", "$@2", "$@3", "FuncFParams",
  "FuncFParam", "FuncRParams", "FuncRParam", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-34)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-78)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int8 yypact[] =
{
     119,    12,   -34,   -34,    15,    38,   -34,   -34,   -34,    13,
       4,   -34,    13,    13,    13,    18,     8,    16,    20,    43,
     119,   -34,    30,   -34,   -34,   -34,   -34,   -34,   -34,   -34,
     -34,   -34,    54,   -34,   -34,    34,   -18,    74,   -34,   -34,
     -34,   -34,    13,    13,    78,   -34,    68,   -34,   119,   -34,
     -34,   -34,    13,   -34,    70,   -34,   -34,   -34,   -34,    13,
     -34,    13,    13,    13,    13,    13,     7,    -6,   -34,   -34,
       9,   -34,    83,   -18,    14,    51,    71,    76,    72,    41,
     -34,   -34,    82,    89,   -34,    85,   -34,   -34,   -34,    34,
      34,    13,    95,   -34,   110,   -34,    13,   119,    13,    13,
      13,    13,    13,    13,    13,    13,    13,   -34,    78,   -34,
     119,   -34,   -34,   -34,    38,    80,   -34,   -34,   108,   -18,
     -18,   -18,   -18,    14,    14,    51,    71,   -18,   -34,   -34,
     -34,   -34,   118,    10,   -34,   119,   -34,   -34,    38,   -34,
     109,   -34,   -34
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       0,    16,    33,    34,     0,     0,    60,    61,    62,     0,
      20,    19,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     3,    32,     6,     5,    15,     7,     8,    11,     9,
      10,    12,     0,    36,    41,    45,    30,     0,    13,    63,
      64,    14,    86,     0,     0,    32,     0,    22,     0,    37,
      38,    39,     0,    28,     0,    26,    27,     1,     4,     0,
      17,     0,     0,     0,     0,     0,    68,     0,    67,    87,
       0,    84,     0,    48,    53,    56,    58,    31,     0,     0,
      73,    35,     0,     0,    29,     0,    44,    42,    43,    46,
      47,     0,     0,    65,     0,    40,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    71,     0,    21,
       0,    18,    70,    69,    82,    68,    66,    85,    23,    51,
      52,    50,    49,    54,    55,    57,    59,    76,    74,    75,
      72,    25,     0,     0,    81,     0,    83,    78,     0,    24,
       0,    80,    79
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -34,   -34,    86,   -19,     0,   -34,   -34,   -34,   -14,   -34,
     -34,   -34,   -34,   -34,   -34,    -7,    88,   -34,    -8,    11,
     -33,   -23,    24,    33,   -34,    -2,   -34,   -34,   -34,    47,
     -34,   -34,   -34,    35,   -34,   -34,   -34,   -34,   -34,   -34,
      21,   -34,    46
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_uint8 yydefgoto[] =
{
       0,    19,    20,    21,    45,    23,    24,    25,    26,    48,
      27,    28,    29,    30,    31,    32,    72,    33,    34,    35,
      36,    74,    75,    76,    77,    37,    38,    39,    67,    68,
     113,    40,    79,    80,   128,   129,    41,    92,   140,   133,
     134,    70,    71
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      22,    58,    46,    44,    49,    50,    51,    64,    65,    54,
      73,     1,     2,     3,    93,    94,     1,     2,     3,    73,
      22,   -77,     9,    47,    95,   137,    42,     9,    53,    43,
      96,   138,    52,    12,    13,    69,    55,    14,    12,    13,
      56,    91,    14,    57,    98,    99,   100,   101,    22,     6,
       7,     8,    85,    86,    87,    88,    61,    62,    63,   102,
     103,   107,   108,    58,    59,   119,   120,   121,   122,    73,
      73,    73,    73,   127,    60,    89,    90,    66,   118,   123,
     124,    78,    22,    81,   112,     1,     2,     3,     4,    69,
      84,   131,     5,     6,     7,     8,     9,    22,    97,   104,
      10,   109,    11,   105,   110,   111,   106,    12,    13,   114,
      22,    14,   132,   115,    91,   135,   139,    15,    16,    17,
      18,   136,     1,     2,     3,     4,   142,    10,   125,     5,
       6,     7,     8,     9,    82,    22,   132,    10,   126,    11,
      83,   116,   117,   130,    12,    13,     0,     0,    14,     0,
       0,     0,     0,     0,    15,    16,    17,    18,     0,   141
};

static const yytype_int16 yycheck[] =
{
       0,    20,     9,     5,    12,    13,    14,    25,    26,    16,
      43,     3,     4,     5,    20,    21,     3,     4,     5,    52,
      20,    14,    14,    19,    15,    15,    14,    14,    20,    14,
      21,    21,    14,    25,    26,    42,    20,    29,    25,    26,
      20,    34,    29,     0,    30,    31,    32,    33,    48,    11,
      12,    13,    59,    61,    62,    63,    22,    23,    24,     8,
       9,    20,    21,    82,    34,    98,    99,   100,   101,   102,
     103,   104,   105,   106,    20,    64,    65,     3,    97,   102,
     103,     3,    82,    15,    91,     3,     4,     5,     6,    96,
      20,   110,    10,    11,    12,    13,    14,    97,    15,    28,
      18,    19,    20,    27,    15,    20,    34,    25,    26,    14,
     110,    29,   114,     3,    34,     7,   135,    35,    36,    37,
      38,     3,     3,     4,     5,     6,   140,    18,   104,    10,
      11,    12,    13,    14,    48,   135,   138,    18,   105,    20,
      52,    94,    96,   108,    25,    26,    -1,    -1,    29,    -1,
      -1,    -1,    -1,    -1,    35,    36,    37,    38,    -1,   138
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     3,     4,     5,     6,    10,    11,    12,    13,    14,
      18,    20,    25,    26,    29,    35,    36,    37,    38,    41,
      42,    43,    44,    45,    46,    47,    48,    50,    51,    52,
      53,    54,    55,    57,    58,    59,    60,    65,    66,    67,
      71,    76,    14,    14,    65,    44,    55,    19,    49,    58,
      58,    58,    14,    20,    55,    20,    20,     0,    43,    34,
      20,    22,    23,    24,    25,    26,     3,    68,    69,    55,
      81,    82,    56,    60,    61,    62,    63,    64,     3,    72,
      73,    15,    42,    56,    20,    55,    58,    58,    58,    59,
      59,    34,    77,    20,    21,    15,    21,    15,    30,    31,
      32,    33,     8,     9,    28,    27,    34,    20,    21,    19,
      15,    20,    55,    70,    14,     3,    69,    82,    43,    60,
      60,    60,    60,    61,    61,    62,    63,    60,    74,    75,
      73,    43,    65,    79,    80,     7,     3,    15,    21,    43,
      78,    80,    48
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    40,    41,    42,    42,    43,    43,    43,    43,    43,
      43,    43,    43,    43,    43,    43,    44,    45,    46,    47,
      49,    48,    48,    50,    50,    51,    52,    53,    54,    54,
      55,    56,    57,    57,    57,    57,    58,    58,    58,    58,
      58,    59,    59,    59,    59,    60,    60,    60,    61,    61,
      61,    61,    61,    62,    62,    62,    63,    63,    64,    64,
      65,    65,    65,    66,    66,    67,    68,    68,    69,    69,
      70,    71,    72,    72,    73,    74,    75,    77,    78,    76,
      79,    79,    79,    80,    81,    81,    81,    82
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     2,     4,     1,
       0,     4,     2,     5,     7,     5,     2,     2,     2,     3,
       1,     1,     1,     1,     1,     3,     1,     2,     2,     2,
       4,     1,     3,     3,     3,     1,     3,     3,     1,     3,
       3,     3,     3,     1,     3,     3,     1,     3,     1,     3,
       1,     1,     1,     1,     1,     3,     3,     1,     1,     3,
       1,     4,     3,     1,     3,     1,     1,     0,     0,     8,
       3,     1,     0,     2,     1,     3,     0,     1
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* Program: Stmts  */
#line 53 "src/parser.y"
            {
        ast.setRoot((yyvsp[0].stmttype));
    }
#line 1264 "src/parser.cpp"
    break;

  case 3: /* Stmts: Stmt  */
#line 58 "src/parser.y"
           {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1270 "src/parser.cpp"
    break;

  case 4: /* Stmts: Stmts Stmt  */
#line 59 "src/parser.y"
                {
        (yyval.stmttype) = new SeqNode((yyvsp[-1].stmttype), (yyvsp[0].stmttype));
    }
#line 1278 "src/parser.cpp"
    break;

  case 5: /* Stmt: AssignStmt  */
#line 64 "src/parser.y"
                 {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1284 "src/parser.cpp"
    break;

  case 6: /* Stmt: ExprStmt  */
#line 65 "src/parser.y"
               {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 1290 "src/parser.cpp"
    break;

  case 7: /* Stmt: BlockStmt  */
#line 66 "src/parser.y"
                {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1296 "src/parser.cpp"
    break;

  case 8: /* Stmt: IfStmt  */
#line 67 "src/parser.y"
             {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1302 "src/parser.cpp"
    break;

  case 9: /* Stmt: BreakStmt  */
#line 68 "src/parser.y"
                {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1308 "src/parser.cpp"
    break;

  case 10: /* Stmt: ContinueStmt  */
#line 69 "src/parser.y"
                   {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1314 "src/parser.cpp"
    break;

  case 11: /* Stmt: WhileStmt  */
#line 70 "src/parser.y"
                {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1320 "src/parser.cpp"
    break;

  case 12: /* Stmt: ReturnStmt  */
#line 71 "src/parser.y"
                 {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1326 "src/parser.cpp"
    break;

  case 13: /* Stmt: DeclStmt  */
#line 72 "src/parser.y"
               {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 1332 "src/parser.cpp"
    break;

  case 14: /* Stmt: FuncDef  */
#line 73 "src/parser.y"
              {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1338 "src/parser.cpp"
    break;

  case 15: /* Stmt: BlankStmt  */
#line 74 "src/parser.y"
                {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1344 "src/parser.cpp"
    break;

  case 16: /* LVal: ID  */
#line 77 "src/parser.y"
         {
        SymbolEntry *se;
        se = identifiers->lookup((yyvsp[0].strtype));
        if(se == nullptr)
        {
            fprintf(stderr, "identifier \"%s\" is undefined\n", (char*)(yyvsp[0].strtype));
            delete [](char*)(yyvsp[0].strtype);
            assert(se != nullptr);
        }
        (yyval.exprtype) = new Id(se);
        delete [](yyvsp[0].strtype);
    }
#line 1361 "src/parser.cpp"
    break;

  case 17: /* ExprStmt: Exp SEMICOLON  */
#line 93 "src/parser.y"
                 {
        (yyval.stmttype) = new ExprStmt((yyvsp[-1].exprtype));
    }
#line 1369 "src/parser.cpp"
    break;

  case 18: /* AssignStmt: LVal ASSIGN Exp SEMICOLON  */
#line 98 "src/parser.y"
                              {
        (yyval.stmttype) = new AssignStmt((yyvsp[-3].exprtype), (yyvsp[-1].exprtype));
    }
#line 1377 "src/parser.cpp"
    break;

  case 19: /* BlankStmt: SEMICOLON  */
#line 105 "src/parser.y"
              {
        (yyval.stmttype) = new BlankStmt();
    }
#line 1385 "src/parser.cpp"
    break;

  case 20: /* $@1: %empty  */
#line 111 "src/parser.y"
        {identifiers = new SymbolTable(identifiers);}
#line 1391 "src/parser.cpp"
    break;

  case 21: /* BlockStmt: LBRACE $@1 Stmts RBRACE  */
#line 113 "src/parser.y"
        {
            (yyval.stmttype) = new CompoundStmt((yyvsp[-1].stmttype));
            SymbolTable *top = identifiers;
            identifiers = identifiers->getPrev();
            delete top;
        }
#line 1402 "src/parser.cpp"
    break;

  case 22: /* BlockStmt: LBRACE RBRACE  */
#line 119 "src/parser.y"
                      {
            (yyval.stmttype) = new CompoundStmt();
        }
#line 1410 "src/parser.cpp"
    break;

  case 23: /* IfStmt: IF LPAREN Cond RPAREN Stmt  */
#line 124 "src/parser.y"
                                            {
        (yyval.stmttype) = new IfStmt((yyvsp[-2].exprtype), (yyvsp[0].stmttype));
    }
#line 1418 "src/parser.cpp"
    break;

  case 24: /* IfStmt: IF LPAREN Cond RPAREN Stmt ELSE Stmt  */
#line 127 "src/parser.y"
                                           {
        (yyval.stmttype) = new IfElseStmt((yyvsp[-4].exprtype), (yyvsp[-2].stmttype), (yyvsp[0].stmttype));
    }
#line 1426 "src/parser.cpp"
    break;

  case 25: /* WhileStmt: WHILE LPAREN Cond RPAREN Stmt  */
#line 132 "src/parser.y"
                                    {
        (yyval.stmttype) = new WhileStmt((yyvsp[-2].exprtype), (yyvsp[0].stmttype));
    }
#line 1434 "src/parser.cpp"
    break;

  case 26: /* BreakStmt: BREAK SEMICOLON  */
#line 137 "src/parser.y"
                      {
        (yyval.stmttype) = new BreakStmt();
    }
#line 1442 "src/parser.cpp"
    break;

  case 27: /* ContinueStmt: CONTINUE SEMICOLON  */
#line 142 "src/parser.y"
                         {
        (yyval.stmttype) = new ContinueStmt();
    }
#line 1450 "src/parser.cpp"
    break;

  case 28: /* ReturnStmt: RETURN SEMICOLON  */
#line 147 "src/parser.y"
                       {
        (yyval.stmttype) = new ReturnStmt();
    }
#line 1458 "src/parser.cpp"
    break;

  case 29: /* ReturnStmt: RETURN Exp SEMICOLON  */
#line 150 "src/parser.y"
                          {
        (yyval.stmttype) = new ReturnStmt((yyvsp[-1].exprtype));
    }
#line 1466 "src/parser.cpp"
    break;

  case 30: /* Exp: AddExp  */
#line 156 "src/parser.y"
           {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1472 "src/parser.cpp"
    break;

  case 31: /* Cond: LOrExp  */
#line 160 "src/parser.y"
           {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1478 "src/parser.cpp"
    break;

  case 32: /* PrimaryExp: LVal  */
#line 164 "src/parser.y"
         {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1484 "src/parser.cpp"
    break;

  case 33: /* PrimaryExp: INTEGER  */
#line 165 "src/parser.y"
              {
        SymbolEntry *se = new ConstantSymbolEntry(TypeSystem::intType, (yyvsp[0].itype));
        (yyval.exprtype) = new Constant(se);
    }
#line 1493 "src/parser.cpp"
    break;

  case 34: /* PrimaryExp: FLOATNUM  */
#line 169 "src/parser.y"
              {
        SymbolEntry *se = new ConstantSymbolEntry(TypeSystem::floatType, (yyvsp[0].ftype));
        (yyval.exprtype) = new Constant(se);
    }
#line 1502 "src/parser.cpp"
    break;

  case 35: /* PrimaryExp: LPAREN Exp RPAREN  */
#line 173 "src/parser.y"
                       {(yyval.exprtype) = (yyvsp[-1].exprtype);}
#line 1508 "src/parser.cpp"
    break;

  case 36: /* UnaryExp: PrimaryExp  */
#line 177 "src/parser.y"
               {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1514 "src/parser.cpp"
    break;

  case 37: /* UnaryExp: ADD UnaryExp  */
#line 180 "src/parser.y"
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new UnaryExpr(se, UnaryExpr::ADD, (yyvsp[0].exprtype));
    }
#line 1523 "src/parser.cpp"
    break;

  case 38: /* UnaryExp: SUB UnaryExp  */
#line 186 "src/parser.y"
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new UnaryExpr(se, UnaryExpr::SUB, (yyvsp[0].exprtype));
    }
#line 1532 "src/parser.cpp"
    break;

  case 39: /* UnaryExp: NON UnaryExp  */
#line 192 "src/parser.y"
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new UnaryExpr(se, UnaryExpr::NON, (yyvsp[0].exprtype));
    }
#line 1541 "src/parser.cpp"
    break;

  case 40: /* UnaryExp: ID LPAREN FuncRParams RPAREN  */
#line 196 "src/parser.y"
                                   {
        SymbolEntry *se;
        se = identifiers->lookup((yyvsp[-3].strtype));
        if (se == nullptr)
            fprintf(stderr, "function \"%s\" is undefined\n", (char*)(yyvsp[-3].strtype));
        else{
            (yyval.exprtype) = new CallExpr(se, (yyvsp[-1].exprtype));
        }
    }
#line 1555 "src/parser.cpp"
    break;

  case 41: /* MulExp: UnaryExp  */
#line 208 "src/parser.y"
             {(yyval.exprtype)=(yyvsp[0].exprtype);}
#line 1561 "src/parser.cpp"
    break;

  case 42: /* MulExp: MulExp MUL UnaryExp  */
#line 211 "src/parser.y"
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::MUL, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1570 "src/parser.cpp"
    break;

  case 43: /* MulExp: MulExp DIV UnaryExp  */
#line 217 "src/parser.y"
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::DIV, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1579 "src/parser.cpp"
    break;

  case 44: /* MulExp: MulExp MOD UnaryExp  */
#line 223 "src/parser.y"
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::MOD, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1588 "src/parser.cpp"
    break;

  case 45: /* AddExp: MulExp  */
#line 230 "src/parser.y"
           {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1594 "src/parser.cpp"
    break;

  case 46: /* AddExp: AddExp ADD MulExp  */
#line 233 "src/parser.y"
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::ADD, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1603 "src/parser.cpp"
    break;

  case 47: /* AddExp: AddExp SUB MulExp  */
#line 239 "src/parser.y"
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::SUB, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1612 "src/parser.cpp"
    break;

  case 48: /* RelExp: AddExp  */
#line 246 "src/parser.y"
           {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1618 "src/parser.cpp"
    break;

  case 49: /* RelExp: RelExp LORE AddExp  */
#line 249 "src/parser.y"
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::LORE, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1627 "src/parser.cpp"
    break;

  case 50: /* RelExp: RelExp GORE AddExp  */
#line 255 "src/parser.y"
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::GORE, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1636 "src/parser.cpp"
    break;

  case 51: /* RelExp: RelExp GREATER AddExp  */
#line 261 "src/parser.y"
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::GREATER, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1645 "src/parser.cpp"
    break;

  case 52: /* RelExp: RelExp LESS AddExp  */
#line 267 "src/parser.y"
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::LESS, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1654 "src/parser.cpp"
    break;

  case 53: /* EqExp: RelExp  */
#line 274 "src/parser.y"
           {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1660 "src/parser.cpp"
    break;

  case 54: /* EqExp: EqExp EQUAL RelExp  */
#line 277 "src/parser.y"
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::EQUAL, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1669 "src/parser.cpp"
    break;

  case 55: /* EqExp: EqExp NOTEQUAL RelExp  */
#line 283 "src/parser.y"
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::NOTEQUAL, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1678 "src/parser.cpp"
    break;

  case 56: /* LAndExp: EqExp  */
#line 290 "src/parser.y"
          {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1684 "src/parser.cpp"
    break;

  case 57: /* LAndExp: LAndExp AND EqExp  */
#line 293 "src/parser.y"
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::AND, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1693 "src/parser.cpp"
    break;

  case 58: /* LOrExp: LAndExp  */
#line 300 "src/parser.y"
            {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1699 "src/parser.cpp"
    break;

  case 59: /* LOrExp: LOrExp OR LAndExp  */
#line 303 "src/parser.y"
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::OR, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1708 "src/parser.cpp"
    break;

  case 60: /* Type: INT  */
#line 310 "src/parser.y"
        {
        (yyval.type) = TypeSystem::intType;
        declType = TypeSystem::intType;
    }
#line 1717 "src/parser.cpp"
    break;

  case 61: /* Type: VOID  */
#line 315 "src/parser.y"
         {
        (yyval.type) = TypeSystem::voidType;
    }
#line 1725 "src/parser.cpp"
    break;

  case 62: /* Type: FLOAT  */
#line 319 "src/parser.y"
         {
        (yyval.type) = TypeSystem::floatType;
        declType = TypeSystem::floatType;
    }
#line 1734 "src/parser.cpp"
    break;

  case 63: /* DeclStmt: VarDeclStmt  */
#line 326 "src/parser.y"
                {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 1740 "src/parser.cpp"
    break;

  case 64: /* DeclStmt: ConstDeclStmt  */
#line 328 "src/parser.y"
                  {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 1746 "src/parser.cpp"
    break;

  case 65: /* VarDeclStmt: Type VarDefList SEMICOLON  */
#line 332 "src/parser.y"
                              {(yyval.stmttype) = (yyvsp[-1].stmttype);}
#line 1752 "src/parser.cpp"
    break;

  case 66: /* VarDefList: VarDefList COMMA VarDef  */
#line 335 "src/parser.y"
                              {
        (yyval.stmttype) = (yyvsp[-2].stmttype);
        (yyvsp[-2].stmttype)->setNext((yyvsp[0].stmttype));
    }
#line 1761 "src/parser.cpp"
    break;

  case 67: /* VarDefList: VarDef  */
#line 339 "src/parser.y"
             {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 1767 "src/parser.cpp"
    break;

  case 68: /* VarDef: ID  */
#line 342 "src/parser.y"
         {
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(declType, (yyvsp[0].strtype), identifiers->getLevel());
        identifiers->install((yyvsp[0].strtype), se);
        (yyval.stmttype) = new DeclStmt(new Id(se));
        delete [](yyvsp[0].strtype);
    }
#line 1779 "src/parser.cpp"
    break;

  case 69: /* VarDef: ID ASSIGN InitVal  */
#line 349 "src/parser.y"
                        {
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(declType, (yyvsp[-2].strtype), identifiers->getLevel());
        identifiers->install((yyvsp[-2].strtype), se);
        
        /* 这里展示的也是对expr node的属性的计算，这些node的值可以是float类型的，因为最后会进行int和float的判断
        if(declType->isFloat()){
            ((IdentifierSymbolEntry*)se)->setfValue($3->getvalue()); 
        }
        if(declType->isInt()){
            ((IdentifierSymbolEntry*)se)->setiValue($3->getvalue()); 
        }
        */

        (yyval.stmttype) = new DeclStmt(new Id(se), (yyvsp[0].exprtype));
        delete [](yyvsp[-2].strtype);
    }
#line 1801 "src/parser.cpp"
    break;

  case 70: /* InitVal: Exp  */
#line 369 "src/parser.y"
        {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1807 "src/parser.cpp"
    break;

  case 71: /* ConstDeclStmt: CONST Type ConstDefList SEMICOLON  */
#line 375 "src/parser.y"
                                      {(yyval.stmttype) = (yyvsp[-1].stmttype);}
#line 1813 "src/parser.cpp"
    break;

  case 72: /* ConstDefList: ConstDefList COMMA ConstDef  */
#line 379 "src/parser.y"
                                {
        (yyval.stmttype) = (yyvsp[-2].stmttype);
        (yyvsp[-2].stmttype)->setNext((yyvsp[0].stmttype));
    }
#line 1822 "src/parser.cpp"
    break;

  case 73: /* ConstDefList: ConstDef  */
#line 384 "src/parser.y"
             {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 1828 "src/parser.cpp"
    break;

  case 74: /* ConstDef: ID ASSIGN ConstInitVal  */
#line 388 "src/parser.y"
                          {
        if(declType->isFloat()){
            declType = TypeSystem::constFloatType;
        }
        if(declType->isInt()){
            declType = TypeSystem::constIntType;
        }
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(declType, (yyvsp[-2].strtype), identifiers->getLevel());
        ((IdentifierSymbolEntry*)se)->setConst();
        identifiers->install((yyvsp[-2].strtype), se);
        
        // 进行类型的判断选择赋值，符号表之中并没有存储任何的数值，包括const和var都得补充
        /* 这里需要注意的是需要补充对expr node的属性的值的计算
        if(declType->isFloat()){
            ((IdentifierSymbolEntry*)se)->setfValue($3->getvalue()); 
        }
        if(declType->isInt()){
            ((IdentifierSymbolEntry*)se)->setiValue($3->getvalue()); 
        }
        */
        
        (yyval.stmttype) = new DeclStmt(new Id(se), (yyvsp[0].exprtype));
        delete [](yyvsp[-2].strtype);
    }
#line 1858 "src/parser.cpp"
    break;

  case 75: /* ConstInitVal: ConstExp  */
#line 416 "src/parser.y"
             {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1864 "src/parser.cpp"
    break;

  case 76: /* ConstExp: AddExp  */
#line 420 "src/parser.y"
           {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1870 "src/parser.cpp"
    break;

  case 77: /* $@2: %empty  */
#line 424 "src/parser.y"
            {
        identifiers = new SymbolTable(identifiers);  // 申请新的符号表，此时为该函数的符号表
    }
#line 1878 "src/parser.cpp"
    break;

  case 78: /* $@3: %empty  */
#line 427 "src/parser.y"
                              {
        Type* funcType;
        std::vector<SymbolEntry*> params;
        DeclStmt* temp = (DeclStmt*)(yyvsp[-1].stmttype);  // 将所有形参全部装入params
        while(temp){
            params.push_back(temp->getId()->getSymbolEntry());
            temp = (DeclStmt*)(temp->getNext());
        }
        funcType = new FunctionType((yyvsp[-5].type), params);
        SymbolEntry* se = new IdentifierSymbolEntry(funcType, (yyvsp[-4].strtype), identifiers->getPrev()->getLevel());
        identifiers->getPrev()->install((yyvsp[-4].strtype), se);  // 将函数ID和函数类型装入符号表，这个是该函数上一级的符号表
    }
#line 1895 "src/parser.cpp"
    break;

  case 79: /* FuncDef: Type ID $@2 LPAREN FuncFParams RPAREN $@3 BlockStmt  */
#line 439 "src/parser.y"
              {
        SymbolEntry* se;
        se = identifiers->lookup((yyvsp[-6].strtype));
        assert(se != nullptr);
        (yyval.stmttype) = new FunctionDef(se, (DeclStmt*)(yyvsp[-3].stmttype), (yyvsp[0].stmttype));
        SymbolTable* top = identifiers;
        identifiers = identifiers->getPrev();
        delete top;
        delete [](yyvsp[-6].strtype);
    }
#line 1910 "src/parser.cpp"
    break;

  case 80: /* FuncFParams: FuncFParams COMMA FuncFParam  */
#line 452 "src/parser.y"
                                 {
        (yyval.stmttype) = (yyvsp[-2].stmttype);
        (yyval.stmttype)->setNext((yyvsp[0].stmttype));
    }
#line 1919 "src/parser.cpp"
    break;

  case 81: /* FuncFParams: FuncFParam  */
#line 456 "src/parser.y"
                 {
        (yyval.stmttype) = (yyvsp[0].stmttype);
    }
#line 1927 "src/parser.cpp"
    break;

  case 82: /* FuncFParams: %empty  */
#line 459 "src/parser.y"
            {  // 无参数的情况
        (yyval.stmttype) = nullptr;
    }
#line 1935 "src/parser.cpp"
    break;

  case 83: /* FuncFParam: Type ID  */
#line 465 "src/parser.y"
            {
        SymbolEntry* se;
        // se = new IdentifierSymbolEntry($1, $2, identifiers->getLevel(), paramNo++);
        se = new IdentifierSymbolEntry((yyvsp[-1].type), (yyvsp[0].strtype), identifiers->getLevel());
        identifiers->install((yyvsp[0].strtype), se);
        // ((IdentifierSymbolEntry*)se)->setLabel();
        // ((IdentifierSymbolEntry*)se)->setAddr(new Operand(se));
        (yyval.stmttype) = new DeclStmt(new Id(se));
        delete [](yyvsp[0].strtype);
    }
#line 1950 "src/parser.cpp"
    break;

  case 84: /* FuncRParams: FuncRParam  */
#line 478 "src/parser.y"
               {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1956 "src/parser.cpp"
    break;

  case 85: /* FuncRParams: FuncRParams COMMA FuncRParam  */
#line 479 "src/parser.y"
                                   {
        (yyval.exprtype) = (yyvsp[-2].exprtype);
        (yyval.exprtype)->setNext((yyvsp[0].exprtype));
    }
#line 1965 "src/parser.cpp"
    break;

  case 86: /* FuncRParams: %empty  */
#line 483 "src/parser.y"
            {
        (yyval.exprtype) = nullptr;
    }
#line 1973 "src/parser.cpp"
    break;

  case 87: /* FuncRParam: Exp  */
#line 489 "src/parser.y"
        {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1979 "src/parser.cpp"
    break;


#line 1983 "src/parser.cpp"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 491 "src/parser.y"


int yyerror(char const* message)
{
    std::cerr<<message<<std::endl;
    return -1;
}
