
// ������ֺ��ַ���ת�� 


//Ϊ��֤ƽ̨�����ԣ��Լ�������һ��gbk����/����/big5/unicode������ļ�
//ͨ�����ļ������ɽ��и��ָ�ʽ��ת�� 
#define USING_STATIC_LIBICONV 1

#include <stdlib.h>
#include <string.h>
#include "jymain.h"
#include "iconv.h"

#ifdef WIN32
#include <Windows.h>
#endif

// ��ʾTTF �ַ���
// Ϊ������ʾ�����򽫱����Ѿ��򿪵���Ӧ�ֺŵ�����ṹ�����������Լӿ�����ٶ�
// Ϊ�򻯴��룬û�����������ǲ�������������򿪵����塣
// ���Ƚ��ȳ��ķ�����ѭ���ر��Ѿ��򿪵����塣
// ���ǵ�һ��򿪵����岻�࣬����640*480ģʽʵ����ֻ����16*24*32�������塣
// ��������Ϊ10�Ѿ��㹻��

static UseFont Font[FONTNUM];         //�����Ѵ򿪵�����

static int currentFont=0;

extern  SDL_Surface* g_Surface;    //��Ļ����

//��ʼ��
int InitFont()
{
    int i;

	TTF_Init();  // ��ʼ��sdl_ttf

    for(i=0;i<FONTNUM;i++){   //�������ݳ�ֵ
        Font[i].size =0;
	    Font[i].name=NULL;
		Font[i].font =NULL;
    }
 
	return 0;
}

//�ͷ�����ṹ
int ExitFont()
{
    int i;

    for(i=0;i<FONTNUM;i++){  //�ͷ���������
		if(Font[i].font){
			TTF_CloseFont(Font[i].font);
		}
        SafeFree(Font[i].name);
	}

    TTF_Quit();

	return 0;
}


// ���������ļ������ֺŴ�����
// size Ϊ�����ش�С���ֺ�
static TTF_Font *GetFont(const char *filename,int size)
{
    int i;
	TTF_Font *myfont=NULL;
	
	for(i=0;i<FONTNUM;i++){   //  �ж������Ƿ��Ѵ�
		if((Font[i].size ==size) && (Font[i].name) && (strcmp(filename,Font[i].name)==0) ){   
			myfont=Font[i].font ;
			break;
		}
    }

	if(myfont==NULL){    //û�д�
		myfont =TTF_OpenFont(filename,size);           //��������
		if(myfont==NULL){
			JY_Error("GetFont error: can not open font file %s\n",filename);
			return NULL;
		}
		Font[currentFont].size =size;
		if(Font[currentFont].font)           //ֱ�ӹرյ�ǰ���塣
            TTF_CloseFont(Font[currentFont].font);

        Font[currentFont].font=myfont; 

        SafeFree(Font[currentFont].name);
        Font[currentFont].name =(char*)malloc(strlen(filename)+1);
		strcpy(Font[currentFont].name,filename);
        
        currentFont++;           // ���Ӷ�����ڼ���
		if(currentFont==FONTNUM)                  
			currentFont=0;
	}
	
	return myfont;

}

// �����ַ���ת��
// flag = 0   Big5 --> GBK     
//      = 1   GBK  --> Big5    
//      = 2   Big5 --> Unicode
//      = 3   GBK  --> Unicode
// ע��Ҫ��֤dest���㹻�Ŀռ䣬һ�㽨��ȡsrc���ȵ�����+1����֤ȫӢ���ַ�Ҳ��ת��Ϊunicode
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
		outLen = srcLen * 2 + 2;
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

int  JY_CharSetEx(const char *src, wchar_t *dest, int flag, int bufferSize)
{
	int ret, srcLen, outLen;
	iconv_t converter;

	if (!src || !dest) {
		return 0;
	}

	ret = 0;
	srcLen = strlen(src);
	outLen = bufferSize;
	
	if (flag == 2) {
		converter = iconv_open("UTF-16//IGNORE", "Big5");
	} else if (flag == 3) {
		converter = iconv_open("UTF-16//IGNORE", "CP936");
	} else {
		return 0;
	}

	ret = iconv(converter, (const char**)&src, (size_t *)&srcLen, (char**)&dest, (size_t *)&outLen);
	iconv_close(converter);

    return ret;
}


// д�ַ���
// x,y ����
// str �ַ���
// color ��ɫ
// size �����С������Ϊ���塣 
// fontname ������
// charset �ַ��� 0 GBK 1 big5
// OScharset ����
int JY_DrawStr(int x, int y, const char *str,int color,int size,const char *fontname, 
			   int charset, int OScharset)
{
    SDL_Color c;   
	SDL_Surface *fontSurface=NULL;
	SDL_Rect rect;
	wchar_t *tmp;
	int len;

    TTF_Font *myfont=GetFont(fontname,size);
	if(myfont==NULL)
		return 1;

    c.r=(color & 0xff0000) >>16;
	c.g=(color & 0xff00)>>8;
	c.b=(color & 0xff);
    
    if (g_charset == kCharsesGB2312) {
        len = (strlen(str) + 2) * sizeof(wchar_t);
        
        tmp=(wchar_t*)malloc(len);  //��������ԭ�ַ�����С���ڴ棬����ת����unicodeʱ���
        memset(tmp, 0, len);
        
        if(charset==0){     //GBK
            JY_CharSetEx(str, tmp, 3, len);
        } else if(charset==1){ //big5
            JY_CharSetEx(str, tmp, 2, len);
        } else{
            strcpy((char*)tmp,str);
        }
        
        fontSurface=TTF_RenderUNICODE_Solid(myfont, tmp, c);  //���ɱ���
        
        SafeFree(tmp);
    } else if (g_charset == kCharsetUtf8) {
        fontSurface=TTF_RenderUTF8_Solid(myfont, str, c);  //���ɱ���
    }
 
	
	if(fontSurface==NULL)
		return 1;

    rect.x=x;
	rect.y=y;

    SDL_BlitSurface(fontSurface, NULL, g_Surface, &rect);    //����д����Ϸ���� 
    SDL_FreeSurface(fontSurface);   //�ͷű���
    return 0;
}
