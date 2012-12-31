//
//  iOSUtil.m
//  Pal_iOS
//
//  Created by 王 佳 on 12-7-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#include "util_common.h"

BOOL g_useJoyStick = YES;
extern int g_currentMB;

int isPad()
{
	BOOL result = NO;
	if ([[UIDevice currentDevice] respondsToSelector:@selector(userInterfaceIdiom)]) {
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 30200
		result = ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad);
#endif
	}
	return result;
}

extern char g_application_dir[256];
extern char g_resource_dir[256];
void initDir()
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString  *plistPath = [paths objectAtIndex:0];
    strlcpy(g_resource_dir, [plistPath UTF8String], sizeof(g_resource_dir));
    
    g_resource_dir[strlen(g_resource_dir)] = '/';
    
    strlcpy(g_application_dir, [[[NSBundle mainBundle]bundlePath]UTF8String], sizeof(g_application_dir));
    g_application_dir[strlen(g_application_dir)] = '/';
    
    NSFileManager* fmgr = [NSFileManager defaultManager];
    NSString* sdljy = [plistPath stringByAppendingPathComponent:@"jinyong"];
    NSString* sdlcl = [plistPath stringByAppendingPathComponent:@"canglong"];

    [fmgr createDirectoryAtPath:sdljy withIntermediateDirectories:YES attributes:nil error:nil];
    [fmgr createDirectoryAtPath:sdlcl withIntermediateDirectories:YES attributes:nil error:nil];
    
    NSString* scripts = [sdljy stringByAppendingPathComponent:@"script"];
    
    [fmgr createDirectoryAtPath:scripts withIntermediateDirectories:YES attributes:nil error:nil];
    
    scripts = [sdlcl stringByAppendingPathComponent:@"script"];
    
    [fmgr createDirectoryAtPath:scripts withIntermediateDirectories:YES attributes:nil error:nil];
}

void getFileStatus(const char* pszName)
{
    NSFileManager* fmgr = [NSFileManager defaultManager];
    if (!fmgr) {
        return;
    }
    
    NSError* error;
    NSDictionary* attr = [fmgr attributesOfItemAtPath:[NSString stringWithUTF8String:pszName] error:&error];


    NSLog(@"file: %s    attr:%@ ", pszName, attr);
}

void getScreenSize(int* width, int* height)
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    if (width) {
        *width = size.width > size.height ? size.width : size.height;
    }
    
    if (height) {
        *height = size.width > size.height ? size.height : size.width;
    }
}
