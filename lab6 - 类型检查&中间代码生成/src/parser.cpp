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
    SymbolEntry* curFunc;
    stack<string> varlist;
    stack<WhileStmt*> whilestack;

    int yylex();
    int yyerror( char const * );

#line 87 "src/parser.cpp"




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
  YYSYMBOL_52_2 = 52,                      /* $@2  */
  YYSYMBOL_BreakStmt = 53,                 /* BreakStmt  */
  YYSYMBOL_ContinueStmt = 54,              /* ContinueStmt  */
  YYSYMBOL_ReturnStmt = 55,                /* ReturnStmt  */
  YYSYMBOL_Exp = 56,                       /* Exp  */
  YYSYMBOL_Cond = 57,                      /* Cond  */
  YYSYMBOL_PrimaryExp = 58,                /* PrimaryExp  */
  YYSYMBOL_UnaryExp = 59,                  /* UnaryExp  */
  YYSYMBOL_MulExp = 60,                    /* MulExp  */
  YYSYMBOL_AddExp = 61,                    /* AddExp  */
  YYSYMBOL_RelExp = 62,                    /* RelExp  */
  YYSYMBOL_EqExp = 63,                     /* EqExp  */
  YYSYMBOL_LAndExp = 64,                   /* LAndExp  */
  YYSYMBOL_LOrExp = 65,                    /* LOrExp  */
  YYSYMBOL_Type = 66,                      /* Type  */
  YYSYMBOL_DeclStmt = 67,                  /* DeclStmt  */
  YYSYMBOL_VarDeclStmt = 68,               /* VarDeclStmt  */
  YYSYMBOL_VarDefList = 69,                /* VarDefList  */
  YYSYMBOL_VarDef = 70,                    /* VarDef  */
  YYSYMBOL_InitVal = 71,                   /* InitVal  */
  YYSYMBOL_ConstDeclStmt = 72,             /* ConstDeclStmt  */
  YYSYMBOL_ConstDefList = 73,              /* ConstDefList  */
  YYSYMBOL_ConstDef = 74,                  /* ConstDef  */
  YYSYMBOL_ConstInitVal = 75,              /* ConstInitVal  */
  YYSYMBOL_ConstExp = 76,                  /* ConstExp  */
  YYSYMBOL_FuncDef = 77,                   /* FuncDef  */
  YYSYMBOL_78_3 = 78,                      /* $@3  */
  YYSYMBOL_79_4 = 79,                      /* $@4  */
  YYSYMBOL_FuncFParams = 80,               /* FuncFParams  */
  YYSYMBOL_FuncFParam = 81,                /* FuncFParam  */
  YYSYMBOL_FuncRParams = 82,               /* FuncRParams  */
  YYSYMBOL_FuncRParam = 83                 /* FuncRParam  */
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
#define YYLAST   172

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  40
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  44
/* YYNRULES -- Number of rules.  */
#define YYNRULES  88
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  144

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
       0,    55,    55,    61,    63,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,    78,    81,    96,   101,   108,
     114,   114,   124,   130,   133,   138,   138,   152,   163,   174,
     180,   189,   193,   196,   197,   201,   205,   209,   211,   216,
     221,   225,   238,   240,   245,   250,   257,   259,   264,   271,
     273,   278,   283,   288,   295,   297,   302,   309,   311,   318,
     320,   327,   332,   336,   343,   345,   349,   352,   356,   360,
     368,   387,   393,   397,   402,   406,   433,   437,   441,   444,
     441,   471,   476,   480,   486,   501,   503,   508,   514
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
  "IfStmt", "WhileStmt", "$@2", "BreakStmt", "ContinueStmt", "ReturnStmt",
  "Exp", "Cond", "PrimaryExp", "UnaryExp", "MulExp", "AddExp", "RelExp",
  "EqExp", "LAndExp", "LOrExp", "Type", "DeclStmt", "VarDeclStmt",
  "VarDefList", "VarDef", "InitVal", "ConstDeclStmt", "ConstDefList",
  "ConstDef", "ConstInitVal", "ConstExp", "FuncDef", "$@3", "$@4",
  "FuncFParams", "FuncFParam", "FuncRParams", "FuncRParam", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-42)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-79)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     134,   -10,   -42,   -42,    24,     3,   -42,   -42,   -42,    21,
     -11,   -42,    21,    21,    21,    29,     8,    55,    56,    77,
     134,   -42,    15,   -42,   -42,   -42,   -42,   -42,   -42,   -42,
     -42,   -42,    59,   -42,   -42,    18,    19,    78,   -42,   -42,
     -42,   -42,    21,    21,    80,   -42,    65,   -42,   134,   -42,
     -42,   -42,    21,   -42,    64,   -42,   -42,   -42,   -42,    21,
     -42,    21,    21,    21,    21,    21,     5,    31,   -42,   -42,
       2,   -42,    71,    19,    -1,    49,    60,    62,    53,    39,
     -42,   -42,    88,    81,   -42,    75,   -42,   -42,   -42,    18,
      18,    21,    89,   -42,   101,   -42,    21,   134,    21,    21,
      21,    21,    21,    21,    21,    21,    21,   -42,    80,   -42,
     -42,   -42,   -42,   -42,     3,    76,   -42,   -42,    98,    19,
      19,    19,    19,    -1,    -1,    49,    60,    19,   -42,   -42,
     -42,   134,   106,     6,   -42,   134,   -42,   -42,   -42,     3,
     -42,    97,   -42,   -42
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       0,    16,    34,    35,     0,     0,    61,    62,    63,     0,
      20,    19,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     3,    33,     6,     5,    15,     7,     8,    11,     9,
      10,    12,     0,    37,    42,    46,    31,     0,    13,    64,
      65,    14,    87,     0,     0,    33,     0,    22,     0,    38,
      39,    40,     0,    29,     0,    27,    28,     1,     4,     0,
      17,     0,     0,     0,     0,     0,    69,     0,    68,    88,
       0,    85,     0,    49,    54,    57,    59,    32,     0,     0,
      74,    36,     0,     0,    30,     0,    45,    43,    44,    47,
      48,     0,     0,    66,     0,    41,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    72,     0,    21,
      25,    18,    71,    70,    83,    69,    67,    86,    23,    52,
      53,    51,    50,    55,    56,    58,    60,    77,    75,    76,
      73,     0,     0,     0,    82,     0,    26,    84,    79,     0,
      24,     0,    81,    80
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -42,   -42,    70,   -19,     0,   -42,   -42,   -42,   -22,   -42,
     -42,   -42,   -42,   -42,   -42,   -42,    -6,    68,   -42,    -7,
       9,   -34,   -41,    17,    22,   -42,    -3,   -42,   -42,   -42,
      28,   -42,   -42,   -42,    20,   -42,   -42,   -42,   -42,   -42,
     -42,    -9,   -42,    33
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_uint8 yydefgoto[] =
{
       0,    19,    20,    21,    45,    23,    24,    25,    26,    48,
      27,    28,   131,    29,    30,    31,    32,    72,    33,    34,
      35,    36,    74,    75,    76,    77,    37,    38,    39,    67,
      68,   113,    40,    79,    80,   128,   129,    41,    92,   141,
     133,   134,    70,    71
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      22,    58,    44,    46,    42,    49,    50,    51,    47,    73,
      54,     1,     2,     3,     6,     7,     8,    95,    73,   -78,
      22,   138,     9,    96,     1,     2,     3,   139,    53,    98,
      99,   100,   101,    12,    13,     9,    69,    14,    43,    91,
      61,    62,    63,    52,    64,    65,    12,    13,    22,    59,
      14,    93,    94,    85,    86,    87,    88,   102,   103,   107,
     108,   123,   124,    58,   119,   120,   121,   122,    73,    73,
      73,    73,   127,    89,    90,    55,    56,    57,   118,    60,
      81,    66,    22,    78,    84,   112,    97,   106,   104,   105,
      69,     1,     2,     3,     4,   111,   110,    22,     5,     6,
       7,     8,     9,   114,   115,   135,    10,   109,    11,   137,
      91,   132,   136,    12,    13,    10,   140,    14,    82,   143,
      83,   125,   116,    15,    16,    17,    18,   126,   130,   117,
     142,    22,     0,     0,     0,    22,   132,     1,     2,     3,
       4,     0,     0,     0,     5,     6,     7,     8,     9,     0,
       0,     0,    10,     0,    11,     0,     0,     0,     0,    12,
      13,     0,     0,    14,     0,     0,     0,     0,     0,    15,
      16,    17,    18
};

