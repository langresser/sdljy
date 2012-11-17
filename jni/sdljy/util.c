#include "util.h"

#ifdef PAL_HAS_NATIVEMIDI
#include "midi.h"
#endif

#ifndef WIN32
#include <sys/stat.h>
#include <unistd.h>
#else
#pragma comment(lib, "sdl.lib")
#pragma comment(lib, "SDL_image.lib")
#pragma comment(lib, "SDL_mixer.lib")
#pragma comment(lib, "SDL_ttf.lib")
#pragma comment(lib, "smpeg.lib")
#pragma comment(lib, "freetype2410_D.lib")
#pragma comment(lib, "libpng.lib")
#pragma comment(lib, "libogg_static.lib")
#pragma comment(lib, "libvorbis_static.lib")
#pragma comment(lib, "libvorbisfile_static.lib")
#pragma comment(lib, "zlib.lib")
#pragma comment(lib, "winmm.lib")
#pragma comment(lib, "imm32.lib")
#pragma comment(lib, "version.lib")
#pragma comment(lib, "iconv.lib")
#endif

char *
va(
   const char *format,
   ...
)
{
   static char string[256];
   va_list     argptr;

   va_start(argptr, format);
   vsnprintf(string, 256, format, argptr);
   va_end(argptr);

   return string;
}


char*   my_strlwr(   char*   str   )
{
    char*   orig   =   str;
    //   process   the   string
    for   (   ;   *str   != '\0';   str++   )
        *str   =   tolower(*str);
    return   orig;
}

#ifdef __IPHONEOS__
char g_application_dir[256] = {0};
char g_resource_dir[256] = "../Documents/";
#elif defined __ANDROID__
char g_application_dir[256] = {0};
char g_resource_dir[256] = "/sdcard/sdlpal/";
#else
char g_application_dir[256] = {0};
char g_resource_dir[256] = {0};
#endif

FILE* open_file(const char* file_name, const char* read_mode)
{
    char szFileName[256] = {0};
	char szTemp[256] = {0};
	FILE* fp = NULL;

	strncpy(szFileName, file_name, sizeof(szFileName) - 1);
    my_strlwr(szFileName);

	// 先查找资源目录，资源目录要求是可以读写的。如果有相同文件，优先读取资源目录下的。（更新文件）
	snprintf(szTemp, sizeof(szTemp) - 1, "%s%s", g_resource_dir, szFileName);
//    printf("%s\n", szTemp);
	
	fp = fopen(szTemp, read_mode);

	if (fp) {
		return fp;
	}
    
#ifdef __IPHONEOS__
    // 写文件只能写在document目录
    if (strchr(read_mode, 'w') != 0) {
        // 从外部拷贝进来的存档可能因为文件所属不是mobile导致无法写入。删除旧文件，重新创建新文件
        remove(szTemp);

        fp = fopen(szTemp, read_mode);
        if (fp) {
            return fp;
        }

        return NULL;
    }
#endif

#ifdef __ANDROID__
    return NULL;
#endif

	snprintf(szTemp, sizeof(szTemp) - 1, "%s%s", g_application_dir, szFileName);
	fp = fopen(szTemp, read_mode);
	if (fp) {
		return fp;
	}

	return NULL;
}

#ifdef ENABLE_LOG

static FILE *pLogFile = NULL;

FILE *
UTIL_OpenLog(
   VOID
)
{
   if ((pLogFile = open_file("log.txt", "a+")) == NULL)
   {
      return NULL;
   }

   return pLogFile;
}

VOID
UTIL_CloseLog(
   VOID
)
{
   if (pLogFile != NULL)
   {
      fclose(pLogFile);
   }
}

VOID
UTIL_WriteLog(
   int             Priority,
   const char     *Fmt,
   ...
)
{
   va_list       vaa;
   time_t        lTime;
   struct tm    *curTime;
   char          szDateBuf[260];

   time(&lTime);

   if ((Priority < LOG_EMERG) || (Priority >= LOG_LAST_PRIORITY))
   {
      return;
   }

   curTime = localtime(&lTime);
   strftime(szDateBuf, 128, "%Y-%m-%d   %H:%M:%S", curTime);
   szDateBuf[strlen(szDateBuf) - 1] = '\0'; //remove the

   va_start(vaa,Fmt);

   fprintf(pLogFile, "[%s]", szDateBuf);
   vfprintf(pLogFile, Fmt, vaa);
   fprintf(pLogFile, "\n");
   fflush(pLogFile);

   va_end(vaa);
}

#endif


#ifdef __WIN32__
void initDir()
{
}

void getFileStatus(const char* pszName)
{
}
void closeAds()
{
}

void initButton()
{
}

void hideMenu()
{
}

void showMenu()
{
}

void getScreenSize(int* width, int* height)
{
	if (width) {
		*width = 480;
	}

	if (height) {
		*height = 320;
	}
}

void showJoystick()
{
}

void hideJoystick()
{
}

void showBackButton(){};
void hideBackButton() {};
void hideSearchButton() {};

#elif defined __ANDROID__
#endif
