//
//  SettingViewController.m
//  MD
//
//  Created by 王 佳 on 12-9-5.
//  Copyright (c) 2012年 Gingco.Net New Media GmbH. All rights reserved.
//

#import "SettingViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIDevice+Util.h"
#import "UIGlossyButton.h"
#import "UIView+LayerEffects.h"
#import "UMFeedback.h"
#import "AppDelegate.h"
#import "InAppPurchaseMgr.h"
#import "GameViewController.h"

#define kPurchaseCanglong @"kPurchaseCanglong"
#define kPurchaseCangyan @"kPurchaseCangyan"

int g_currentMB = 0;
extern int g_app_type;

@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView
{
    settingView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    settingView.backgroundColor = [UIColor colorWithRed:240.0 / 255 green:248.0 / 255 blue:1.0 alpha:1.0];
    
    float offsetY = 0;
#ifndef APP_FOR_APPSTORE
    _banner = [[DianJinOfferBanner alloc] initWithOfferBanner:CGPointMake(0, 0) style:kDJBannerStyle320_50];
    DianJinTransitionParam *transitionParam = [[DianJinTransitionParam alloc] init];
    transitionParam.animationType = kDJTransitionCube;
    transitionParam.animationSubType = kDJTransitionFromTop;
    transitionParam.duration = 1.0;
    [_banner setupTransition:transitionParam];
    [settingView addSubview:_banner];
    offsetY = 50;
#endif

    if (!isPad()) {
        UIGlossyButton* btnBack = [[UIGlossyButton alloc]initWithFrame:CGRectMake(220, offsetY, 80, 30)];
        [btnBack setTitle:@"返回游戏" forState:UIControlStateNormal];
        [btnBack addTarget:self action:@selector(onClickBack) forControlEvents:UIControlEventTouchUpInside];
        
        [btnBack useWhiteLabel: YES];
        btnBack.tintColor = [UIColor brownColor];
        [btnBack setShadow:[UIColor blackColor] opacity:0.8 offset:CGSizeMake(0, 1) blurRadius: 4];
        [btnBack setGradientType:kUIGlossyButtonGradientTypeLinearSmoothBrightToNormal];
        [settingView addSubview:btnBack];
    }
    
    UIGlossyButton* btnMB = [[UIGlossyButton alloc]initWithFrame:CGRectMake(20, offsetY, 80, 30)];
    [btnMB setTitle:@"获取M币" forState:UIControlStateNormal];
    [btnMB addTarget:self action:@selector(onClickMB) forControlEvents:UIControlEventTouchUpInside];
    [btnMB useWhiteLabel: YES];
    btnMB.tintColor = [UIColor brownColor];
	[btnMB setShadow:[UIColor blackColor] opacity:0.8 offset:CGSizeMake(0, 1) blurRadius: 4];
    [btnMB setGradientType:kUIGlossyButtonGradientTypeLinearSmoothBrightToNormal];
    [settingView addSubview:btnMB];
    
    labelMB = [[UILabel alloc]initWithFrame:CGRectMake(100, offsetY, 100, 30)];
    labelMB.backgroundColor = [UIColor clearColor];
    [settingView addSubview:labelMB];
    
    offsetY += 30;
    
    m_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, offsetY, 320, 430) style:UITableViewStyleGrouped];
    m_tableView.delegate = self;
    m_tableView.dataSource = self;
    m_tableView.backgroundColor = [UIColor colorWithRed:240.0 / 255 green:248.0 / 255 blue:1.0 alpha:1.0];
    [m_tableView setBackgroundView:nil];
    [settingView addSubview:m_tableView];

    [self setView:settingView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.contentSizeForViewInPopover = CGSizeMake(320, 480);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    g_currentMB = [[NSUserDefaults standardUserDefaults]integerForKey:@"MB"];
    [self updateMB];

    [m_tableView reloadData];
}

-(void)updateMB
{
    labelMB.text = [NSString stringWithFormat:@"当前M币: %d", g_currentMB];
}

-(void)onClickMB
{
    [[DianJinOfferPlatform defaultPlatform]showOfferWall: self delegate:self];
}