static const yytype_int16 yycheck[] =
{
       0,    20,     5,     9,    14,    12,    13,    14,    19,    43,
      16,     3,     4,     5,    11,    12,    13,    15,    52,    14,
      20,    15,    14,    21,     3,     4,     5,    21,    20,    30,
      31,    32,    33,    25,    26,    14,    42,    29,    14,    34,
      22,    23,    24,    14,    25,    26,    25,    26,    48,    34,
      29,    20,    21,    59,    61,    62,    63,     8,     9,    20,
      21,   102,   103,    82,    98,    99,   100,   101,   102,   103,
     104,   105,   106,    64,    65,    20,    20,     0,    97,    20,
      15,     3,    82,     3,    20,    91,    15,    34,    28,    27,
      96,     3,     4,     5,     6,    20,    15,    97,    10,    11,
      12,    13,    14,    14,     3,     7,    18,    19,    20,     3,
      34,   114,   131,    25,    26,    18,   135,    29,    48,   141,
      52,   104,    94,    35,    36,    37,    38,   105,   108,    96,
     139,   131,    -1,    -1,    -1,   135,   139,     3,     4,     5,
       6,    -1,    -1,    -1,    10,    11,    12,    13,    14,    -1,
      -1,    -1,    18,    -1,    20,    -1,    -1,    -1,    -1,    25,
      26,    -1,    -1,    29,    -1,    -1,    -1,    -1,    -1,    35,
      36,    37,    38
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     3,     4,     5,     6,    10,    11,    12,    13,    14,
      18,    20,    25,    26,    29,    35,    36,    37,    38,    41,
      42,    43,    44,    45,    46,    47,    48,    50,    51,    53,
      54,    55,    56,    58,    59,    60,    61,    66,    67,    68,
      72,    77,    14,    14,    66,    44,    56,    19,    49,    59,
      59,    59,    14,    20,    56,    20,    20,     0,    43,    34,
      20,    22,    23,    24,    25,    26,     3,    69,    70,    56,
      82,    83,    57,    61,    62,    63,    64,    65,     3,    73,
      74,    15,    42,    57,    20,    56,    59,    59,    59,    60,
      60,    34,    78,    20,    21,    15,    21,    15,    30,    31,
      32,    33,     8,     9,    28,    27,    34,    20,    21,    19,
      15,    20,    56,    71,    14,     3,    70,    83,    43,    61,
      61,    61,    61,    62,    62,    63,    64,    61,    75,    76,
      74,    52,    66,    80,    81,     7,    43,     3,    15,    21,
      43,    79,    81,    48
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    40,    41,    42,    42,    43,    43,    43,    43,    43,
      43,    43,    43,    43,    43,    43,    44,    45,    46,    47,
      49,    48,    48,    50,    50,    52,    51,    53,    54,    55,
      55,    56,    57,    58,    58,    58,    58,    59,    59,    59,
      59,    59,    60,    60,    60,    60,    61,    61,    61,    62,
      62,    62,    62,    62,    63,    63,    63,    64,    64,    65,
      65,    66,    66,    66,    67,    67,    68,    69,    69,    70,
      70,    71,    72,    73,    73,    74,    75,    76,    78,    79,
      77,    80,    80,    80,    81,    82,    82,    82,    83
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     2,     4,     1,
       0,     4,     2,     5,     7,     0,     6,     2,     2,     2,
       3,     1,     1,     1,     1,     1,     3,     1,     2,     2,
       2,     4,     1,     3,     3,     3,     1,     3,     3,     1,
       3,     3,     3,     3,     1,     3,     3,     1,     3,     1,
       3,     1,     1,     1,     1,     1,     3,     3,     1,     1,
       3,     1,     4,     3,     1,     3,     1,     1,     0,     0,
       8,     3,     1,     0,     2,     1,     3,     0,     1
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
#line 55 "src/parser.y"
            {
        ast.setRoot((yyvsp[0].stmttype));
    }
#line 1271 "src/parser.cpp"
    break;

  case 3: /* Stmts: Stmt  */
#line 61 "src/parser.y"
         { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1277 "src/parser.cpp"
    break;

  case 4: /* Stmts: Stmts Stmt  */
#line 63 "src/parser.y"
              {
        (yyval.stmttype) = new SeqNode((yyvsp[-1].stmttype), (yyvsp[0].stmttype));
    }
#line 1285 "src/parser.cpp"
    break;

  case 5: /* Stmt: AssignStmt  */
#line 68 "src/parser.y"
                 { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1291 "src/parser.cpp"
    break;

  case 6: /* Stmt: ExprStmt  */
#line 69 "src/parser.y"
               { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1297 "src/parser.cpp"
    break;

  case 7: /* Stmt: BlockStmt  */
#line 70 "src/parser.y"
                { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1303 "src/parser.cpp"
    break;

  case 8: /* Stmt: IfStmt  */
#line 71 "src/parser.y"
             { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1309 "src/parser.cpp"
    break;

  case 9: /* Stmt: BreakStmt  */
#line 72 "src/parser.y"
                { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1315 "src/parser.cpp"
    break;

  case 10: /* Stmt: ContinueStmt  */
#line 73 "src/parser.y"
                   { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1321 "src/parser.cpp"
    break;

  case 11: /* Stmt: WhileStmt  */
#line 74 "src/parser.y"
                { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1327 "src/parser.cpp"
    break;

  case 12: /* Stmt: ReturnStmt  */
#line 75 "src/parser.y"
                 { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1333 "src/parser.cpp"
    break;

  case 13: /* Stmt: DeclStmt  */
#line 76 "src/parser.y"
               { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1339 "src/parser.cpp"
    break;

  case 14: /* Stmt: FuncDef  */
#line 77 "src/parser.y"
              { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1345 "src/parser.cpp"
    break;

  case 15: /* Stmt: BlankStmt  */
#line 78 "src/parser.y"
                { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1351 "src/parser.cpp"
    break;

  case 16: /* LVal: ID  */
#line 81 "src/parser.y"
         {
        SymbolEntry *se;
        se = identifiers->lookup((yyvsp[0].strtype));
        if(se == nullptr) {
            fprintf(stderr, "identifier \"%s\" is undefined\n", (char*)(yyvsp[0].strtype));
            delete [](char*)(yyvsp[0].strtype);
            assert(se != nullptr);
        }
        (yyval.exprtype) = new Id(se);
        delete [](yyvsp[0].strtype);
    }
#line 1367 "src/parser.cpp"
    break;

  case 17: /* ExprStmt: Exp SEMICOLON  */
#line 96 "src/parser.y"
                  {
        (yyval.stmttype) = new ExprStmt((yyvsp[-1].exprtype));
    }
#line 1375 "src/parser.cpp"
    break;

  case 18: /* AssignStmt: LVal ASSIGN Exp SEMICOLON  */
#line 101 "src/parser.y"
                              {
        (yyval.stmttype) = new AssignStmt((yyvsp[-3].exprtype), (yyvsp[-1].exprtype));
    }
#line 1383 "src/parser.cpp"
    break;

  case 19: /* BlankStmt: SEMICOLON  */
#line 108 "src/parser.y"
              {
        (yyval.stmttype) = new BlankStmt();
    }
#line 1391 "src/parser.cpp"
    break;

  case 20: /* $@1: %empty  */
#line 114 "src/parser.y"
           {
        identifiers = new SymbolTable(identifiers);
    }
#line 1399 "src/parser.cpp"
    break;

  case 21: /* BlockStmt: LBRACE $@1 Stmts RBRACE  */
#line 117 "src/parser.y"
                 {
        (yyval.stmttype) = new CompoundStmt((yyvsp[-1].stmttype));
        SymbolTable *top = identifiers;
        identifiers = identifiers->getPrev();  // 块结束之后调整回上一级作用域
        delete top;
    }
#line 1410 "src/parser.cpp"
    break;

  case 22: /* BlockStmt: LBRACE RBRACE  */
#line 124 "src/parser.y"
                  {
        (yyval.stmttype)->setHaveRetStmt(false);
        (yyval.stmttype) = new CompoundStmt();
    }
#line 1419 "src/parser.cpp"
    break;

  case 23: /* IfStmt: IF LPAREN Cond RPAREN Stmt  */
#line 130 "src/parser.y"
                                            {
        (yyval.stmttype) = new IfStmt((yyvsp[-2].exprtype), (yyvsp[0].stmttype));
    }
#line 1427 "src/parser.cpp"
    break;

  case 24: /* IfStmt: IF LPAREN Cond RPAREN Stmt ELSE Stmt  */
#line 133 "src/parser.y"
                                           {
        (yyval.stmttype) = new IfElseStmt((yyvsp[-4].exprtype), (yyvsp[-2].stmttype), (yyvsp[0].stmttype));
    }
#line 1435 "src/parser.cpp"
    break;

  case 25: /* $@2: %empty  */
#line 138 "src/parser.y"
                               {
        WhileStmt *whileNode = new WhileStmt((yyvsp[-1].exprtype));
        // $<stmttype>$ = whileNode;
        whilestack.push(whileNode);
    }
#line 1445 "src/parser.cpp"
    break;

  case 26: /* WhileStmt: WHILE LPAREN Cond RPAREN $@2 Stmt  */
#line 143 "src/parser.y"
         {
        // StmtNode *whileNode = $<stmttype>5; 
        // ((WhileStmt*)whileNode)->setStmt($6);
        whilestack.top()->setStmt((yyvsp[0].stmttype));
        (yyval.stmttype) = whilestack.top();
        whilestack.pop();
    }
#line 1457 "src/parser.cpp"
    break;

  case 27: /* BreakStmt: BREAK SEMICOLON  */
#line 152 "src/parser.y"
                      {
        if(whilestack.empty()){
            (yyval.stmttype) = new BreakStmt(nullptr);
        }
        else{
            (yyval.stmttype) = new BreakStmt(whilestack.top());
        }
        // cout << "1" << endl;
    }
#line 1471 "src/parser.cpp"
    break;

  case 28: /* ContinueStmt: CONTINUE SEMICOLON  */
#line 163 "src/parser.y"
                         {
        // stack为空就不能直接调用top函数了，会报错
        if(whilestack.empty()){
            (yyval.stmttype) = new ContinueStmt(nullptr);
        }
        else{
            (yyval.stmttype) = new ContinueStmt(whilestack.top());
        }
    }
#line 1485 "src/parser.cpp"
    break;

  case 29: /* ReturnStmt: RETURN SEMICOLON  */
#line 174 "src/parser.y"
                       {
        ReturnStmt* ret = new ReturnStmt();
        ret->typeCheck(curFunc);
        ret->setHaveRetStmt(true);
        (yyval.stmttype) = ret;
    }
#line 1496 "src/parser.cpp"
    break;

  case 30: /* ReturnStmt: RETURN Exp SEMICOLON  */
#line 180 "src/parser.y"
                          {
        ReturnStmt* ret = new ReturnStmt((yyvsp[-1].exprtype));
        ret->typeCheck(curFunc);
        ret->setHaveRetStmt(true);
        (yyval.stmttype) = ret;
    }
#line 1507 "src/parser.cpp"
    break;

  case 31: /* Exp: AddExp  */
#line 189 "src/parser.y"
           {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1513 "src/parser.cpp"
    break;

  case 32: /* Cond: LOrExp  */
#line 193 "src/parser.y"
           {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1519 "src/parser.cpp"
    break;

  case 33: /* PrimaryExp: LVal  */
#line 196 "src/parser.y"
           { (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1525 "src/parser.cpp"
    break;

  case 34: /* PrimaryExp: INTEGER  */
#line 197 "src/parser.y"
              {
        SymbolEntry *se = new ConstantSymbolEntry(TypeSystem::intType, (yyvsp[0].itype));
        (yyval.exprtype) = new Constant(se);
    }
#line 1534 "src/parser.cpp"
    break;

  case 35: /* PrimaryExp: FLOATNUM  */
#line 201 "src/parser.y"
               {
        SymbolEntry *se = new ConstantSymbolEntry(TypeSystem::floatType, (yyvsp[0].ftype));
        (yyval.exprtype) = new Constant(se);
    }
#line 1543 "src/parser.cpp"
    break;

  case 36: /* PrimaryExp: LPAREN Exp RPAREN  */
#line 205 "src/parser.y"
                        { (yyval.exprtype) = (yyvsp[-1].exprtype); }
#line 1549 "src/parser.cpp"
    break;

  case 37: /* UnaryExp: PrimaryExp  */
#line 209 "src/parser.y"
               { (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1555 "src/parser.cpp"
    break;

  case 38: /* UnaryExp: ADD UnaryExp  */
#line 211 "src/parser.y"
                 {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new UnaryExpr(se, UnaryExpr::ADD, (yyvsp[0].exprtype));
    }
#line 1564 "src/parser.cpp"
    break;

  case 39: /* UnaryExp: SUB UnaryExp  */
#line 216 "src/parser.y"
                 {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new UnaryExpr(se, UnaryExpr::SUB, (yyvsp[0].exprtype));
    }
#line 1573 "src/parser.cpp"
    break;

  case 40: /* UnaryExp: NON UnaryExp  */
#line 221 "src/parser.y"
                 {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new UnaryExpr(se, UnaryExpr::NON, (yyvsp[0].exprtype));
    }
#line 1582 "src/parser.cpp"
    break;

  case 41: /* UnaryExp: ID LPAREN FuncRParams RPAREN  */
#line 225 "src/parser.y"
                                   {
        SymbolEntry *se;
        se = identifiers->lookup((yyvsp[-3].strtype));
        // fprintf(stderr, "se: %s\n", se->getType()->toStr().c_str());
        if (se == nullptr)
            fprintf(stderr, "function \"%s\" is undefined\n", (char*)(yyvsp[-3].strtype));
        else{
            (yyval.exprtype) = new CallExpr(se, (yyvsp[-1].exprtype));
        }
    }
#line 1597 "src/parser.cpp"
    break;

  case 42: /* MulExp: UnaryExp  */
#line 238 "src/parser.y"
             {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1603 "src/parser.cpp"
    break;

  case 43: /* MulExp: MulExp MUL UnaryExp  */
#line 240 "src/parser.y"
                        {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::MUL, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1612 "src/parser.cpp"
    break;

  case 44: /* MulExp: MulExp DIV UnaryExp  */
#line 245 "src/parser.y"
                        {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::DIV, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1621 "src/parser.cpp"
    break;

  case 45: /* MulExp: MulExp MOD UnaryExp  */
#line 250 "src/parser.y"
                        {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::MOD, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1630 "src/parser.cpp"
    break;

  case 46: /* AddExp: MulExp  */
#line 257 "src/parser.y"
           {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1636 "src/parser.cpp"
    break;

  case 47: /* AddExp: AddExp ADD MulExp  */
#line 259 "src/parser.y"
                      {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::ADD, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1645 "src/parser.cpp"
    break;

  case 48: /* AddExp: AddExp SUB MulExp  */
#line 264 "src/parser.y"
                      {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::SUB, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1654 "src/parser.cpp"
    break;

  case 49: /* RelExp: AddExp  */
#line 271 "src/parser.y"
           {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1660 "src/parser.cpp"
    break;

  case 50: /* RelExp: RelExp LORE AddExp  */
#line 273 "src/parser.y"
                       {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::LORE, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1669 "src/parser.cpp"
    break;

  case 51: /* RelExp: RelExp GORE AddExp  */
#line 278 "src/parser.y"
                       {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::GORE, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1678 "src/parser.cpp"
    break;

  case 52: /* RelExp: RelExp GREATER AddExp  */
#line 283 "src/parser.y"
                          {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::GREATER, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1687 "src/parser.cpp"
    break;

  case 53: /* RelExp: RelExp LESS AddExp  */
#line 288 "src/parser.y"
                       {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::LESS, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1696 "src/parser.cpp"
    break;

  case 54: /* EqExp: RelExp  */
#line 295 "src/parser.y"
           {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1702 "src/parser.cpp"
    break;

  case 55: /* EqExp: EqExp EQUAL RelExp  */
#line 297 "src/parser.y"
                       {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::EQUAL, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1711 "src/parser.cpp"
    break;

  case 56: /* EqExp: EqExp NOTEQUAL RelExp  */
#line 302 "src/parser.y"
                          {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::NOTEQUAL, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1720 "src/parser.cpp"
    break;

  case 57: /* LAndExp: EqExp  */
#line 309 "src/parser.y"
          {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1726 "src/parser.cpp"
    break;

  case 58: /* LAndExp: LAndExp AND EqExp  */
#line 311 "src/parser.y"
                      {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::AND, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1735 "src/parser.cpp"
    break;

  case 59: /* LOrExp: LAndExp  */
#line 318 "src/parser.y"
            {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1741 "src/parser.cpp"
    break;

  case 60: /* LOrExp: LOrExp OR LAndExp  */
#line 320 "src/parser.y"
                      {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::OR, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1750 "src/parser.cpp"
    break;

  case 61: /* Type: INT  */
#line 327 "src/parser.y"
        {
        (yyval.type) = TypeSystem::intType;
        declType = TypeSystem::intType;
    }
#line 1759 "src/parser.cpp"
    break;

  case 62: /* Type: VOID  */
#line 332 "src/parser.y"
         {
        (yyval.type) = TypeSystem::voidType;
    }
#line 1767 "src/parser.cpp"
    break;

  case 63: /* Type: FLOAT  */
#line 336 "src/parser.y"
         {
        (yyval.type) = TypeSystem::floatType;
        declType = TypeSystem::floatType;
    }
#line 1776 "src/parser.cpp"
    break;

  case 64: /* DeclStmt: VarDeclStmt  */
#line 343 "src/parser.y"
                {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 1782 "src/parser.cpp"
    break;

  case 65: /* DeclStmt: ConstDeclStmt  */
#line 345 "src/parser.y"
                  {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 1788 "src/parser.cpp"
    break;

  case 66: /* VarDeclStmt: Type VarDefList SEMICOLON  */
#line 349 "src/parser.y"
                              {(yyval.stmttype) = (yyvsp[-1].stmttype);}
#line 1794 "src/parser.cpp"
    break;

  case 67: /* VarDefList: VarDefList COMMA VarDef  */
#line 352 "src/parser.y"
                              {
        (yyval.stmttype) = (yyvsp[-2].stmttype);
        (yyvsp[-2].stmttype)->setNext((yyvsp[0].stmttype));
    }
#line 1803 "src/parser.cpp"
    break;

  case 68: /* VarDefList: VarDef  */
#line 356 "src/parser.y"
             {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 1809 "src/parser.cpp"
    break;

  case 69: /* VarDef: ID  */
#line 360 "src/parser.y"
       {
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(declType, (yyvsp[0].strtype), identifiers->getLevel());
        identifiers->install((yyvsp[0].strtype), se);
        (yyval.stmttype) = new DeclStmt(new Id(se));
        delete [](yyvsp[0].strtype);
    }
#line 1821 "src/parser.cpp"
    break;

  case 70: /* VarDef: ID ASSIGN InitVal  */
#line 368 "src/parser.y"
                      {
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(declType, (yyvsp[-2].strtype), identifiers->getLevel());
        identifiers->install((yyvsp[-2].strtype), se);
        
        // 这里展示的也是对expr node的属性的计算，这些node的值可以是float类型的，因为最后会进行int和float的判断
        if(declType->isFloat()){
            ((IdentifierSymbolEntry*)se)->setfValue((yyvsp[0].exprtype)->getValue()); 
        }
        if(declType->isInt()){
            ((IdentifierSymbolEntry*)se)->setiValue((yyvsp[0].exprtype)->getValue()); 
        }

        (yyval.stmttype) = new DeclStmt(new Id(se), (yyvsp[0].exprtype));
        delete [](yyvsp[-2].strtype);
    }
#line 1842 "src/parser.cpp"
    break;

  case 71: /* InitVal: Exp  */
#line 387 "src/parser.y"
        {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1848 "src/parser.cpp"
    break;

  case 72: /* ConstDeclStmt: CONST Type ConstDefList SEMICOLON  */
#line 393 "src/parser.y"
                                      {(yyval.stmttype) = (yyvsp[-1].stmttype);}
#line 1854 "src/parser.cpp"
    break;

  case 73: /* ConstDefList: ConstDefList COMMA ConstDef  */
#line 397 "src/parser.y"
                                {
        (yyval.stmttype) = (yyvsp[-2].stmttype);
        (yyvsp[-2].stmttype)->setNext((yyvsp[0].stmttype));
    }
#line 1863 "src/parser.cpp"
    break;

  case 74: /* ConstDefList: ConstDef  */
#line 402 "src/parser.y"
             {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 1869 "src/parser.cpp"
    break;

  case 75: /* ConstDef: ID ASSIGN ConstInitVal  */
#line 406 "src/parser.y"
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
        // 这里需要注意的是需要补充对expr node的属性的值的计算
        if(declType->isFloat()){
            ((IdentifierSymbolEntry*)se)->setfValue((yyvsp[0].exprtype)->getValue()); 
        }
        if(declType->isInt()){
            ((IdentifierSymbolEntry*)se)->setiValue((yyvsp[0].exprtype)->getValue()); 
        }
        
        (yyval.stmttype) = new DeclStmt(new Id(se), (yyvsp[0].exprtype));
        delete [](yyvsp[-2].strtype);
    }
#line 1898 "src/parser.cpp"
    break;

  case 76: /* ConstInitVal: ConstExp  */
#line 433 "src/parser.y"
             {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1904 "src/parser.cpp"
    break;

  case 77: /* ConstExp: AddExp  */
#line 437 "src/parser.y"
           {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1910 "src/parser.cpp"
    break;

  case 78: /* $@3: %empty  */
#line 441 "src/parser.y"
            {
        identifiers = new SymbolTable(identifiers);  // 申请新的符号表，此时为该函数的符号表
    }
#line 1918 "src/parser.cpp"
    break;

  case 79: /* $@4: %empty  */
#line 444 "src/parser.y"
                              {
        Type* funcType;
        std::vector<SymbolEntry*> params;
        DeclStmt* temp = (DeclStmt*)(yyvsp[-1].stmttype);  // 将所有形参全部装入params
        while(temp) {
            params.push_back(temp->getId()->getSymPtr());
            temp = (DeclStmt*)(temp->getNext());
        }
        funcType = new FunctionType((yyvsp[-5].type), params);
        SymbolEntry* se = new IdentifierSymbolEntry(funcType, (yyvsp[-4].strtype), identifiers->getPrev()->getLevel());
        identifiers->getPrev()->install((yyvsp[-4].strtype), se);  // 将函数ID和函数类型装入符号表，这个是该函数上一级的符号表

        curFunc = se;  // 使用一个全局变量来存最近的一个函数的ID，用于return的类型检查
    }
#line 1937 "src/parser.cpp"
    break;

  case 80: /* FuncDef: Type ID $@3 LPAREN FuncFParams RPAREN $@4 BlockStmt  */
#line 458 "src/parser.y"
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
#line 1952 "src/parser.cpp"
    break;

  case 81: /* FuncFParams: FuncFParams COMMA FuncFParam  */
#line 471 "src/parser.y"
                                 {
        (yyval.stmttype) = (yyvsp[-2].stmttype);
        (yyval.stmttype)->setNext((yyvsp[0].stmttype));
    }
#line 1961 "src/parser.cpp"
    break;

  case 82: /* FuncFParams: FuncFParam  */
#line 476 "src/parser.y"
               {
        (yyval.stmttype) = (yyvsp[0].stmttype);
    }
#line 1969 "src/parser.cpp"
    break;

  case 83: /* FuncFParams: %empty  */
#line 480 "src/parser.y"
          {  // 无参数的情况
        (yyval.stmttype) = nullptr;
    }
#line 1977 "src/parser.cpp"
    break;

  case 84: /* FuncFParam: Type ID  */
#line 486 "src/parser.y"
            {
        SymbolEntry* se;
        // se = new IdentifierSymbolEntry($1, $2, identifiers->getLevel(), paramNo++);
        se = new IdentifierSymbolEntry((yyvsp[-1].type), (yyvsp[0].strtype), identifiers->getLevel());
        identifiers->install((yyvsp[0].strtype), se);  // 形参存入当前函数的符号表

        ((IdentifierSymbolEntry*)se)->setLabel();
        ((IdentifierSymbolEntry*)se)->setAddr(new Operand(se));
        
        (yyval.stmttype) = new DeclStmt(new Id(se));
        delete [](yyvsp[0].strtype);
    }
#line 1994 "src/parser.cpp"
    break;

  case 85: /* FuncRParams: FuncRParam  */
#line 501 "src/parser.y"
               {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 2000 "src/parser.cpp"
    break;

  case 86: /* FuncRParams: FuncRParams COMMA FuncRParam  */
#line 503 "src/parser.y"
                                 {
        (yyval.exprtype) = (yyvsp[-2].exprtype);
        (yyval.exprtype)->setNext((yyvsp[0].exprtype));
    }
#line 2009 "src/parser.cpp"
    break;

  case 87: /* FuncRParams: %empty  */
#line 508 "src/parser.y"
          {
        (yyval.exprtype) = nullptr;
    }
#line 2017 "src/parser.cpp"
    break;

  case 88: /* FuncRParam: Exp  */
#line 514 "src/parser.y"
        {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 2023 "src/parser.cpp"
    break;


#line 2027 "src/parser.cpp"

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

#line 516 "src/parser.y"


int yyerror(char const* message)
{
    std::cerr<<message<<std::endl;
    return -1;
}
