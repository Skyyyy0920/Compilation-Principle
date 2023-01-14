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
    extern Ast ast;
    
    Type* declType;
    ArrayType* arrayType;   // 数组的类型
    InitValueListExpr* top;
    SymbolEntry* curFunc;
    int* arrayValue;     // int类型数组值存储

    // 数组初值以及参数数目
    int leftCount = 0;
    int paramNum = 0;
    int ArrayIndex;      // modified
    int notZeroNum = 0;

    std::stack<InitValueListExpr*> ArrayStk;  // 数组初始化栈
    std::stack<StmtNode*> whileStk;
    
    int yylex();
    int yyerror(char const*);

#line 96 "src/parser.cpp"




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
  YYSYMBOL_FLOATNUM = 6,                   /* FLOATNUM  */
  YYSYMBOL_CONST = 7,                      /* CONST  */
  YYSYMBOL_INT = 8,                        /* INT  */
  YYSYMBOL_VOID = 9,                       /* VOID  */
  YYSYMBOL_FLOAT = 10,                     /* FLOAT  */
  YYSYMBOL_IF = 11,                        /* IF  */
  YYSYMBOL_ELSE = 12,                      /* ELSE  */
  YYSYMBOL_WHILE = 13,                     /* WHILE  */
  YYSYMBOL_LPAREN = 14,                    /* LPAREN  */
  YYSYMBOL_RPAREN = 15,                    /* RPAREN  */
  YYSYMBOL_LBRACE = 16,                    /* LBRACE  */
  YYSYMBOL_RBRACE = 17,                    /* RBRACE  */
  YYSYMBOL_SEMICOLON = 18,                 /* SEMICOLON  */
  YYSYMBOL_LBRACKET = 19,                  /* LBRACKET  */
  YYSYMBOL_RBRACKET = 20,                  /* RBRACKET  */
  YYSYMBOL_COMMA = 21,                     /* COMMA  */
  YYSYMBOL_ADD = 22,                       /* ADD  */
  YYSYMBOL_SUB = 23,                       /* SUB  */
  YYSYMBOL_MUL = 24,                       /* MUL  */
  YYSYMBOL_DIV = 25,                       /* DIV  */
  YYSYMBOL_MOD = 26,                       /* MOD  */
  YYSYMBOL_OR = 27,                        /* OR  */
  YYSYMBOL_AND = 28,                       /* AND  */
  YYSYMBOL_LESS = 29,                      /* LESS  */
  YYSYMBOL_LESSEQUAL = 30,                 /* LESSEQUAL  */
  YYSYMBOL_GREATER = 31,                   /* GREATER  */
  YYSYMBOL_GREATEREQUAL = 32,              /* GREATEREQUAL  */
  YYSYMBOL_ASSIGN = 33,                    /* ASSIGN  */
  YYSYMBOL_EQUAL = 34,                     /* EQUAL  */
  YYSYMBOL_NOTEQUAL = 35,                  /* NOTEQUAL  */
  YYSYMBOL_NOT = 36,                       /* NOT  */
  YYSYMBOL_RETURN = 37,                    /* RETURN  */
  YYSYMBOL_CONTINUE = 38,                  /* CONTINUE  */
  YYSYMBOL_BREAK = 39,                     /* BREAK  */
  YYSYMBOL_THEN = 40,                      /* THEN  */
  YYSYMBOL_YYACCEPT = 41,                  /* $accept  */
  YYSYMBOL_Program = 42,                   /* Program  */
  YYSYMBOL_Stmts = 43,                     /* Stmts  */
  YYSYMBOL_Stmt = 44,                      /* Stmt  */
  YYSYMBOL_LVal = 45,                      /* LVal  */
  YYSYMBOL_ExprStmt = 46,                  /* ExprStmt  */
  YYSYMBOL_AssignStmt = 47,                /* AssignStmt  */
  YYSYMBOL_BlankStmt = 48,                 /* BlankStmt  */
  YYSYMBOL_BlockStmt = 49,                 /* BlockStmt  */
  YYSYMBOL_50_1 = 50,                      /* $@1  */
  YYSYMBOL_IfStmt = 51,                    /* IfStmt  */
  YYSYMBOL_WhileStmt = 52,                 /* WhileStmt  */
  YYSYMBOL_53_2 = 53,                      /* $@2  */
  YYSYMBOL_BreakStmt = 54,                 /* BreakStmt  */
  YYSYMBOL_ContinueStmt = 55,              /* ContinueStmt  */
  YYSYMBOL_ReturnStmt = 56,                /* ReturnStmt  */
  YYSYMBOL_Exp = 57,                       /* Exp  */
  YYSYMBOL_Cond = 58,                      /* Cond  */
  YYSYMBOL_PrimaryExp = 59,                /* PrimaryExp  */
  YYSYMBOL_UnaryExp = 60,                  /* UnaryExp  */
  YYSYMBOL_MulExp = 61,                    /* MulExp  */
  YYSYMBOL_AddExp = 62,                    /* AddExp  */
  YYSYMBOL_RelExp = 63,                    /* RelExp  */
  YYSYMBOL_EqExp = 64,                     /* EqExp  */
  YYSYMBOL_LAndExp = 65,                   /* LAndExp  */
  YYSYMBOL_LOrExp = 66,                    /* LOrExp  */
  YYSYMBOL_ConstExp = 67,                  /* ConstExp  */
  YYSYMBOL_FuncRParams = 68,               /* FuncRParams  */
  YYSYMBOL_Type = 69,                      /* Type  */
  YYSYMBOL_DeclStmt = 70,                  /* DeclStmt  */
  YYSYMBOL_VarDeclStmt = 71,               /* VarDeclStmt  */
  YYSYMBOL_ConstDeclStmt = 72,             /* ConstDeclStmt  */
  YYSYMBOL_VarDefList = 73,                /* VarDefList  */
  YYSYMBOL_ConstDefList = 74,              /* ConstDefList  */
  YYSYMBOL_VarDef = 75,                    /* VarDef  */
  YYSYMBOL_ConstDef = 76,                  /* ConstDef  */
  YYSYMBOL_ArrayIndices = 77,              /* ArrayIndices  */
  YYSYMBOL_InitVal = 78,                   /* InitVal  */
  YYSYMBOL_ConstInitVal = 79,              /* ConstInitVal  */
  YYSYMBOL_FuncDef = 80,                   /* FuncDef  */
  YYSYMBOL_81_3 = 81,                      /* $@3  */
  YYSYMBOL_82_4 = 82,                      /* @4  */
  YYSYMBOL_OptFuncFParams = 83,            /* OptFuncFParams  */
  YYSYMBOL_FuncFParams = 84,               /* FuncFParams  */
  YYSYMBOL_FuncFParam = 85,                /* FuncFParam  */
  YYSYMBOL_FuncArrayIndices = 86           /* FuncArrayIndices  */
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
#define YYFINAL  59
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   199

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  41
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  46
/* YYNRULES -- Number of rules.  */
#define YYNRULES  96
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  161

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   295


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
      35,    36,    37,    38,    39,    40
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    67,    67,    72,    73,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    91,    99,   111,   116,
     121,   126,   126,   135,   142,   145,   150,   150,   162,   167,
     173,   180,   190,   194,   197,   200,   203,   207,   211,   216,
     229,   230,   231,   236,   244,   245,   249,   253,   259,   260,
     264,   270,   271,   275,   279,   283,   289,   290,   294,   300,
     301,   307,   308,   314,   317,   318,   324,   328,   332,   337,
     338,   341,   344,   347,   351,   354,   358,   361,   369,   395,
     438,   463,   493,   496,   502,   540,   544,   548,   544,   577,
     578,   581,   585,   590,   600,   638,   643
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
  "INTEGER", "FLOATNUM", "CONST", "INT", "VOID", "FLOAT", "IF", "ELSE",
  "WHILE", "LPAREN", "RPAREN", "LBRACE", "RBRACE", "SEMICOLON", "LBRACKET",
  "RBRACKET", "COMMA", "ADD", "SUB", "MUL", "DIV", "MOD", "OR", "AND",
  "LESS", "LESSEQUAL", "GREATER", "GREATEREQUAL", "ASSIGN", "EQUAL",
  "NOTEQUAL", "NOT", "RETURN", "CONTINUE", "BREAK", "THEN", "$accept",
  "Program", "Stmts", "Stmt", "LVal", "ExprStmt", "AssignStmt",
  "BlankStmt", "BlockStmt", "$@1", "IfStmt", "WhileStmt", "$@2",
  "BreakStmt", "ContinueStmt", "ReturnStmt", "Exp", "Cond", "PrimaryExp",
  "UnaryExp", "MulExp", "AddExp", "RelExp", "EqExp", "LAndExp", "LOrExp",
  "ConstExp", "FuncRParams", "Type", "DeclStmt", "VarDeclStmt",
  "ConstDeclStmt", "VarDefList", "ConstDefList", "VarDef", "ConstDef",
  "ArrayIndices", "InitVal", "ConstInitVal", "FuncDef", "$@3", "@4",
  "OptFuncFParams", "FuncFParams", "FuncFParam", "FuncArrayIndices", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-65)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-87)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     160,    35,   -65,   -65,    30,   -65,   -65,   -65,     4,     6,
      77,    13,   -65,    77,    77,    77,    11,    -5,    28,    48,
     160,   -65,    17,   -65,   -65,   -65,   -65,   -65,   -65,   -65,
     -65,   -65,    38,   -65,   -65,    69,    45,    55,   -65,   -65,
     -65,   -65,    21,    77,    82,    76,    77,    77,   -65,    81,
     -65,   160,   -65,   -65,   -65,   -65,    84,   -65,   -65,   -65,
     -65,    77,   -65,    77,    77,    77,    77,    77,     9,    34,
     -65,   -65,   -65,     0,    45,    83,    77,    71,    60,   -65,
      90,    45,    33,    50,    78,    80,    93,   -65,   123,   -65,
      91,   -65,   -65,   -65,    69,    69,    77,   -14,    97,   -65,
     111,   -65,    77,   -65,    95,    77,   -65,    76,   160,    77,
      77,    77,    77,    77,    77,    77,    77,   -65,   -65,   -65,
     -65,   -65,    77,    30,    12,   -65,   -65,   -65,   -65,   -65,
     -65,   104,    45,    45,    45,    45,    33,    33,    50,    78,
     160,   -65,   114,   103,    98,   -65,   160,   -65,   101,   -65,
      30,   -65,   105,   116,   107,   -65,   -65,    77,   -65,   118,
     -65
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       0,    16,    36,    37,     0,    66,    68,    67,     0,     0,
       0,    21,    20,     0,     0,     0,     0,     0,     0,     0,
       2,     3,    35,     6,     5,    15,     7,     8,    11,     9,
      10,    12,     0,    40,    44,    48,    32,     0,    13,    69,
      70,    14,     0,     0,    17,     0,     0,     0,    35,     0,
      23,     0,    41,    42,    43,    30,     0,    29,    28,     1,
       4,     0,    18,     0,     0,     0,     0,     0,    77,     0,
      74,    38,    64,     0,    63,     0,     0,     0,     0,    76,
       0,    51,    56,    59,    61,    33,     0,    34,     0,    31,
       0,    45,    46,    47,    49,    50,     0,    79,     0,    71,
       0,    39,     0,    82,     0,     0,    72,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,    22,    19,
      84,    78,     0,    90,    77,    73,    65,    83,    85,    81,
      75,    24,    52,    53,    54,    55,    57,    58,    60,    62,
       0,    80,     0,     0,    89,    92,     0,    27,    93,    87,
       0,    25,     0,    94,     0,    91,    95,     0,    88,     0,
      96
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
     -65,   -65,    73,   -19,     2,   -65,   -65,   -65,   -11,   -65,
     -65,   -65,   -65,   -65,   -65,   -65,   -10,   106,   -65,    -4,
      31,   -39,   -26,    29,    36,   -65,   -64,   -65,    -1,   -65,
     -65,   -65,   -65,   -65,    51,    43,   153,    42,   -65,   -65,
     -65,   -65,   -65,   -65,     5,   -65
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_uint8 yydefgoto[] =
{
       0,    19,    20,    21,    48,    23,    24,    25,    26,    51,
      27,    28,   140,    29,    30,    31,    32,    80,    33,    34,
      35,    36,    82,    83,    84,    85,    75,    73,    37,    38,
      39,    40,    69,    78,    70,    79,    97,   121,   129,    41,
      98,   154,   143,   144,   145,   153
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      49,    60,    22,    45,    74,    76,    56,    81,    81,    52,
      53,    54,   104,    57,     1,   101,     2,     3,    46,   122,
      47,   102,    22,   -86,     1,    10,     2,     3,    43,    55,
      50,    43,    72,    13,    14,    10,    71,    74,     5,     6,
       7,   128,    96,    13,    14,    96,    58,    15,    59,    42,
      61,    90,    99,    22,    43,   100,    62,    15,    68,    91,
      92,    93,   109,   110,   111,   112,    74,    66,    67,    60,
     132,   133,   134,   135,    81,    81,    81,    81,   106,    77,
       1,   107,     2,     3,   113,   114,   120,   136,   137,   131,
      22,    10,   126,    63,    64,    65,    87,    94,    95,    13,
      14,    76,    89,   103,   105,   108,   115,   116,   117,   119,
      22,   123,   120,    15,   124,   127,   146,   148,   149,   150,
     152,   147,   142,    11,    88,   156,     1,   151,     2,     3,
       4,     5,     6,     7,     8,   157,     9,    10,   160,    11,
     118,    12,    22,   158,   138,    13,    14,   159,    22,   142,
     130,   125,   139,    86,    44,   155,     0,     0,     0,    15,
      16,    17,    18,     1,   141,     2,     3,     4,     5,     6,
       7,     8,     0,     9,    10,     0,    11,     0,    12,     0,
       0,     0,    13,    14,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    15,    16,    17,    18
};

