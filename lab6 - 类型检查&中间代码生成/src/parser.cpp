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
    #include "parser.h"
    #include <cstring>
    #include <stack>
    extern Ast ast;

    std::stack<InitValueListExpr*> stk;
    std::stack<StmtNode*> whileStk;
    ArrayType* arrayType;
    InitValueListExpr* top;
    SymbolEntry* curFunc;
    // int* arrayValue;

    int leftCnt = 0;
    int paramNo = 0;
    // int idx;
    
    int yylex();
    int yyerror(char const*);

#line 91 "src/parser.cpp"




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
  YYSYMBOL_STRING = 4,                     /* STRING  */
  YYSYMBOL_INTEGER = 5,                    /* INTEGER  */
  YYSYMBOL_IF = 6,                         /* IF  */
  YYSYMBOL_ELSE = 7,                       /* ELSE  */
  YYSYMBOL_WHILE = 8,                      /* WHILE  */
  YYSYMBOL_INT = 9,                        /* INT  */
  YYSYMBOL_VOID = 10,                      /* VOID  */
  YYSYMBOL_LPAREN = 11,                    /* LPAREN  */
  YYSYMBOL_RPAREN = 12,                    /* RPAREN  */
  YYSYMBOL_LBRACE = 13,                    /* LBRACE  */
  YYSYMBOL_RBRACE = 14,                    /* RBRACE  */
  YYSYMBOL_SEMICOLON = 15,                 /* SEMICOLON  */
  YYSYMBOL_LBRACKET = 16,                  /* LBRACKET  */
  YYSYMBOL_RBRACKET = 17,                  /* RBRACKET  */
  YYSYMBOL_COMMA = 18,                     /* COMMA  */
  YYSYMBOL_ADD = 19,                       /* ADD  */
  YYSYMBOL_SUB = 20,                       /* SUB  */
  YYSYMBOL_MUL = 21,                       /* MUL  */
  YYSYMBOL_DIV = 22,                       /* DIV  */
  YYSYMBOL_MOD = 23,                       /* MOD  */
  YYSYMBOL_OR = 24,                        /* OR  */
  YYSYMBOL_AND = 25,                       /* AND  */
  YYSYMBOL_LESS = 26,                      /* LESS  */
  YYSYMBOL_LESSEQUAL = 27,                 /* LESSEQUAL  */
  YYSYMBOL_GREATER = 28,                   /* GREATER  */
  YYSYMBOL_GREATEREQUAL = 29,              /* GREATEREQUAL  */
  YYSYMBOL_ASSIGN = 30,                    /* ASSIGN  */
  YYSYMBOL_EQUAL = 31,                     /* EQUAL  */
  YYSYMBOL_NOTEQUAL = 32,                  /* NOTEQUAL  */
  YYSYMBOL_NOT = 33,                       /* NOT  */
  YYSYMBOL_CONST = 34,                     /* CONST  */
  YYSYMBOL_RETURN = 35,                    /* RETURN  */
  YYSYMBOL_CONTINUE = 36,                  /* CONTINUE  */
  YYSYMBOL_BREAK = 37,                     /* BREAK  */
  YYSYMBOL_THEN = 38,                      /* THEN  */
  YYSYMBOL_YYACCEPT = 39,                  /* $accept  */
  YYSYMBOL_Program = 40,                   /* Program  */
  YYSYMBOL_Stmts = 41,                     /* Stmts  */
  YYSYMBOL_Stmt = 42,                      /* Stmt  */
  YYSYMBOL_LVal = 43,                      /* LVal  */
  YYSYMBOL_AssignStmt = 44,                /* AssignStmt  */
  YYSYMBOL_ExprStmt = 45,                  /* ExprStmt  */
  YYSYMBOL_BlankStmt = 46,                 /* BlankStmt  */
  YYSYMBOL_BlockStmt = 47,                 /* BlockStmt  */
  YYSYMBOL_48_1 = 48,                      /* $@1  */
  YYSYMBOL_IfStmt = 49,                    /* IfStmt  */
  YYSYMBOL_WhileStmt = 50,                 /* WhileStmt  */
  YYSYMBOL_51_2 = 51,                      /* $@2  */
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
  YYSYMBOL_ConstExp = 65,                  /* ConstExp  */
  YYSYMBOL_FuncRParams = 66,               /* FuncRParams  */
  YYSYMBOL_Type = 67,                      /* Type  */
  YYSYMBOL_DeclStmt = 68,                  /* DeclStmt  */
  YYSYMBOL_VarDeclStmt = 69,               /* VarDeclStmt  */
  YYSYMBOL_ConstDeclStmt = 70,             /* ConstDeclStmt  */
  YYSYMBOL_VarDefList = 71,                /* VarDefList  */
  YYSYMBOL_ConstDefList = 72,              /* ConstDefList  */
  YYSYMBOL_VarDef = 73,                    /* VarDef  */
  YYSYMBOL_ConstDef = 74,                  /* ConstDef  */
  YYSYMBOL_ArrayIndices = 75,              /* ArrayIndices  */
  YYSYMBOL_InitVal = 76,                   /* InitVal  */
  YYSYMBOL_ConstInitVal = 77,              /* ConstInitVal  */
  YYSYMBOL_FuncDef = 78,                   /* FuncDef  */
  YYSYMBOL_79_3 = 79,                      /* $@3  */
  YYSYMBOL_80_4 = 80,                      /* @4  */
  YYSYMBOL_OptFuncFParams = 81,            /* OptFuncFParams  */
  YYSYMBOL_FuncFParams = 82,               /* FuncFParams  */
  YYSYMBOL_FuncFParam = 83,                /* FuncFParam  */
  YYSYMBOL_FuncArrayIndices = 84           /* FuncArrayIndices  */
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
#define YYLAST   211

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  39
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  46
/* YYNRULES -- Number of rules.  */
#define YYNRULES  93
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  157

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   293


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
      35,    36,    37,    38
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    58,    58,    63,    64,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    82,    89,   101,   106,
     111,   116,   116,   125,   132,   135,   140,   140,   152,   157,
     163,   169,   178,   182,   185,   188,   191,   195,   206,   214,
     215,   216,   220,   226,   227,   231,   235,   241,   242,   246,
     252,   253,   257,   261,   265,   271,   272,   276,   282,   283,
     289,   290,   296,   299,   300,   306,   310,   315,   316,   319,
     322,   325,   329,   332,   336,   339,   346,   354,   390,   404,
     407,   413,   416,   420,   424,   420,   451,   452,   455,   459,
     464,   473,   501,   504
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
  "\"end of file\"", "error", "\"invalid token\"", "ID", "STRING",
  "INTEGER", "IF", "ELSE", "WHILE", "INT", "VOID", "LPAREN", "RPAREN",
  "LBRACE", "RBRACE", "SEMICOLON", "LBRACKET", "RBRACKET", "COMMA", "ADD",
  "SUB", "MUL", "DIV", "MOD", "OR", "AND", "LESS", "LESSEQUAL", "GREATER",
  "GREATEREQUAL", "ASSIGN", "EQUAL", "NOTEQUAL", "NOT", "CONST", "RETURN",
  "CONTINUE", "BREAK", "THEN", "$accept", "Program", "Stmts", "Stmt",
  "LVal", "AssignStmt", "ExprStmt", "BlankStmt", "BlockStmt", "$@1",
  "IfStmt", "WhileStmt", "$@2", "BreakStmt", "ContinueStmt", "ReturnStmt",
  "Exp", "Cond", "PrimaryExp", "UnaryExp", "MulExp", "AddExp", "RelExp",
  "EqExp", "LAndExp", "LOrExp", "ConstExp", "FuncRParams", "Type",
  "DeclStmt", "VarDeclStmt", "ConstDeclStmt", "VarDefList", "ConstDefList",
  "VarDef", "ConstDef", "ArrayIndices", "InitVal", "ConstInitVal",
  "FuncDef", "$@3", "@4", "OptFuncFParams", "FuncFParams", "FuncFParam",
  "FuncArrayIndices", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-73)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-84)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     174,    32,   -73,    -6,    15,   -73,   -73,    35,    16,   -73,
      35,    35,    35,    57,    12,    19,    36,    53,   174,   -73,
      40,   -73,   -73,   -73,   -73,   -73,   -73,   -73,   -73,   -73,
      73,   -73,   -73,    39,    60,    89,   -73,   -73,   -73,   -73,
      17,    35,    78,    35,    35,   -73,    83,   -73,   174,   -73,
     -73,   -73,    93,   -73,    82,   -73,   -73,   -73,   -73,    35,
     -73,    35,    35,    35,    35,    35,     5,    -9,   -73,   -73,
     -73,     6,    60,    81,    35,    87,    60,    30,    51,    75,
      77,    90,   -73,   139,    76,    29,   -73,   -73,    88,   -73,
     -73,   -73,    39,    39,    35,    78,    94,   -73,   104,   -73,
      35,   -73,    91,   174,    35,    35,    35,    35,    35,    35,
      35,    35,   -73,   -73,    35,   -73,    93,   -73,   -73,   -73,
      57,     9,   -73,   -73,   -73,   102,    60,    60,    60,    60,
      30,    30,    51,    75,   174,   -73,   -73,   -73,   108,   100,
      95,   -73,   174,   -73,    98,   -73,    57,   -73,    99,   101,
     105,   -73,   -73,    35,   -73,   106,   -73
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       0,    16,    36,     0,     0,    65,    66,     0,    21,    20,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
      35,     5,     6,     8,     7,     9,    10,    11,    12,    13,
       0,    39,    43,    47,    32,     0,    14,    67,    68,    15,
       0,     0,    17,     0,     0,    35,     0,    23,     0,    40,
      41,    42,     0,    30,     0,    29,    28,     1,     4,     0,
      19,     0,     0,     0,     0,     0,    75,     0,    72,    38,
      63,     0,    62,     0,     0,     0,    50,    55,    58,    60,
      33,     0,    34,     0,     0,     0,    74,    31,     0,    44,
      45,    46,    48,    49,     0,    77,     0,    69,     0,    37,
       0,    79,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,    22,     0,    70,     0,    18,    81,    76,
      87,    75,    71,    64,    80,    24,    51,    52,    53,    54,
      56,    57,    59,    61,     0,    82,    78,    73,     0,     0,
      86,    89,     0,    27,    90,    84,     0,    25,     0,    91,
       0,    88,    92,     0,    85,     0,    93
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -73,   -73,    67,   -14,     1,   -73,   -73,   -73,   -31,   -73,
     -73,   -73,   -73,   -73,   -73,   -73,    -7,    80,   -73,     2,
      21,   -33,   -18,    11,    14,   -73,   -72,   -73,   -10,   -73,
     -73,   -73,   -73,   -73,    24,    10,   126,   -73,   -73,   -73,
     -73,   -73,   -73,   -73,   -17,   -73
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_uint8 yydefgoto[] =
{
       0,    17,    18,    19,    45,    21,    22,    23,    24,    48,
      25,    26,   134,    27,    28,    29,    30,    75,    31,    32,
      33,    34,    77,    78,    79,    80,    73,    71,    35,    36,
      37,    38,    67,    85,    68,    86,    95,   119,   136,    39,
      96,   150,   139,   140,   141,   149
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      46,    20,   102,    52,    58,    43,    97,    54,    72,    98,
      76,    76,    49,    50,    51,     1,   -83,     2,    99,    20,
       1,    41,     2,     7,   100,    41,    44,    53,     7,    69,
      47,    10,    11,    70,    55,    94,    10,    11,     1,    94,
       2,    72,   135,    40,   115,    12,     7,   116,    41,    20,
      12,    56,    88,    57,    10,    11,   104,   105,   106,   107,
      61,    62,    63,    89,    90,    91,     5,     6,    12,    58,
      59,   126,   127,   128,   129,    76,    76,    76,    76,    64,
      65,    72,   108,   109,    20,    92,    93,   118,    60,   125,
     130,   131,    66,   123,    74,    82,    84,    87,   101,   103,
     110,   111,   112,   117,    20,   120,   114,   121,   124,   142,
     138,   144,   145,   146,   148,    83,   152,   153,     8,   154,
     143,   132,   122,   156,    81,   133,   137,    42,   147,   151,
       0,     0,     0,     0,     0,    20,   138,     0,     0,     0,
       0,     0,     1,    20,     2,     3,   155,     4,     5,     6,
       7,     0,     8,   113,     9,     0,     0,     0,    10,    11,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    12,    13,    14,    15,    16,     1,     0,     2,
       3,     0,     4,     5,     6,     7,     0,     8,     0,     9,
       0,     0,     0,    10,    11,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    12,    13,    14,
      15,    16
};

