//
//  ScenicViewController.m
//  ADIntervene
//
//  Created by CSX on 2017/4/14.
//  Copyright © 2017年 宗盛商业. All rights reserved.
//

#import "ScenicViewController.h"

@interface ScenicViewController ()

@property (nonatomic, strong)ADBannerView *adBannerView;
@property (nonatomic, assign)BOOL   adBannerViewIsVisible;

@end

@implementation ScenicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:[self setAdBannerView]];
    
    
}

#pragma mark---------ADBannerView】初始化
- (ADBannerView *)setAdBannerView{
    self.adBannerView = [[ADBannerView alloc]initWithAdType:ADAdTypeBanner];
    [self.adBannerView setFrame:CGRectMake(0, self.view.bounds.size.height-50, 0, 0)];
    [self.adBannerView setBackgroundColor:[UIColor redColor]];
    self.adBannerView.delegate = self;
    NSLog(@"%f",_adBannerView.frame.size.height);
    return self.adBannerView;
}


#pragma mark ----- ADBannerViewDelegate
- (void) bannerViewDidLoadAd:(ADBannerView *)banner{
    if (!self.adBannerViewIsVisible) {
        [UIView beginAnimations:@"animationAdBVannerOn" context:NULL];
        banner.frame = CGRectOffset(banner.frame, 0, -50);
        [UIView commitAnimations];
        self.adBannerViewIsVisible = YES;
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    if (self.adBannerViewIsVisible) {
        [UIView beginAnimations:@"animationAdBannerOff" context:NULL];
        banner.frame = CGRectOffset(banner.frame, 0, 50);
        [UIView commitAnimations];
        self.adBannerViewIsVisible = NO;
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