static const yytype_int16 yycheck[] =
{
      10,    20,     0,     4,    43,    19,    16,    46,    47,    13,
      14,    15,    76,    18,     3,    15,     5,     6,    14,    33,
      14,    21,    20,    14,     3,    14,     5,     6,    19,    18,
      17,    19,    42,    22,    23,    14,    15,    76,     8,     9,
      10,   105,    33,    22,    23,    33,    18,    36,     0,    14,
      33,    61,    18,    51,    19,    21,    18,    36,     3,    63,
      64,    65,    29,    30,    31,    32,   105,    22,    23,    88,
     109,   110,   111,   112,   113,   114,   115,   116,    18,     3,
       3,    21,     5,     6,    34,    35,    96,   113,   114,   108,
      88,    14,   102,    24,    25,    26,    15,    66,    67,    22,
      23,    19,    18,    20,    33,    15,    28,    27,    15,    18,
     108,    14,   122,    36,     3,    20,    12,     3,    15,    21,
      19,   140,   123,    16,    51,    20,     3,   146,     5,     6,
       7,     8,     9,    10,    11,    19,    13,    14,    20,    16,
      17,    18,   140,   154,   115,    22,    23,   157,   146,   150,
     107,   100,   116,    47,     1,   150,    -1,    -1,    -1,    36,
      37,    38,    39,     3,   122,     5,     6,     7,     8,     9,
      10,    11,    -1,    13,    14,    -1,    16,    -1,    18,    -1,
      -1,    -1,    22,    23,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    36,    37,    38,    39
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     3,     5,     6,     7,     8,     9,    10,    11,    13,
      14,    16,    18,    22,    23,    36,    37,    38,    39,    42,
      43,    44,    45,    46,    47,    48,    49,    51,    52,    54,
      55,    56,    57,    59,    60,    61,    62,    69,    70,    71,
      72,    80,    14,    19,    77,    69,    14,    14,    45,    57,
      17,    50,    60,    60,    60,    18,    57,    18,    18,     0,
      44,    33,    18,    24,    25,    26,    22,    23,     3,    73,
      75,    15,    57,    68,    62,    67,    19,     3,    74,    76,
      58,    62,    63,    64,    65,    66,    58,    15,    43,    18,
      57,    60,    60,    60,    61,    61,    33,    77,    81,    18,
      21,    15,    21,    20,    67,    33,    18,    21,    15,    29,
      30,    31,    32,    34,    35,    28,    27,    15,    17,    18,
      57,    78,    33,    14,     3,    75,    57,    20,    67,    79,
      76,    44,    62,    62,    62,    62,    63,    63,    64,    65,
      53,    78,    69,    83,    84,    85,    12,    44,     3,    15,
      21,    44,    19,    86,    82,    85,    20,    19,    49,    57,
      20
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    41,    42,    43,    43,    44,    44,    44,    44,    44,
      44,    44,    44,    44,    44,    44,    45,    45,    46,    47,
      48,    50,    49,    49,    51,    51,    53,    52,    54,    55,
      56,    56,    57,    58,    59,    59,    59,    59,    59,    59,
      60,    60,    60,    60,    61,    61,    61,    61,    62,    62,
      62,    63,    63,    63,    63,    63,    64,    64,    64,    65,
      65,    66,    66,    67,    68,    68,    69,    69,    69,    70,
      70,    71,    72,    73,    73,    74,    74,    75,    75,    75,
      75,    76,    77,    77,    78,    79,    81,    82,    80,    83,
      83,    84,    84,    85,    85,    86,    86
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     2,     2,     4,
       1,     0,     4,     2,     5,     7,     0,     6,     2,     2,
       2,     3,     1,     1,     3,     1,     1,     1,     3,     4,
       1,     2,     2,     2,     1,     3,     3,     3,     1,     3,
       3,     1,     3,     3,     3,     3,     1,     3,     3,     1,
       3,     1,     3,     1,     1,     3,     1,     1,     1,     1,
       1,     3,     4,     3,     1,     3,     1,     1,     3,     2,
       4,     3,     3,     4,     1,     1,     0,     0,     8,     1,
       0,     3,     1,     2,     3,     2,     4
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
#line 67 "src/parser.y"
            {
        ast.setRoot((yyvsp[0].stmttype));
    }
#line 1297 "src/parser.cpp"
    break;

  case 3: /* Stmts: Stmt  */
#line 72 "src/parser.y"
           { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1303 "src/parser.cpp"
    break;

  case 4: /* Stmts: Stmts Stmt  */
#line 73 "src/parser.y"
                 {
        (yyval.stmttype) = new SeqNode((yyvsp[-1].stmttype), (yyvsp[0].stmttype));
    }
#line 1311 "src/parser.cpp"
    break;

  case 5: /* Stmt: AssignStmt  */
#line 78 "src/parser.y"
                 { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1317 "src/parser.cpp"
    break;

  case 6: /* Stmt: ExprStmt  */
#line 79 "src/parser.y"
               { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1323 "src/parser.cpp"
    break;

  case 7: /* Stmt: BlockStmt  */
#line 80 "src/parser.y"
                { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1329 "src/parser.cpp"
    break;

  case 8: /* Stmt: IfStmt  */
#line 81 "src/parser.y"
             { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1335 "src/parser.cpp"
    break;

  case 9: /* Stmt: BreakStmt  */
#line 82 "src/parser.y"
                { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1341 "src/parser.cpp"
    break;

  case 10: /* Stmt: ContinueStmt  */
#line 83 "src/parser.y"
                   { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1347 "src/parser.cpp"
    break;

  case 11: /* Stmt: WhileStmt  */
#line 84 "src/parser.y"
                { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1353 "src/parser.cpp"
    break;

  case 12: /* Stmt: ReturnStmt  */
#line 85 "src/parser.y"
                 { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1359 "src/parser.cpp"
    break;

  case 13: /* Stmt: DeclStmt  */
#line 86 "src/parser.y"
               { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1365 "src/parser.cpp"
    break;

  case 14: /* Stmt: FuncDef  */
#line 87 "src/parser.y"
              { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1371 "src/parser.cpp"
    break;

  case 15: /* Stmt: BlankStmt  */
#line 88 "src/parser.y"
                { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1377 "src/parser.cpp"
    break;

  case 16: /* LVal: ID  */
#line 91 "src/parser.y"
         {
        SymbolEntry* se;
        se = identifiers->lookup((yyvsp[0].strtype));
        if (se == nullptr)
            fprintf(stderr, "ID %s 未定义!\n", (char*)(yyvsp[0].strtype));
        (yyval.exprtype) = new Id(se);
        delete [](yyvsp[0].strtype);
    }
#line 1390 "src/parser.cpp"
    break;

  case 17: /* LVal: ID ArrayIndices  */
#line 100 "src/parser.y"
    {
        // modified恢复数组的定义
        SymbolEntry* se;
        // 保存数组名
        se = identifiers->lookup((yyvsp[-1].strtype));
        // 这里是用array来初始化一个ID
        (yyval.exprtype) = new Id(se, (yyvsp[0].exprtype));
        delete [](yyvsp[-1].strtype);
    }
#line 1404 "src/parser.cpp"
    break;

  case 18: /* ExprStmt: Exp SEMICOLON  */
#line 111 "src/parser.y"
                    {
        (yyval.stmttype) = new ExprStmt((yyvsp[-1].exprtype));
    }
#line 1412 "src/parser.cpp"
    break;

  case 19: /* AssignStmt: LVal ASSIGN Exp SEMICOLON  */
#line 116 "src/parser.y"
                                {
        (yyval.stmttype) = new AssignStmt((yyvsp[-3].exprtype), (yyvsp[-1].exprtype));
    }
#line 1420 "src/parser.cpp"
    break;

  case 20: /* BlankStmt: SEMICOLON  */
#line 121 "src/parser.y"
                {
        (yyval.stmttype) = new BlankStmt();
    }
#line 1428 "src/parser.cpp"
    break;

  case 21: /* $@1: %empty  */
#line 126 "src/parser.y"
             {
        identifiers = new SymbolTable(identifiers);  // 新作用域
    }
#line 1436 "src/parser.cpp"
    break;

  case 22: /* BlockStmt: LBRACE $@1 Stmts RBRACE  */
#line 129 "src/parser.y"
                 {
        (yyval.stmttype) = new CompoundStmt((yyvsp[-1].stmttype));
        SymbolTable* top = identifiers;
        identifiers = identifiers->getPrev();  // 块结束之后调整回上一级作用域
        delete top;
    }
#line 1447 "src/parser.cpp"
    break;

  case 23: /* BlockStmt: LBRACE RBRACE  */
#line 135 "src/parser.y"
                    {
        // TODO
        //$$->setHaveRetStmt(false);
        (yyval.stmttype) = new BlankStmt();
    }
#line 1457 "src/parser.cpp"
    break;

  case 24: /* IfStmt: IF LPAREN Cond RPAREN Stmt  */
#line 142 "src/parser.y"
                                            {
        (yyval.stmttype) = new IfStmt((yyvsp[-2].exprtype), (yyvsp[0].stmttype));
    }
#line 1465 "src/parser.cpp"
    break;

  case 25: /* IfStmt: IF LPAREN Cond RPAREN Stmt ELSE Stmt  */
#line 145 "src/parser.y"
                                           {
        (yyval.stmttype) = new IfElseStmt((yyvsp[-4].exprtype), (yyvsp[-2].stmttype), (yyvsp[0].stmttype));
    }
#line 1473 "src/parser.cpp"
    break;

  case 26: /* $@2: %empty  */
#line 150 "src/parser.y"
                               {
        StmtNode *whileNode = new WhileStmt((yyvsp[-1].exprtype));    
        whileStk.push(whileNode);
    }
#line 1482 "src/parser.cpp"
    break;

  case 27: /* WhileStmt: WHILE LPAREN Cond RPAREN $@2 Stmt  */
#line 154 "src/parser.y"
         {  
        StmtNode *whileNode = whileStk.top();
        ((WhileStmt*)whileNode)->setStmt((yyvsp[0].stmttype));  // 设置内部stmt语句
        (yyval.stmttype) = whileNode;
        whileStk.pop();
    }
#line 1493 "src/parser.cpp"
    break;

  case 28: /* BreakStmt: BREAK SEMICOLON  */
#line 162 "src/parser.y"
                      {
        (yyval.stmttype) = new BreakStmt(whileStk.top());
    }
#line 1501 "src/parser.cpp"
    break;

  case 29: /* ContinueStmt: CONTINUE SEMICOLON  */
#line 167 "src/parser.y"
                         {
        (yyval.stmttype) = new ContinueStmt(whileStk.top());
    }
#line 1509 "src/parser.cpp"
    break;

  case 30: /* ReturnStmt: RETURN SEMICOLON  */
#line 174 "src/parser.y"
    {
        ReturnStmt* ret = new ReturnStmt();
        // ret->typeCheck(curFunc);
        // ret->setHaveRetStmt(true);
        (yyval.stmttype) = ret;
    }
#line 1520 "src/parser.cpp"
    break;

  case 31: /* ReturnStmt: RETURN Exp SEMICOLON  */
#line 181 "src/parser.y"
    {
        ReturnStmt* ret = new ReturnStmt((yyvsp[-1].exprtype));
        // ret->typeCheck(curFunc);
        // ret->setHaveRetStmt(true);
        (yyval.stmttype) = ret;
    }
#line 1531 "src/parser.cpp"
    break;

  case 32: /* Exp: AddExp  */
#line 190 "src/parser.y"
           { (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1537 "src/parser.cpp"
    break;

  case 33: /* Cond: LOrExp  */
#line 194 "src/parser.y"
           { (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1543 "src/parser.cpp"
    break;

  case 34: /* PrimaryExp: LPAREN Exp RPAREN  */
#line 197 "src/parser.y"
                        {
        (yyval.exprtype) = (yyvsp[-1].exprtype);
    }
#line 1551 "src/parser.cpp"
    break;

  case 35: /* PrimaryExp: LVal  */
#line 200 "src/parser.y"
           {
        (yyval.exprtype) = (yyvsp[0].exprtype);
    }
#line 1559 "src/parser.cpp"
    break;

  case 36: /* PrimaryExp: INTEGER  */
#line 203 "src/parser.y"
              {
        SymbolEntry* se = new ConstantSymbolEntry(TypeSystem::intType, (yyvsp[0].itype));
        (yyval.exprtype) = new Constant(se);
    }
#line 1568 "src/parser.cpp"
    break;

  case 37: /* PrimaryExp: FLOATNUM  */
#line 207 "src/parser.y"
               {
        SymbolEntry *se = new ConstantSymbolEntry(TypeSystem::floatType, (yyvsp[0].ftype));
        (yyval.exprtype) = new Constant(se);
    }
#line 1577 "src/parser.cpp"
    break;

  case 38: /* PrimaryExp: ID LPAREN RPAREN  */
#line 211 "src/parser.y"
                       {
        SymbolEntry* se;
        se = identifiers->lookup((yyvsp[-2].strtype));
        (yyval.exprtype) = new CallExpr(se);
    }
#line 1587 "src/parser.cpp"
    break;

  case 39: /* PrimaryExp: ID LPAREN FuncRParams RPAREN  */
#line 216 "src/parser.y"
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
#line 1603 "src/parser.cpp"
    break;

  case 40: /* UnaryExp: PrimaryExp  */
#line 229 "src/parser.y"
                 { (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1609 "src/parser.cpp"
    break;

  case 41: /* UnaryExp: ADD UnaryExp  */
#line 230 "src/parser.y"
                   { (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1615 "src/parser.cpp"
    break;

  case 42: /* UnaryExp: SUB UnaryExp  */
#line 232 "src/parser.y"
    {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new UnaryExpr(se, UnaryExpr::SUB, (yyvsp[0].exprtype));
    }
#line 1624 "src/parser.cpp"
    break;

  case 43: /* UnaryExp: NOT UnaryExp  */
#line 237 "src/parser.y"
    {   
        // 注意NOT是Bool类型
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new UnaryExpr(se, UnaryExpr::NOT, (yyvsp[0].exprtype));
    }
#line 1634 "src/parser.cpp"
    break;

  case 44: /* MulExp: UnaryExp  */
#line 244 "src/parser.y"
               {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1640 "src/parser.cpp"
    break;

  case 45: /* MulExp: MulExp MUL UnaryExp  */
#line 245 "src/parser.y"
                          {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::MUL, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1649 "src/parser.cpp"
    break;

  case 46: /* MulExp: MulExp DIV UnaryExp  */
#line 249 "src/parser.y"
                          {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::DIV, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1658 "src/parser.cpp"
    break;

  case 47: /* MulExp: MulExp MOD UnaryExp  */
#line 253 "src/parser.y"
                          {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::MOD, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1667 "src/parser.cpp"
    break;

  case 48: /* AddExp: MulExp  */
#line 259 "src/parser.y"
             { (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1673 "src/parser.cpp"
    break;

  case 49: /* AddExp: AddExp ADD MulExp  */
#line 260 "src/parser.y"
                        {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::ADD, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1682 "src/parser.cpp"
    break;

  case 50: /* AddExp: AddExp SUB MulExp  */
#line 264 "src/parser.y"
                        {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::SUB, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1691 "src/parser.cpp"
    break;

  case 51: /* RelExp: AddExp  */
#line 270 "src/parser.y"
             { (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1697 "src/parser.cpp"
    break;

  case 52: /* RelExp: RelExp LESS AddExp  */
#line 271 "src/parser.y"
                         {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::LESS, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1706 "src/parser.cpp"
    break;

  case 53: /* RelExp: RelExp LESSEQUAL AddExp  */
#line 275 "src/parser.y"
                              {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::LESSEQUAL, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1715 "src/parser.cpp"
    break;

  case 54: /* RelExp: RelExp GREATER AddExp  */
#line 279 "src/parser.y"
                            {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::GREATER, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1724 "src/parser.cpp"
    break;

  case 55: /* RelExp: RelExp GREATEREQUAL AddExp  */
#line 283 "src/parser.y"
                                 {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::GREATEREQUAL, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1733 "src/parser.cpp"
    break;

  case 56: /* EqExp: RelExp  */
#line 289 "src/parser.y"
             { (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1739 "src/parser.cpp"
    break;

  case 57: /* EqExp: EqExp EQUAL RelExp  */
#line 290 "src/parser.y"
                         {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::EQUAL, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1748 "src/parser.cpp"
    break;

  case 58: /* EqExp: EqExp NOTEQUAL RelExp  */
#line 294 "src/parser.y"
                            {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::NOTEQUAL, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1757 "src/parser.cpp"
    break;

  case 59: /* LAndExp: EqExp  */
#line 300 "src/parser.y"
            {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1763 "src/parser.cpp"
    break;

  case 60: /* LAndExp: LAndExp AND EqExp  */
#line 301 "src/parser.y"
                        {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::AND, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1772 "src/parser.cpp"
    break;

  case 61: /* LOrExp: LAndExp  */
#line 307 "src/parser.y"
              {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1778 "src/parser.cpp"
    break;

  case 62: /* LOrExp: LOrExp OR LAndExp  */
#line 308 "src/parser.y"
                        {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::OR, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1787 "src/parser.cpp"
    break;

  case 63: /* ConstExp: AddExp  */
#line 314 "src/parser.y"
             {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1793 "src/parser.cpp"
    break;

  case 64: /* FuncRParams: Exp  */
#line 317 "src/parser.y"
          { (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1799 "src/parser.cpp"
    break;

  case 65: /* FuncRParams: FuncRParams COMMA Exp  */
#line 318 "src/parser.y"
                            {
        (yyval.exprtype) = (yyvsp[-2].exprtype);
        (yyval.exprtype)->setNext((yyvsp[0].exprtype));  // 参数从左到右建立 next
    }
#line 1808 "src/parser.cpp"
    break;

  case 66: /* Type: INT  */
#line 324 "src/parser.y"
          {
        (yyval.type) = TypeSystem::intType;
        declType = TypeSystem::intType;
    }
#line 1817 "src/parser.cpp"
    break;

  case 67: /* Type: FLOAT  */
#line 328 "src/parser.y"
            {
        (yyval.type) = TypeSystem::floatType;
        declType = TypeSystem::floatType;
    }
#line 1826 "src/parser.cpp"
    break;

  case 68: /* Type: VOID  */
#line 332 "src/parser.y"
           {
        (yyval.type) = TypeSystem::voidType;
    }
#line 1834 "src/parser.cpp"
    break;

  case 69: /* DeclStmt: VarDeclStmt  */
#line 337 "src/parser.y"
                  { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1840 "src/parser.cpp"
    break;

  case 70: /* DeclStmt: ConstDeclStmt  */
#line 338 "src/parser.y"
                    { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1846 "src/parser.cpp"
    break;

  case 71: /* VarDeclStmt: Type VarDefList SEMICOLON  */
#line 341 "src/parser.y"
                                { (yyval.stmttype) = (yyvsp[-1].stmttype); }
#line 1852 "src/parser.cpp"
    break;

  case 72: /* ConstDeclStmt: CONST Type ConstDefList SEMICOLON  */
#line 344 "src/parser.y"
                                        { (yyval.stmttype) = (yyvsp[-1].stmttype); }
#line 1858 "src/parser.cpp"
    break;

  case 73: /* VarDefList: VarDefList COMMA VarDef  */
#line 347 "src/parser.y"
                              {
        (yyval.stmttype) = (yyvsp[-2].stmttype);
        (yyvsp[-2].stmttype)->setNext((yyvsp[0].stmttype));
    }
#line 1867 "src/parser.cpp"
    break;

  case 74: /* VarDefList: VarDef  */
#line 351 "src/parser.y"
             { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1873 "src/parser.cpp"
    break;

  case 75: /* ConstDefList: ConstDefList COMMA ConstDef  */
#line 354 "src/parser.y"
                                  {
        (yyval.stmttype) = (yyvsp[-2].stmttype);
        (yyvsp[-2].stmttype)->setNext((yyvsp[0].stmttype));
    }
#line 1882 "src/parser.cpp"
    break;

  case 76: /* ConstDefList: ConstDef  */
#line 358 "src/parser.y"
               {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 1888 "src/parser.cpp"
    break;

  case 77: /* VarDef: ID  */
#line 361 "src/parser.y"
         {   
        // eg: int a;
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(TypeSystem::intType, (yyvsp[0].strtype), identifiers->getLevel());
        identifiers->install((yyvsp[0].strtype), se);
        (yyval.stmttype) = new DeclStmt(new Id(se));
        delete [](yyvsp[0].strtype);
    }
#line 1901 "src/parser.cpp"
    break;

  case 78: /* VarDef: ID ASSIGN InitVal  */
#line 369 "src/parser.y"
                        {   
        if(declType->isFloat()) {
            declType = TypeSystem::constFloatType;
        }
        if(declType->isInt()) {
            declType = TypeSystem::constIntType;
        }

        // 可以简写
        SymbolEntry* se = new IdentifierSymbolEntry(TypeSystem::intType, (yyvsp[-2].strtype), identifiers->getLevel());
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

        ((IdentifierSymbolEntry*)se)->setValue((yyvsp[0].exprtype)->getValue());
        (yyval.stmttype) = new DeclStmt(new Id(se), (yyvsp[0].exprtype));
        delete [](yyvsp[-2].strtype);
    }
#line 1932 "src/parser.cpp"
    break;

  case 79: /* VarDef: ID ArrayIndices  */
#line 395 "src/parser.y"
                      {   
        // eg: int a[10];
        std::vector<int> vec;  // 分别存放维度值，可能是很多维
        SymbolEntry* se;
        ExprNode* temp = (yyvsp[0].exprtype);   // array
        // 编译每个维度数组，从高维到低维，这里用next全部遍历
        while(temp) {
            vec.push_back(temp->getValue());
            temp = (ExprNode*)(temp->getNext());
        }

        // TODO
        Type* type = TypeSystem::intType;   // 目前仅有int类型
        Type* temp1;

        // 注意这里是倒序遍历，即从右向左，a[2][3]：2个数组指针 每行3个整型元素
        while(!vec.empty()) {
            // 数组一层一层的类型存储
            temp1 = new ArrayType(type, vec.back());
            // 考虑多维数组，每个元素是数组指针
            // 如果元素是数组，type设置为数组维度
            if(type->isArray()) {
                ((ArrayType*)type)->setArrayType(temp1);
            }

            type = temp1;
            vec.pop_back();
        }

        // type保存最低维，即a[2][4]即保存2对应类型
        arrayType = (ArrayType*)type;
        se = new IdentifierSymbolEntry(type, (yyvsp[-1].strtype), identifiers->getLevel());
        
        // 初始化为0
        ((IdentifierSymbolEntry*)se)->setAllZero(); 

        // 设置整型空间，即长度*大小
        int *p = new int[type->getSize()];    
        ((IdentifierSymbolEntry*)se)->setArrayValue(p);
        identifiers->install((yyvsp[-1].strtype), se);
        (yyval.stmttype) = new DeclStmt(new Id(se));
        delete [](yyvsp[-1].strtype);
    }
#line 1980 "src/parser.cpp"
    break;

  case 80: /* VarDef: ID ArrayIndices ASSIGN InitVal  */
#line 439 "src/parser.y"
    {
        SymbolEntry* se = nullptr;
        std::vector<int> vec;
        ExprNode* temp = (yyvsp[-2].exprtype);

        while (temp) {
            vec.push_back(temp->getValue());
            temp = (ExprNode*)(temp->getNext());
        }

        // 获取数组的各个维度??
        Type* type = TypeSystem::intType;
        Type* temp1 = new ArrayType(type, vec.back());

        (yyval.se) = se;

        ((ArrayType*)type)->setArrayType(temp1);
        // modified
        se = new IdentifierSymbolEntry(type, (yyvsp[-3].strtype), identifiers->getLevel());
        arrayValue = new int[arrayType->getSize()];
        notZeroNum = 0;
    }
#line 2007 "src/parser.cpp"
    break;

  case 81: /* ConstDef: ID ASSIGN ConstInitVal  */
#line 463 "src/parser.y"
                             {
        if(declType->isFloat()) {
            declType = TypeSystem::constFloatType;
        }
        if(declType->isInt()) {
            declType = TypeSystem::constIntType;
        }

        SymbolEntry* se;
        se = new IdentifierSymbolEntry(TypeSystem::constIntType, (yyvsp[-2].strtype), identifiers->getLevel());
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

        ((IdentifierSymbolEntry*)se)->setValue((yyvsp[0].exprtype)->getValue());
        (yyval.stmttype) = new DeclStmt(new Id(se), (yyvsp[0].exprtype));
        delete [](yyvsp[-2].strtype);
    }
#line 2039 "src/parser.cpp"
    break;

  case 82: /* ArrayIndices: LBRACKET ConstExp RBRACKET  */
#line 493 "src/parser.y"
                                 {
        (yyval.exprtype) = (yyvsp[-1].exprtype);
    }
#line 2047 "src/parser.cpp"
    break;

  case 83: /* ArrayIndices: ArrayIndices LBRACKET ConstExp RBRACKET  */
#line 496 "src/parser.y"
                                              {
        (yyval.exprtype) = (yyvsp[-3].exprtype);
        (yyvsp[-3].exprtype)->setNext((yyvsp[-1].exprtype)); 
    }
#line 2056 "src/parser.cpp"
    break;

  case 84: /* InitVal: Exp  */
#line 503 "src/parser.y"
    { 
        (yyval.exprtype) = (yyvsp[0].exprtype); 
        // 检验数组是否有各维的初始值
        if(!ArrayStk.empty()) {
            Type* arrayTp = ArrayStk.top()->getSymbolEntry()->getType();     // 获取每一维的Type
            arrayValue[ArrayIndex++] = (yyvsp[0].exprtype)->getValue();   // 获取每一维的初始值

            // 判断是不是最低一维的类型，高维的类型都是数组类型的了
            if(arrayTp == TypeSystem::intType) {
                ArrayStk.top()->addExpr((yyvsp[0].exprtype));
            }
            else {
                while(arrayTp) {
                    if(((ArrayType*)arrayTp)->getElementType() != TypeSystem::intType) {
                        // 获取类型
                        arrayTp = ((ArrayType*)arrayTp)->getElementType();
                        SymbolEntry* se = new ConstantSymbolEntry(arrayTp);
                        // 新的ast类型
                        InitValueListExpr* list = new InitValueListExpr(se);
                        ArrayStk.top()->addExpr(list);
                        ArrayStk.push(list);
                    }
                    else {
                        ArrayStk.top()->addExpr((yyvsp[0].exprtype));
                        // ???
                        while(ArrayStk.top()->isFull() && ArrayStk.size() != (long unsigned int)leftCount) {
                            arrayTp = ((ArrayType*)arrayTp)->getArrayType();
                            ArrayStk.pop();
                        }
                        break;
                    }
                }
            }
        }    
    }
#line 2096 "src/parser.cpp"
    break;

  case 85: /* ConstInitVal: ConstExp  */
#line 540 "src/parser.y"
               { (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 2102 "src/parser.cpp"
    break;

  case 86: /* $@3: %empty  */
#line 544 "src/parser.y"
            {
        identifiers = new SymbolTable(identifiers);  // 申请新的符号表，此时为该函数的符号表
        paramNum = 1 + 1 - 2;  // 标记参数的id
    }
#line 2111 "src/parser.cpp"
    break;

  case 87: /* @4: %empty  */
#line 548 "src/parser.y"
                                 {
        Type* funcType;
        std::vector<Type*> vec;
        std::vector<SymbolEntry*> vec1;

        // 将所有形参全部装入params
        DeclStmt* temp = (DeclStmt*)(yyvsp[-1].stmttype);
        while(temp) {
            vec.push_back(temp->getId()->getSymbolEntry()->getType());
            vec1.push_back(temp->getId()->getSymbolEntry());
            temp = (DeclStmt*)(temp->getNext());
        }

        // 输入参数类型和符号表项
        funcType = new FunctionType((yyvsp[-5].type), vec, vec1);
        SymbolEntry* se = new IdentifierSymbolEntry(funcType, (yyvsp[-4].strtype), identifiers->getPrev()->getLevel());
        identifiers->getPrev()->install((yyvsp[-4].strtype), se);    // 将函数ID和函数类型装入符号表，这个是该函数上一级的符号表
            
        (yyval.se) = se;  // 下面使用
    }
#line 2136 "src/parser.cpp"
    break;

  case 88: /* FuncDef: Type ID $@3 LPAREN OptFuncFParams RPAREN @4 BlockStmt  */
#line 568 "src/parser.y"
              {
        (yyval.stmttype) = new FunctionDef((yyvsp[-1].se), (DeclStmt*)(yyvsp[-3].stmttype), (yyvsp[0].stmttype));
        SymbolTable* top = identifiers;
        identifiers = identifiers->getPrev();  // 回到上一级符号表
        delete top;
        delete [](yyvsp[-6].strtype);
    }
#line 2148 "src/parser.cpp"
    break;

  case 89: /* OptFuncFParams: FuncFParams  */
#line 577 "src/parser.y"
                  { (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 2154 "src/parser.cpp"
    break;

  case 90: /* OptFuncFParams: %empty  */
#line 578 "src/parser.y"
             { (yyval.stmttype) = nullptr; }
#line 2160 "src/parser.cpp"
    break;

  case 91: /* FuncFParams: FuncFParams COMMA FuncFParam  */
#line 581 "src/parser.y"
                                   {
        (yyval.stmttype) = (yyvsp[-2].stmttype);
        (yyval.stmttype)->setNext((yyvsp[0].stmttype));  // 使用setnext将所有参数连起来, 以便之后使用
    }
#line 2169 "src/parser.cpp"
    break;

  case 92: /* FuncFParams: FuncFParam  */
#line 585 "src/parser.y"
                 {
        (yyval.stmttype) = (yyvsp[0].stmttype);
    }
#line 2177 "src/parser.cpp"
    break;

  case 93: /* FuncFParam: Type ID  */
#line 591 "src/parser.y"
    {
        SymbolEntry* se = new IdentifierSymbolEntry((yyvsp[-1].type), (yyvsp[0].strtype), identifiers->getLevel(), paramNum++);
        identifiers->install((yyvsp[0].strtype), se);  // 形参存入当前函数的符号表

        ((IdentifierSymbolEntry*)se)->setLabel();
        ((IdentifierSymbolEntry*)se)->setAddr(new Operand(se));
        
        (yyval.stmttype) = new DeclStmt(new Id(se));
    }
#line 2191 "src/parser.cpp"
    break;

  case 94: /* FuncFParam: Type ID FuncArrayIndices  */
#line 601 "src/parser.y"
    {
        // 函数的参数之中为数组，很麻烦
        // TODO
        // 一维数组直接用int
        Type* array = TypeSystem::intType;
        Type* array1;
        std::stack<ExprNode*> temp_stack;

        SymbolEntry* se;
        ExprNode* temp = (yyvsp[0].exprtype);

        // 对数组维度进行遍历，放入栈中
        while(temp){
            temp_stack.push(temp);
            temp = (ExprNode*)(temp->getNext());
        }

        // 获得最低维度
        while(!temp_stack.empty()) {
            array1 = new ArrayType(array, temp_stack.top()->getValue());
            if(array->isArray()) {
                ((ArrayType*)array)->setArrayType(array1);
            }
            array = array1;
            temp_stack.pop();
        }

        // 函数形参之中的符号表项
        se = new IdentifierSymbolEntry(array, (yyvsp[-1].strtype), identifiers->getLevel(), paramNum++);
        identifiers->install((yyvsp[-1].strtype), se);
        ((IdentifierSymbolEntry*)se)->setLabel();
        ((IdentifierSymbolEntry*)se)->setAddr(new Operand(se));
        (yyval.stmttype) = new DeclStmt(new Id(se));
        delete [](yyvsp[-1].strtype);
    }
#line 2231 "src/parser.cpp"
    break;

  case 95: /* FuncArrayIndices: LBRACKET RBRACKET  */
#line 639 "src/parser.y"
    {
        (yyval.exprtype) = new ExprNode(nullptr);
    }
#line 2239 "src/parser.cpp"
    break;

  case 96: /* FuncArrayIndices: FuncArrayIndices LBRACKET Exp RBRACKET  */
#line 644 "src/parser.y"
    {
        (yyval.exprtype) = (yyvsp[-3].exprtype);
        (yyval.exprtype)->setNext((yyvsp[-1].exprtype));
    }
#line 2248 "src/parser.cpp"
    break;


#line 2252 "src/parser.cpp"

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

#line 650 "src/parser.y"


int yyerror(char const* message)
{
    std::cerr<<message<<std::endl;
    return -1;
}
