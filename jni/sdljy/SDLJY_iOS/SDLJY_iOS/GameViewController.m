//
//  GameViewController.m
//  SDLJY_iOS
//
//  Created by 佳 王 on 12-11-25.
//  Copyright (c) 2012年 佳 王. All rights reserved.
//

#import "GameViewController.h"
#import "util_common.h"

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    if (defaults) {
        int joystick = [defaults integerForKey:@"JoystickMode"];
    }
    
    int width, height;
    getScreenSize(&width, &height);
    
    if (isPad()) {
        joystick = [[CGJoystick alloc]initWithFrame:CGRectMake(10, height - 200 - 5, 200, 200)];
    } else {
        joystick = [[CGJoystick alloc]initWithFrame:CGRectMake(5, 185, 130, 130)];
    }

    [self.view addSubview:joystick];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orient
{
    return UIInterfaceOrientationIsLandscape(orient);
}

@end
