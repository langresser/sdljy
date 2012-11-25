//
//  CGJoystick.m
//  Pal_iOS
//
//  Created by 王 佳 on 12-7-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CGJoystick.h"
#import <QuartzCore/QuartzCore.h>
extern int g_currentDir;

@implementation CGJoystick

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    for (UITouch* touch in touches) {
        CGPoint point = [touch locationInView:self];
        CGRect rect = self.bounds;
        if (point.x >= 0 && point.x <= rect.size.width
            && point.y >= 0 && point.y <= rect.size.height) {
            int dir = [self getDirByPoint:point];
            if (stickDir != dir) {
                [self setNeedsDisplay];
                stickDir = dir;
            }
        }
    }
    
    [self doMove:stickDir];
}

-(void)doMove:(int)dir
{
    g_currentDir = dir;
}

-(int)getDirByPoint:(CGPoint)point
{
    CGSize size = self.frame.size;
    CGPoint centerPoint = CGPointMake(size.width / 2, size.height / 2);
    int diffX = point.x - centerPoint.x;
    int diffY = centerPoint.y - point.y;
    int absX = abs(diffX);
    int absY = abs(diffY);
    int dir = 0;
    
    if (diffY > 0 && (absX <= absY)) {
        dir = DIR_UP;
    } else if (diffY < 0 && absX <= absY) {
        dir = DIR_DOWN;
    } else if (diffX > 0 && absX >= absY) {
        dir = DIR_RIGHT;
    } else if (diffX < 0 && absX >= absY) {
        dir = DIR_LEFT;
    } else {
        dir = 0;
    }
    
    return dir;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch* touch in touches) {
        CGPoint point = [touch locationInView:self];
        CGRect rect = self.bounds;
        if (point.x >= 0 && point.x <= rect.size.width
            && point.y >= 0 && point.y <= rect.size.height) {
            int dir = [self getDirByPoint:point];
            if (stickDir != dir) {
                [self setNeedsDisplay];
                stickDir = dir;
            }
        }
    }
    
    [self doMove:stickDir];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (stickDir != 0) {
        [self setNeedsDisplay];
    }
    stickDir = 0;
    [self doMove:0];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (stickDir != 0) {
        [self setNeedsDisplay];
    }
    stickDir = 0;
}

- (void)drawRect:(CGRect)rect
{
    stickBase = [UIImage imageNamed:@"jsbg"];
    stickUp = [UIImage imageNamed:@"js4"];
    stickDown = [UIImage imageNamed:@"js8"];
    stickLeft = [UIImage imageNamed:@"js2"];
    stickRight = [UIImage imageNamed:@"js6"];

    // Drawing code
//    CGContextRef context = UIGraphicsGetCurrentContext();
    [stickBase drawInRect:rect];
    
    int width = self.bounds.size.width;
    
    switch (stickDir) {
        case DIR_UP:
            [stickUp drawInRect:CGRectMake(58 * width / 150, 15 * width / 150, 35 * width / 150, 90 * width / 150)];
            break;
        case DIR_DOWN:
            [stickDown drawInRect:CGRectMake(59 * width / 150, 68 * width / 150, 35 * width / 150, 90 * width / 150)];
            break;
        case DIR_LEFT:
            [stickLeft drawInRect:CGRectMake(13 * width / 150, 60 * width / 150, 90 * width / 150, 35 * width / 150)];
            break;
        case DIR_RIGHT:
            [stickRight drawInRect:CGRectMake(65 * width / 150, 60 * width / 150, 90 * width / 150, 35 * width / 150)];
            break;
        default:
            break;
    }
}


@end
