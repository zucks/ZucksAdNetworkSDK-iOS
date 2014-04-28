//
//  AnotherViewController.m
//  SampleForCoding
//
//  Fluct SDK
//  Copyright 2011-2013 VOYAGE GROUP, Inc. All rights reserved.
//

#import "AnotherViewController.h"

#import "FluctBannerView.h"


@implementation AnotherViewController


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    NSLog(@"サンプル : 別Viewのバナー広告を表示します");

    // 広告表示
    FluctBannerView *bannerView = [[FluctBannerView alloc] initWithFrame:CGRectMake(0, 44, 320, 50)];
    bannerView.tag = 2;
    [self.view addSubview:bannerView];
    [bannerView release];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [[self.view viewWithTag:2] removeFromSuperview];
}


- (IBAction)clickClose:(id)sender
{
    // 画面を閉じる
    [self dismissModalViewControllerAnimated:YES];
}

@end