static const yytype_int16 yycheck[] =
{
       7,     0,    74,    13,    18,    11,    15,    14,    41,    18,
      43,    44,    10,    11,    12,     3,    11,     5,    12,    18,
       3,    16,     5,    11,    18,    16,    11,    15,    11,    12,
      14,    19,    20,    40,    15,    30,    19,    20,     3,    30,
       5,    74,   114,    11,    15,    33,    11,    18,    16,    48,
      33,    15,    59,     0,    19,    20,    26,    27,    28,    29,
      21,    22,    23,    61,    62,    63,     9,    10,    33,    83,
      30,   104,   105,   106,   107,   108,   109,   110,   111,    19,
      20,   114,    31,    32,    83,    64,    65,    94,    15,   103,
     108,   109,     3,   100,    16,    12,     3,    15,    17,    12,
      25,    24,    12,    15,   103,    11,    30,     3,    17,     7,
     120,     3,    12,    18,    16,    48,    17,    16,    13,   150,
     134,   110,    98,    17,    44,   111,   116,     1,   142,   146,
      -1,    -1,    -1,    -1,    -1,   134,   146,    -1,    -1,    -1,
      -1,    -1,     3,   142,     5,     6,   153,     8,     9,    10,
      11,    -1,    13,    14,    15,    -1,    -1,    -1,    19,    20,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    33,    34,    35,    36,    37,     3,    -1,     5,
       6,    -1,     8,     9,    10,    11,    -1,    13,    -1,    15,
      -1,    -1,    -1,    19,    20,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    33,    34,    35,
      36,    37
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     3,     5,     6,     8,     9,    10,    11,    13,    15,
      19,    20,    33,    34,    35,    36,    37,    40,    41,    42,
      43,    44,    45,    46,    47,    49,    50,    52,    53,    54,
      55,    57,    58,    59,    60,    67,    68,    69,    70,    78,
      11,    16,    75,    11,    11,    43,    55,    14,    48,    58,
      58,    58,    67,    15,    55,    15,    15,     0,    42,    30,
      15,    21,    22,    23,    19,    20,     3,    71,    73,    12,
      55,    66,    60,    65,    16,    56,    60,    61,    62,    63,
      64,    56,    12,    41,     3,    72,    74,    15,    55,    58,
      58,    58,    59,    59,    30,    75,    79,    15,    18,    12,
      18,    17,    65,    12,    26,    27,    28,    29,    31,    32,
      25,    24,    12,    14,    30,    15,    18,    15,    55,    76,
      11,     3,    73,    55,    17,    42,    60,    60,    60,    60,
      61,    61,    62,    63,    51,    65,    77,    74,    67,    81,
      82,    83,     7,    42,     3,    12,    18,    42,    16,    84,
      80,    83,    17,    16,    47,    55,    17
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    39,    40,    41,    41,    42,    42,    42,    42,    42,
      42,    42,    42,    42,    42,    42,    43,    43,    44,    45,
      46,    48,    47,    47,    49,    49,    51,    50,    52,    53,
      54,    54,    55,    56,    57,    57,    57,    57,    57,    58,
      58,    58,    58,    59,    59,    59,    59,    60,    60,    60,
      61,    61,    61,    61,    61,    62,    62,    62,    63,    63,
      64,    64,    65,    66,    66,    67,    67,    68,    68,    69,
      70,    71,    71,    72,    72,    73,    73,    73,    74,    75,
      75,    76,    77,    79,    80,    78,    81,    81,    82,    82,
      83,    83,    84,    84
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     2,     4,     2,
       1,     0,     4,     2,     5,     7,     0,     6,     2,     2,
       2,     3,     1,     1,     3,     1,     1,     4,     3,     1,
       2,     2,     2,     1,     3,     3,     3,     1,     3,     3,
       1,     3,     3,     3,     3,     1,     3,     3,     1,     3,
       1,     3,     1,     1,     3,     1,     1,     1,     1,     3,
       4,     3,     1,     3,     1,     1,     3,     2,     3,     3,
       4,     1,     1,     0,     0,     8,     1,     0,     3,     1,
       2,     3,     2,     4
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
#line 58 "src/parser.y"
            {
        ast.setRoot((yyvsp[0].stmttype));
    }
#line 1291 "src/parser.cpp"
    break;

  case 3: /* Stmts: Stmt  */
#line 63 "src/parser.y"
           { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1297 "src/parser.cpp"
    break;

  case 4: /* Stmts: Stmts Stmt  */
#line 64 "src/parser.y"
                {
        (yyval.stmttype) = new SeqNode((yyvsp[-1].stmttype), (yyvsp[0].stmttype));
    }
#line 1305 "src/parser.cpp"
    break;

  case 5: /* Stmt: AssignStmt  */
#line 69 "src/parser.y"
                 { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1311 "src/parser.cpp"
    break;

  case 6: /* Stmt: ExprStmt  */
#line 70 "src/parser.y"
               { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1317 "src/parser.cpp"
    break;

  case 7: /* Stmt: BlockStmt  */
#line 71 "src/parser.y"
                { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1323 "src/parser.cpp"
    break;

  case 8: /* Stmt: BlankStmt  */
#line 72 "src/parser.y"
                { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1329 "src/parser.cpp"
    break;

  case 9: /* Stmt: IfStmt  */
#line 73 "src/parser.y"
             { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1335 "src/parser.cpp"
    break;

  case 10: /* Stmt: WhileStmt  */
#line 74 "src/parser.y"
                { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1341 "src/parser.cpp"
    break;

  case 11: /* Stmt: BreakStmt  */
#line 75 "src/parser.y"
                { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1347 "src/parser.cpp"
    break;

  case 12: /* Stmt: ContinueStmt  */
#line 76 "src/parser.y"
                   { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1353 "src/parser.cpp"
    break;

  case 13: /* Stmt: ReturnStmt  */
#line 77 "src/parser.y"
                 { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1359 "src/parser.cpp"
    break;

  case 14: /* Stmt: DeclStmt  */
#line 78 "src/parser.y"
               { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1365 "src/parser.cpp"
    break;

  case 15: /* Stmt: FuncDef  */
#line 79 "src/parser.y"
              { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1371 "src/parser.cpp"
    break;

  case 16: /* LVal: ID  */
#line 82 "src/parser.y"
         {
        SymbolEntry* se;
        se = identifiers->lookup((yyvsp[0].strtype));
        if (se == nullptr) fprintf(stderr, "ID %s 未定义!\n", (char*)(yyvsp[0].strtype));
        (yyval.exprtype) = new Id(se);
        delete [](yyvsp[0].strtype);
    }
#line 1383 "src/parser.cpp"
    break;

  case 17: /* LVal: ID ArrayIndices  */
#line 89 "src/parser.y"
                      {
        // TODO
        /*
        SymbolEntry* se;
        se = identifiers->lookup($1);
        if (se == nullptr) fprintf(stderr, "ID %s 未定义!\n", (char*)$1);
        $$ = new Id(se, $2);
        delete []$1;
        */
    }
#line 1398 "src/parser.cpp"
    break;

  case 18: /* AssignStmt: LVal ASSIGN Exp SEMICOLON  */
#line 101 "src/parser.y"
                                {
        (yyval.stmttype) = new AssignStmt((yyvsp[-3].exprtype), (yyvsp[-1].exprtype));
    }
#line 1406 "src/parser.cpp"
    break;

  case 19: /* ExprStmt: Exp SEMICOLON  */
#line 106 "src/parser.y"
                    {
        (yyval.stmttype) = new ExprStmt((yyvsp[-1].exprtype));
    }
#line 1414 "src/parser.cpp"
    break;

  case 20: /* BlankStmt: SEMICOLON  */
#line 111 "src/parser.y"
                {
        (yyval.stmttype) = new BlankStmt();
    }
#line 1422 "src/parser.cpp"
    break;

  case 21: /* $@1: %empty  */
#line 116 "src/parser.y"
             {
        identifiers = new SymbolTable(identifiers);  // 新作用域
    }
#line 1430 "src/parser.cpp"
    break;

  case 22: /* BlockStmt: LBRACE $@1 Stmts RBRACE  */
#line 119 "src/parser.y"
                 {
        (yyval.stmttype) = new CompoundStmt((yyvsp[-1].stmttype));
        SymbolTable* top = identifiers;
        identifiers = identifiers->getPrev();  // 块结束之后调整回上一级作用域
        delete top;
    }
#line 1441 "src/parser.cpp"
    break;

  case 23: /* BlockStmt: LBRACE RBRACE  */
#line 125 "src/parser.y"
                    {
        // TODO
        //$$->setHaveRetStmt(false);
        (yyval.stmttype) = new BlankStmt();
    }
#line 1451 "src/parser.cpp"
    break;

  case 24: /* IfStmt: IF LPAREN Cond RPAREN Stmt  */
#line 132 "src/parser.y"
                                            {
        (yyval.stmttype) = new IfStmt((yyvsp[-2].exprtype), (yyvsp[0].stmttype));
    }
#line 1459 "src/parser.cpp"
    break;

  case 25: /* IfStmt: IF LPAREN Cond RPAREN Stmt ELSE Stmt  */
#line 135 "src/parser.y"
                                           {
        (yyval.stmttype) = new IfElseStmt((yyvsp[-4].exprtype), (yyvsp[-2].stmttype), (yyvsp[0].stmttype));
    }
#line 1467 "src/parser.cpp"
    break;

  case 26: /* $@2: %empty  */
#line 140 "src/parser.y"
                               {
        StmtNode *whileNode = new WhileStmt((yyvsp[-1].exprtype));    
        whileStk.push(whileNode);
    }
#line 1476 "src/parser.cpp"
    break;

  case 27: /* WhileStmt: WHILE LPAREN Cond RPAREN $@2 Stmt  */
#line 144 "src/parser.y"
         {  
        StmtNode *whileNode = whileStk.top();
        ((WhileStmt*)whileNode)->setStmt((yyvsp[0].stmttype));  // 设置内部stmt语句
        (yyval.stmttype) = whileNode;
        whileStk.pop();
    }
#line 1487 "src/parser.cpp"
    break;

  case 28: /* BreakStmt: BREAK SEMICOLON  */
#line 152 "src/parser.y"
                      {
        (yyval.stmttype) = new BreakStmt(whileStk.top());
    }
#line 1495 "src/parser.cpp"
    break;

  case 29: /* ContinueStmt: CONTINUE SEMICOLON  */
#line 157 "src/parser.y"
                         {
        (yyval.stmttype) = new ContinueStmt(whileStk.top());
    }
#line 1503 "src/parser.cpp"
    break;

  case 30: /* ReturnStmt: RETURN SEMICOLON  */
#line 163 "src/parser.y"
                       {
        ReturnStmt* ret = new ReturnStmt();
        // ret->typeCheck(curFunc);
        // ret->setHaveRetStmt(true);
        (yyval.stmttype) = ret;
    }
#line 1514 "src/parser.cpp"
    break;

  case 31: /* ReturnStmt: RETURN Exp SEMICOLON  */
#line 169 "src/parser.y"
                           {
        ReturnStmt* ret = new ReturnStmt((yyvsp[-1].exprtype));
        // ret->typeCheck(curFunc);
        // ret->setHaveRetStmt(true);
        (yyval.stmttype) = ret;
    }
#line 1525 "src/parser.cpp"
    break;

  case 32: /* Exp: AddExp  */
#line 178 "src/parser.y"
           { (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1531 "src/parser.cpp"
    break;

  case 33: /* Cond: LOrExp  */
#line 182 "src/parser.y"
           { (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1537 "src/parser.cpp"
    break;

  case 34: /* PrimaryExp: LPAREN Exp RPAREN  */
#line 185 "src/parser.y"
                        {
        (yyval.exprtype) = (yyvsp[-1].exprtype);
    }
#line 1545 "src/parser.cpp"
    break;

  case 35: /* PrimaryExp: LVal  */
#line 188 "src/parser.y"
           {
        (yyval.exprtype) = (yyvsp[0].exprtype);
    }
#line 1553 "src/parser.cpp"
    break;

  case 36: /* PrimaryExp: INTEGER  */
#line 191 "src/parser.y"
              {
        SymbolEntry* se = new ConstantSymbolEntry(TypeSystem::intType, (yyvsp[0].itype));
        (yyval.exprtype) = new Constant(se);
    }
#line 1562 "src/parser.cpp"
    break;

  case 37: /* PrimaryExp: ID LPAREN FuncRParams RPAREN  */
#line 195 "src/parser.y"
                                   {
        SymbolEntry* se;
        se = identifiers->lookup((yyvsp[-3].strtype));
        // TODO
        if (se == nullptr) {
            fprintf(stderr, "函数 %s 未定义\n", (char*)(yyvsp[-3].strtype));
        }
        else {
            (yyval.exprtype) = new CallExpr(se, (yyvsp[-1].exprtype));
        }
    }
#line 1578 "src/parser.cpp"
    break;

  case 38: /* PrimaryExp: ID LPAREN RPAREN  */
#line 206 "src/parser.y"
                       {
        SymbolEntry* se;
        se = identifiers->lookup((yyvsp[-2].strtype));
        (yyval.exprtype) = new CallExpr(se);
    }
#line 1588 "src/parser.cpp"
    break;

  case 39: /* UnaryExp: PrimaryExp  */
#line 214 "src/parser.y"
                 { (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1594 "src/parser.cpp"
    break;

  case 40: /* UnaryExp: ADD UnaryExp  */
#line 215 "src/parser.y"
                   { (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1600 "src/parser.cpp"
    break;

  case 41: /* UnaryExp: SUB UnaryExp  */
#line 216 "src/parser.y"
                   {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new UnaryExpr(se, UnaryExpr::SUB, (yyvsp[0].exprtype));
    }
#line 1609 "src/parser.cpp"
    break;

  case 42: /* UnaryExp: NOT UnaryExp  */
#line 220 "src/parser.y"
                   {  // 注意NOT是Bool类型
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new UnaryExpr(se, UnaryExpr::NOT, (yyvsp[0].exprtype));
    }
#line 1618 "src/parser.cpp"
    break;

  case 43: /* MulExp: UnaryExp  */
#line 226 "src/parser.y"
               {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1624 "src/parser.cpp"
    break;

  case 44: /* MulExp: MulExp MUL UnaryExp  */
#line 227 "src/parser.y"
                          {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::MUL, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1633 "src/parser.cpp"
    break;

  case 45: /* MulExp: MulExp DIV UnaryExp  */
#line 231 "src/parser.y"
                          {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::DIV, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1642 "src/parser.cpp"
    break;

  case 46: /* MulExp: MulExp MOD UnaryExp  */
#line 235 "src/parser.y"
                          {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::MOD, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1651 "src/parser.cpp"
    break;

  case 47: /* AddExp: MulExp  */
#line 241 "src/parser.y"
             { (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1657 "src/parser.cpp"
    break;

  case 48: /* AddExp: AddExp ADD MulExp  */
#line 242 "src/parser.y"
                        {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::ADD, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1666 "src/parser.cpp"
    break;

  case 49: /* AddExp: AddExp SUB MulExp  */
#line 246 "src/parser.y"
                        {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::SUB, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1675 "src/parser.cpp"
    break;

  case 50: /* RelExp: AddExp  */
#line 252 "src/parser.y"
             { (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1681 "src/parser.cpp"
    break;

  case 51: /* RelExp: RelExp LESS AddExp  */
#line 253 "src/parser.y"
                         {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::LESS, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1690 "src/parser.cpp"
    break;

  case 52: /* RelExp: RelExp LESSEQUAL AddExp  */
#line 257 "src/parser.y"
                              {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::LESSEQUAL, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1699 "src/parser.cpp"
    break;

  case 53: /* RelExp: RelExp GREATER AddExp  */
#line 261 "src/parser.y"
                            {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::GREATER, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1708 "src/parser.cpp"
    break;

  case 54: /* RelExp: RelExp GREATEREQUAL AddExp  */
#line 265 "src/parser.y"
                                 {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::GREATEREQUAL, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1717 "src/parser.cpp"
    break;

  case 55: /* EqExp: RelExp  */
#line 271 "src/parser.y"
             { (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1723 "src/parser.cpp"
    break;

  case 56: /* EqExp: EqExp EQUAL RelExp  */
#line 272 "src/parser.y"
                         {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::EQUAL, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1732 "src/parser.cpp"
    break;

  case 57: /* EqExp: EqExp NOTEQUAL RelExp  */
#line 276 "src/parser.y"
                            {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::NOTEQUAL, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1741 "src/parser.cpp"
    break;

  case 58: /* LAndExp: EqExp  */
#line 282 "src/parser.y"
            {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1747 "src/parser.cpp"
    break;

  case 59: /* LAndExp: LAndExp AND EqExp  */
#line 283 "src/parser.y"
                        {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::AND, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1756 "src/parser.cpp"
    break;

  case 60: /* LOrExp: LAndExp  */
#line 289 "src/parser.y"
              {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1762 "src/parser.cpp"
    break;

  case 61: /* LOrExp: LOrExp OR LAndExp  */
#line 290 "src/parser.y"
                        {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::OR, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1771 "src/parser.cpp"
    break;

  case 62: /* ConstExp: AddExp  */
#line 296 "src/parser.y"
             {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1777 "src/parser.cpp"
    break;

  case 63: /* FuncRParams: Exp  */
#line 299 "src/parser.y"
          { (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1783 "src/parser.cpp"
    break;

  case 64: /* FuncRParams: FuncRParams COMMA Exp  */
#line 300 "src/parser.y"
                            {
        (yyval.exprtype) = (yyvsp[-2].exprtype);
        (yyval.exprtype)->setNext((yyvsp[0].exprtype));  // 参数从左到右建立 next
    }
#line 1792 "src/parser.cpp"
    break;

  case 65: /* Type: INT  */
#line 306 "src/parser.y"
          {
        // TODO -> declType = TypeSystem::intType;
        (yyval.type) = TypeSystem::intType;
    }
#line 1801 "src/parser.cpp"
    break;

  case 66: /* Type: VOID  */
#line 310 "src/parser.y"
           {
        (yyval.type) = TypeSystem::voidType;
    }
#line 1809 "src/parser.cpp"
    break;

  case 67: /* DeclStmt: VarDeclStmt  */
#line 315 "src/parser.y"
                  { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1815 "src/parser.cpp"
    break;

  case 68: /* DeclStmt: ConstDeclStmt  */
#line 316 "src/parser.y"
                    { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1821 "src/parser.cpp"
    break;

  case 69: /* VarDeclStmt: Type VarDefList SEMICOLON  */
#line 319 "src/parser.y"
                                { (yyval.stmttype) = (yyvsp[-1].stmttype); }
#line 1827 "src/parser.cpp"
    break;

  case 70: /* ConstDeclStmt: CONST Type ConstDefList SEMICOLON  */
#line 322 "src/parser.y"
                                        { (yyval.stmttype) = (yyvsp[-1].stmttype); }
#line 1833 "src/parser.cpp"
    break;

  case 71: /* VarDefList: VarDefList COMMA VarDef  */
#line 325 "src/parser.y"
                              {
        (yyval.stmttype) = (yyvsp[-2].stmttype);
        (yyvsp[-2].stmttype)->setNext((yyvsp[0].stmttype));
    }
#line 1842 "src/parser.cpp"
    break;

  case 72: /* VarDefList: VarDef  */
#line 329 "src/parser.y"
             { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1848 "src/parser.cpp"
    break;

  case 73: /* ConstDefList: ConstDefList COMMA ConstDef  */
#line 332 "src/parser.y"
                                  {
        (yyval.stmttype) = (yyvsp[-2].stmttype);
        (yyvsp[-2].stmttype)->setNext((yyvsp[0].stmttype));
    }
#line 1857 "src/parser.cpp"
    break;

  case 74: /* ConstDefList: ConstDef  */
#line 336 "src/parser.y"
               {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 1863 "src/parser.cpp"
    break;

  case 75: /* VarDef: ID  */
#line 339 "src/parser.y"
         {  // eg: int a;
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(TypeSystem::intType, (yyvsp[0].strtype), identifiers->getLevel());
        identifiers->install((yyvsp[0].strtype), se);
        (yyval.stmttype) = new DeclStmt(new Id(se));
        delete [](yyvsp[0].strtype);
    }
#line 1875 "src/parser.cpp"
    break;

  case 76: /* VarDef: ID ASSIGN InitVal  */
#line 346 "src/parser.y"
                        {  // eg: int a = 1 + 2;
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(TypeSystem::intType, (yyvsp[-2].strtype), identifiers->getLevel());
        identifiers->install((yyvsp[-2].strtype), se);
        ((IdentifierSymbolEntry*)se)->setValue((yyvsp[0].exprtype)->getValue());
        (yyval.stmttype) = new DeclStmt(new Id(se), (yyvsp[0].exprtype));
        delete [](yyvsp[-2].strtype);
    }
#line 1888 "src/parser.cpp"
    break;

  case 77: /* VarDef: ID ArrayIndices  */
#line 354 "src/parser.y"
                      {  // eg: int a[10];
        SymbolEntry* se;
        std::vector<int> vec;//分别存放维度值
        ExprNode* temp = (yyvsp[0].exprtype);
        //编译每个维度数组 从高位到低维
        while(temp){
            vec.push_back(temp->getValue());
            temp = (ExprNode*)(temp->getNext());
        }
        Type *type = TypeSystem::intType;
        Type* temp1;
        //注意是倒序 即从右向左 [2][3] 2个数组指针 每行3个整型元素
        //初始为整型元素
        while(!vec.empty()){
        //嵌套数组类型
            temp1 = new ArrayType(type, vec.back());
            //考虑多维数组 每个元素是数组指针
            //如果元素是数组 type设置为数组维度
            if(type->isArray())
                ((ArrayType*)type)->setArrayType(temp1);
            type = temp1;
            vec.pop_back();
        }
        //type保存最低维 a[2][4]即保存2对应类型
        arrayType = (ArrayType*)type;
        se = new IdentifierSymbolEntry(type, (yyvsp[-1].strtype), identifiers->getLevel());
        
        ((IdentifierSymbolEntry*)se)->setAllZero();//zero是干什么的？
        int *p = new int[type->getSize()];//设置整型空间 即长度*大小
        ((IdentifierSymbolEntry*)se)->setArrayValue(p);
        identifiers->install((yyvsp[-1].strtype), se);
        (yyval.stmttype) = new DeclStmt(new Id(se));
        delete [](yyvsp[-1].strtype);
    }
#line 1927 "src/parser.cpp"
    break;

  case 78: /* ConstDef: ID ASSIGN ConstInitVal  */
#line 390 "src/parser.y"
                             {
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(TypeSystem::constIntType, (yyvsp[-2].strtype), identifiers->getLevel());
        ((IdentifierSymbolEntry*)se)->setConst();
         identifiers->install((yyvsp[-2].strtype), se);
     
        
        ((IdentifierSymbolEntry*)se)->setValue((yyvsp[0].exprtype)->getValue());
        (yyval.stmttype) = new DeclStmt(new Id(se), (yyvsp[0].exprtype));
        delete [](yyvsp[-2].strtype);
    }
#line 1943 "src/parser.cpp"
    break;

  case 79: /* ArrayIndices: LBRACKET ConstExp RBRACKET  */
#line 404 "src/parser.y"
                                 {
        (yyval.exprtype) = (yyvsp[-1].exprtype);
    }
#line 1951 "src/parser.cpp"
    break;

  case 80: /* ArrayIndices: ArrayIndices LBRACKET ConstExp RBRACKET  */
#line 407 "src/parser.y"
                                              {
        (yyval.exprtype) = (yyvsp[-3].exprtype);
        (yyvsp[-3].exprtype)->setNext((yyvsp[-1].exprtype));  // 多维要把元素大小先后存储
    }
#line 1960 "src/parser.cpp"
    break;

  case 81: /* InitVal: Exp  */
#line 413 "src/parser.y"
          { (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1966 "src/parser.cpp"
    break;

  case 82: /* ConstInitVal: ConstExp  */
#line 416 "src/parser.y"
               { (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1972 "src/parser.cpp"
    break;

  case 83: /* $@3: %empty  */
#line 420 "src/parser.y"
            {
        identifiers = new SymbolTable(identifiers);  // 申请新的符号表，此时为该函数的符号表
        paramNo = 0;  // 标记参数的id
    }
#line 1981 "src/parser.cpp"
    break;

  case 84: /* @4: %empty  */
#line 424 "src/parser.y"
                                 {
        Type* funcType;
        std::vector<Type*> vec;
        std::vector<SymbolEntry*> vec1;
        // 将所有形参全部装入params
        DeclStmt* temp = (DeclStmt*)(yyvsp[-1].stmttype);
        while(temp){
            vec.push_back(temp->getId()->getSymbolEntry()->getType());
            vec1.push_back(temp->getId()->getSymbolEntry());
            temp = (DeclStmt*)(temp->getNext());
        }
        //输入参数类型和符号表项
        funcType = new FunctionType((yyvsp[-5].type), vec, vec1);
        SymbolEntry* se = new IdentifierSymbolEntry(funcType, (yyvsp[-4].strtype), identifiers->getPrev()->getLevel());
        identifiers->getPrev()->install((yyvsp[-4].strtype), se);  // 将函数ID和函数类型装入符号表，这个是该函数上一级的符号表
            
        (yyval.se) = se;  // 下面使用
    }
#line 2004 "src/parser.cpp"
    break;

  case 85: /* FuncDef: Type ID $@3 LPAREN OptFuncFParams RPAREN @4 BlockStmt  */
#line 442 "src/parser.y"
              {
        (yyval.stmttype) = new FunctionDef((yyvsp[-1].se), (DeclStmt*)(yyvsp[-3].stmttype), (yyvsp[0].stmttype));
        SymbolTable* top = identifiers;
        identifiers = identifiers->getPrev();  // 回到上一级符号表
        delete top;
        delete [](yyvsp[-6].strtype);
    }
#line 2016 "src/parser.cpp"
    break;

  case 86: /* OptFuncFParams: FuncFParams  */
#line 451 "src/parser.y"
                  { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 2022 "src/parser.cpp"
    break;

  case 87: /* OptFuncFParams: %empty  */
#line 452 "src/parser.y"
             { (yyval.stmttype) = nullptr; }
#line 2028 "src/parser.cpp"
    break;

  case 88: /* FuncFParams: FuncFParams COMMA FuncFParam  */
#line 455 "src/parser.y"
                                   {
        (yyval.stmttype) = (yyvsp[-2].stmttype);
        (yyval.stmttype)->setNext((yyvsp[0].stmttype));  // 使用setnext将所有参数连起来, 以便之后使用
    }
#line 2037 "src/parser.cpp"
    break;

  case 89: /* FuncFParams: FuncFParam  */
#line 459 "src/parser.y"
                 {
        (yyval.stmttype) = (yyvsp[0].stmttype);
    }
#line 2045 "src/parser.cpp"
    break;

  case 90: /* FuncFParam: Type ID  */
#line 464 "src/parser.y"
              {
        SymbolEntry* se = new IdentifierSymbolEntry((yyvsp[-1].type), (yyvsp[0].strtype), identifiers->getLevel(), paramNo++);
        identifiers->install((yyvsp[0].strtype), se);  // 形参存入当前函数的符号表

        ((IdentifierSymbolEntry*)se)->setLabel();
        ((IdentifierSymbolEntry*)se)->setAddr(new Operand(se));
        
        (yyval.stmttype) = new DeclStmt(new Id(se));
    }
#line 2059 "src/parser.cpp"
    break;

  case 91: /* FuncFParam: Type ID FuncArrayIndices  */
#line 473 "src/parser.y"
                               {
        SymbolEntry* se;
        ExprNode* temp = (yyvsp[0].exprtype);
        Type* arr = TypeSystem::intType;
        Type* arr1;
        std::stack<ExprNode*> stk;
        //对数组维度进行遍历 放入栈中
        while(temp){
            stk.push(temp);
            temp = (ExprNode*)(temp->getNext());
        }
        //获得最低维度
        while(!stk.empty()){
            arr1 = new ArrayType(arr, stk.top()->getValue());
            if(arr->isArray())
                ((ArrayType*)arr)->setArrayType(arr1);
            arr = arr1;
            stk.pop();
        }
        se = new IdentifierSymbolEntry(arr, (yyvsp[-1].strtype), identifiers->getLevel(), paramNo++);
        identifiers->install((yyvsp[-1].strtype), se);
        ((IdentifierSymbolEntry*)se)->setLabel();
        ((IdentifierSymbolEntry*)se)->setAddr(new Operand(se));
        (yyval.stmttype) = new DeclStmt(new Id(se));
        delete [](yyvsp[-1].strtype);
    }
#line 2090 "src/parser.cpp"
    break;

  case 92: /* FuncArrayIndices: LBRACKET RBRACKET  */
#line 501 "src/parser.y"
                        {
        (yyval.exprtype) = new ExprNode(nullptr);
    }
#line 2098 "src/parser.cpp"
    break;

  case 93: /* FuncArrayIndices: FuncArrayIndices LBRACKET Exp RBRACKET  */
#line 504 "src/parser.y"
                                             {
        (yyval.exprtype) = (yyvsp[-3].exprtype);
        (yyval.exprtype)->setNext((yyvsp[-1].exprtype));
    }
#line 2107 "src/parser.cpp"
    break;


#line 2111 "src/parser.cpp"

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

#line 510 "src/parser.y"


int yyerror(char const* message)
{
    std::cerr<<message<<std::endl;
    return -1;
}
