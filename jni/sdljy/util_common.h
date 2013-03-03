#ifndef UTIL_H
#define UTIL_H

//#define ENABLE_LOG 1
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stddef.h>
#include <stdarg.h>
#include "SDL.h"

#define kGameJinyong 0
#define kGameCanglong 1
#define kGameCangyan 2

#define kCharsesGB2312 0
#define kCharsetBig5 1
#define kCharsetUtf8 2
#define kCharsetUnicode 3

#ifdef __cplusplus
extern "C"
{
#endif
    
extern int g_app_type;
extern int g_charset;

#ifndef NULL
#define NULL (void*)0
#endif

#ifdef WIN32
#define snprintf _snprintf
#endif

FILE* open_file(const char* file_name, const char* read_mode);
const char* get_file_path(const char* file_name);
void remove_file(const char* file_name);
void freopen_file(const char * file, const char * mode, FILE * stderrfile);
char* my_strlwr(char* str);

extern int isPad();
extern void initDir();
extern void getFileStatus(const char* pszName);

extern void initButton();
extern void hideButton();

extern void showAds();
extern void closeAds();

extern void showMenu();
extern void hideMenu();
    
extern void showSearchButton();
extern void hideSearchButton();
    
extern void showJoystick();
extern void hideJoystick();
    
    extern void showBackButton();
    extern void hideBackButton();
    extern void switchShowMenu();
    

extern void getScreenSize(int* width, int* height);

#ifdef __cplusplus
}
#endif

#endif
