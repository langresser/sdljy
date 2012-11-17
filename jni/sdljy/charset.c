
// 输出汉字和字符集转换 


//为保证平台兼容性，自己生成了一个gbk简体/繁体/big5/unicode的码表文件
//通过此文件，即可进行各种格式的转换 
#define USING_STATIC_LIBICONV 1

#include <stdlib.h>
#include <string.h>
#include "jymain.h"
#include "iconv.h"

#ifdef WIN32
#include <Windows.h>
#endif

// 显示TTF 字符串
// 为快速显示，程序将保存已经打开的相应字号的字体结构。这样做可以加快程序速度
// 为简化代码，没有用链表，而是采用数组来保存打开的字体。
// 用先进先出的方法，循环关闭已经打开的字体。
// 考虑到一般打开的字体不多，比如640*480模式实际上只用了16*24*32三种字体。
// 设置数组为10已经足够。

static UseFont Font[FONTNUM];         //保存已打开的字体

static int currentFont=0;

//字符集转换数组
static Uint16 gbkj_f[128][256];        //GBK简体-->繁体
static Uint16 gbkf_j[128][256] ;
static Uint16 gbk_unicode[128][256] ;
static Uint16 gbk_big5[128][256] ;
static Uint16 big5_gbk[128][256] ;

extern  SDL_Surface* g_Surface;    //屏幕表面

//初始化
int InitFont()
{
    int i;

	TTF_Init();  // 初始化sdl_ttf

    for(i=0;i<FONTNUM;i++){   //字体数据初值
        Font[i].size =0;
	    Font[i].name=NULL;
		Font[i].font =NULL;
    }
 
	return 0;
}

//释放字体结构
int ExitFont()
{
    int i;

    for(i=0;i<FONTNUM;i++){  //释放字体数据
		if(Font[i].font){
			TTF_CloseFont(Font[i].font);
		}
        SafeFree(Font[i].name);
	}

    TTF_Quit();

	return 0;
}


// 根据字体文件名和字号打开字体
// size 为按像素大小的字号
static TTF_Font *GetFont(const char *filename,int size)
{
    int i;
	TTF_Font *myfont=NULL;
	
	for(i=0;i<FONTNUM;i++){   //  判断字体是否已打开
		if((Font[i].size ==size) && (Font[i].name) && (strcmp(filename,Font[i].name)==0) ){   
			myfont=Font[i].font ;
			break;
		}
    }

	if(myfont==NULL){    //没有打开
		myfont =TTF_OpenFont(filename,size);           //打开新字体
		if(myfont==NULL){
			JY_Error("GetFont error: can not open font file %s\n",filename);
			return NULL;
		}
		Font[currentFont].size =size;
		if(Font[currentFont].font)           //直接关闭当前字体。
            TTF_CloseFont(Font[currentFont].font);

        Font[currentFont].font=myfont; 

        SafeFree(Font[currentFont].name);
        Font[currentFont].name =(char*)malloc(strlen(filename)+1);
		strcpy(Font[currentFont].name,filename);
        
        currentFont++;           // 增加队列入口计数
		if(currentFont==FONTNUM)                  
			currentFont=0;
	}
	
	return myfont;

}

// 汉字字符集转换
// flag = 0   Big5 --> GBK     
//      = 1   GBK  --> Big5    
//      = 2   Big5 --> Unicode
//      = 3   GBK  --> Unicode
// 注意要保证dest有足够的空间，一般建议取src长度的两倍+1，保证全英文字符也能转化为unicode
int  JY_CharSet(const char *src, char *dest, int flag)
{
	int ret, srcLen, outLen;
	iconv_t converter;

	if (!src || !dest) {
		return 0;
	}

	ret = 0;
	srcLen = strlen(src);
	
	if (flag == 0) {
		converter = iconv_open("gb18030//IGNORE", "Big5");
		outLen = srcLen + 1;
	} else if (flag == 1) {
		converter = iconv_open("Big5//IGNORE", "gb18030");
		outLen = srcLen + 1;
	} else if (flag == 2) {
		converter = iconv_open("UTF-16//IGNORE", "Big5");
		outLen = srcLen * 2 + 21;
	} else if (flag == 3) {
		converter = iconv_open("UTF-16//IGNORE", "gb18030");
		outLen = srcLen * 2 + 2;
	} else {
		return 0;
	}

	ret = iconv(converter, (const char**)&src, (size_t *)&srcLen, &dest, (size_t *)&outLen);

	iconv_close(converter);

    return ret;
}


// 写字符串
// x,y 坐标
// str 字符串
// color 颜色
// size 字体大小，字形为宋体。 
// fontname 字体名
// charset 字符集 0 GBK 1 big5
// OScharset 无用
int JY_DrawStr(int x, int y, const char *str,int color,int size,const char *fontname, 
			   int charset, int OScharset)
{
    SDL_Color c;   
	SDL_Surface *fontSurface=NULL;
	SDL_Rect rect;
	Uint8 *tmp;
	int len;
	int flag=0;

    TTF_Font *myfont=GetFont(fontname,size);
	if(myfont==NULL)
		return 1;

    c.r=(color & 0xff0000) >>16;
	c.g=(color & 0xff00)>>8;
	c.b=(color & 0xff);
 
	len = 2*strlen(str)+2;
    tmp=(unsigned char*)malloc(len);  //分配两倍原字符串大小的内存，避免转换到unicode时溢出
	memset(tmp, 0, len);

    if(charset==0){     //GBK
        JY_CharSet(str, (char*)tmp,	3);      
	} else if(charset==1){ //big5
        JY_CharSet(str,(char*)tmp,2);
	} else{
        strcpy((char*)tmp,str);
	}

//	fontSurface=TTF_RenderUTF8_Solid(myfont, tmp, c);  //生成表面
    fontSurface=TTF_RenderUNICODE_Solid(myfont, (Uint16*)tmp, c);  //生成表面

	SafeFree(tmp);

	if(fontSurface==NULL)
		return 1;

    rect.x=x;
	rect.y=y;

    SDL_BlitSurface(fontSurface, NULL, g_Surface, &rect);    //表面写道游戏表面 
    SDL_FreeSurface(fontSurface);   //释放表面
    return 0;
}