-(void)onClickBack
{
    if (isPad()) {
    } else {
        if ([[[UIDevice currentDevice]systemVersion]floatValue] >= 5.0) {
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            [self dismissModalViewControllerAnimated:YES];
        }
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"游戏扩展";
    } else if (section == 1) {
        return @"其他";
    }
    return @"";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    } else if (section == 1) {
        return 4;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = nil;
    
    if (indexPath.section == 0) {
        static NSString* cellIdent = @"MyCellMy";
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdent];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdent];
            cell.textLabel.font = [UIFont systemFontOfSize:17.0];
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
            
            UIImageView* imageLock = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"gui_lock.png"]];
            imageLock.frame = CGRectMake(280, 5, 15, 15);
            imageLock.tag = 101;
            [cell.contentView addSubview:imageLock];
        }
        
        UIImageView* imageLock = (UIImageView*)[cell.contentView viewWithTag:101];
        if (indexPath.row == 0) {
            imageLock.hidden = YES;
            cell.textLabel.text = @"金庸原版";
            cell.detailTextLabel.text = @"怀旧推荐";
        } else if (indexPath.row == 1) {
            imageLock.hidden = [self isPurchase:kPurchaseCanglong alert:NO];
            cell.textLabel.text = @"苍龙逐日";
            cell.detailTextLabel.text = @"v1.2美化版，最完美版本，没有之一";
        }
        cell.accessoryType = (indexPath.row == g_app_type) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    } else if (indexPath.section == 1) {
        static NSString* cellIdent = @"MyCellGongl";
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdent];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdent];
            cell.textLabel.font = [UIFont systemFontOfSize:17.0];
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"意见反馈";
                cell.detailTextLabel.text = @"此非即时通讯，您可以通过微博与我们联系";
                break;
            case 1:
                cell.textLabel.text = @"新浪微博(@BananaStudio)";
                cell.detailTextLabel.text = @"关注我们，了解最新游戏发布及版本更新";
                break;
            case 2:
                cell.textLabel.text = @"腾讯微博(@BananaStudio)";
                cell.detailTextLabel.text = @"关注我们，了解最新游戏发布及版本更新";
                break;
            case 3:
                cell.textLabel.text = @"精品推荐";
                cell.detailTextLabel.text = @"";
                break;
            default:
                break;
        }
    }
    
    return cell;
}

-(BOOL)isPurchase:(NSString*)purchaseKey alert:(BOOL)alert
{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    BOOL isPurchase = [defaults boolForKey:purchaseKey];
    if (isPurchase) {
        return YES;
    }
    
    if (alert) {
#ifdef APP_FOR_APPSTORE
        [[InAppPurchaseMgr sharedInstance]purchaseProUpgrade];
#else
        m_purchaseKey = purchaseKey;
        costMB = 50;

        NSString* title = [NSString stringWithFormat:@"消耗%dM币解锁此项，您可以通过下载精品推荐应用的方式免费获取MB，当前MB:%d", costMB, g_currentMB];
        UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:title delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:@"解锁", @"获取MB", nil];
        [alertView show];
#endif
    }
    
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (indexPath.section == 0) {
        int mod = 0;
        switch (indexPath.row) {
            case 0:
                mod = 0;
                break;
            case 1:
                if (![self isPurchase:kPurchaseCanglong alert:YES]) {
                    return;
                }
                mod = 1;
                break;
            default:
                break;
        }

        if (mod != g_app_type) {
            g_app_type = mod;
            [m_tableView reloadData];
            [[NSUserDefaults standardUserDefaults]setInteger:g_app_type forKey:@"mod"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            
            UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"信息" message:@"选择完成，请重启游戏" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            alert.tag = 999;
            [alert show];
            
            [self onClickBack];
        }
    
    } else if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                [UMFeedback showFeedback:self withAppkey:kUMengAppKey];
                break;
            case 1:
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://weibo.com/bananastudi0"]];
                break;
            case 2:
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://t.qq.com/BananaStudio"]];
                break;
            case 3:
                [[DianJinOfferPlatform defaultPlatform]showOfferWall: self delegate:self];
                break;
                break;
            default:
                break;
        }
    }
}

- (void)appActivatedDidFinish:(NSDictionary *)resultDic
{
    NSLog(@"%@", resultDic);
    NSNumber *result = [resultDic objectForKey:@"result"];
    if ([result boolValue]) {
        NSNumber *awardAmount = [resultDic objectForKey:@"awardAmount"];
        NSString *identifier = [resultDic objectForKey:@"identifier"];
        NSLog(@"app identifier = %@", identifier);
        g_currentMB += [awardAmount floatValue];
        [[NSUserDefaults standardUserDefaults]setInteger:g_currentMB forKey:@"MB"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        [self updateMB];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    if (alertView.tag == 999) {
        exit(0);
    } else {
        if (buttonIndex == 1) {
            if (g_currentMB < costMB) {
                UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"错误" message:[NSString stringWithFormat:@"M币不足，当前M币:%d",g_currentMB] delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil];
                [alert show];
            } else {
                g_currentMB -= costMB;
                [[NSUserDefaults standardUserDefaults]setInteger:g_currentMB forKey:@"MB"];
                [[NSUserDefaults standardUserDefaults] setBool:YES forKey:m_purchaseKey];
                [[NSUserDefaults standardUserDefaults]synchronize];
                [self updateMB];
                costMB = 0;
            }
        } else if (buttonIndex == 2) {
            [[DianJinOfferPlatform defaultPlatform]showOfferWall: self delegate:self];
        }
    }
}
@end
