//
//  GameViewController.m
//  SDLJY_iOS
//
//  Created by 佳 王 on 12-11-25.
//  Copyright (c) 2012年 佳 王. All rights reserved.
//

#import "GameViewController.h"
#import "util_common.h"

extern int g_pressButton;

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
    CGRect rectA, rectB;
    
    if (isPad()) {
        joystick = [[CGJoystick alloc]initWithFrame:CGRectMake(20, height - 150 - 20, 150, 150)];
        rectA = CGRectMake(965, 710, 50, 50);
        rectB = CGRectMake(900, 710, 50, 50);
    } else {
        joystick = [[CGJoystick alloc]initWithFrame:CGRectMake(5, 200, 110, 110)];
        rectA = CGRectMake(430, 250, 50, 50);
        rectB = CGRectMake(370, 250, 50, 50);
    }
    
    btnMenu = [UIButton buttonWithType:UIButtonTypeCustom];
    btnMenu.frame = CGRectMake(width - 50, 0, 50, 50);
    [btnMenu setImage:[UIImage imageNamed:@"pause.png"] forState:UIControlStateNormal];
    [btnMenu addTarget:self action:@selector(onClickMenu) forControlEvents:UIControlEventTouchUpInside];
    
    btnA = [UIButton buttonWithType:UIButtonTypeCustom];
    btnA.frame = rectA;
    [btnA setImage:[UIImage imageNamed:@"anormal.png"] forState:UIControlStateNormal];
    [btnA setImage:[UIImage imageNamed:@"aclick.png"] forState:UIControlStateHighlighted];
    [btnA addTarget:self action:@selector(onClickA) forControlEvents:UIControlEventTouchUpInside];
    
    btnB = [UIButton buttonWithType:UIButtonTypeCustom];
    btnB.frame = rectB;
    [btnB setImage:[UIImage imageNamed:@"bnormal.png"] forState:UIControlStateNormal];
    [btnB setImage:[UIImage imageNamed:@"bclick.png"] forState:UIControlStateHighlighted];
    [btnB addTarget:self action:@selector(onClickB) forControlEvents:UIControlEventTouchUpInside];

    joystick.alpha = 0.3;
    btnMenu.alpha = 0.3;
    btnA.alpha = 0.3;
    btnB.alpha = 0.3;

    [self.view addSubview:btnMenu];
    [self.view addSubview:joystick];
    [self.view addSubview:btnA];
    [self.view addSubview:btnB];
}

-(void)showSettingPopup:(BOOL)show
{
    if (show) {
        if (isPad()) {
            if (popoverVC == nil) {
                settingVC = [[SettingViewController alloc]initWithNibName:nil bundle:nil];
                popoverVC = [[UIPopoverController alloc] initWithContentViewController:settingVC];
                popoverVC.delegate = self;
            }

            CGRect rect = CGRectMake(100, 60, 10, 10);
            [popoverVC presentPopoverFromRect:rect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
        } else {
            if (settingVC == nil) {
                settingVC = [[SettingViewController alloc]initWithNibName:nil bundle:nil];
            }
            
            if ([[[UIDevice currentDevice]systemVersion]floatValue] >= 5.0) {
                [self presentViewController:settingVC animated:YES completion:nil];
            } else {
                [self presentModalViewController:settingVC animated:YES];
            }
        }
    } else {
        if (isPad()) {
            [popoverVC dismissPopoverAnimated:YES];
        } else {
            if ([[[UIDevice currentDevice]systemVersion]floatValue] >= 5.0) {
                [settingVC dismissViewControllerAnimated:YES completion:nil];
            } else {
                [settingVC dismissModalViewControllerAnimated:YES];
            }
        }
    }
}

-(void)onClickMenu
{
    [self showSettingPopup:YES];
}

-(void)onClickA
{
    g_pressButton = 1;
}

-(void)onClickB
{
    g_pressButton = 2;
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
