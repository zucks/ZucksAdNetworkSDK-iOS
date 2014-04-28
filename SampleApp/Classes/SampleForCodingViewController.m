//
//  SampleForCodingViewController.m
//  SampleForCoding
//
//  Fluct SDK
//  Copyright 2011-2013 VOYAGE GROUP, Inc. All rights reserved.
//


#import "SampleForCodingViewController.h"
#import "AnotherViewController.h"

// ライブラリ使用に必要なヘッダファイルをインポート
#import "FluctBannerView.h"
#import "FluctInterstitialView.h"

@interface SampleForCodingViewController ()<FluctInterstitialViewDelegate>

@property (nonatomic, strong) FluctInterstitialView *interstitialView;

@end

@implementation SampleForCodingViewController


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    NSLog(@"サンプル : バナー広告を表示します");

    // 広告表示
    FluctBannerView *bannerView = [[FluctBannerView alloc] initWithFrame:CGRectMake(0, 44, 320, 50)];
    bannerView.tag = 1;
    [self.view addSubview:bannerView];
    [bannerView release];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [[self.view viewWithTag:1] removeFromSuperview];
}


-(IBAction)clickOpen:(id)sender
{
    AnotherViewController *vc = [[AnotherViewController alloc] initWithNibName:@"AnotherViewController" bundle:nil];
    [self presentModalViewController:vc animated:YES];
    [vc release];
}


-(IBAction)showInterstitial:(id)sender
{
    NSLog(@"サンプル : インタースティシャル広告を表示します");

    if (!_interstitialView) {
        _interstitialView = [[FluctInterstitialView alloc] initWithMediaID:FLUCT_INTERSTITIAL_MEDIA_ID];
        _interstitialView.delegate = self;
    }
    [_interstitialView showInterstitialAd];
}


#pragma mark - FluctInterstitialViewDelegate
- (void)fluctInterstitialView:(FluctInterstitialView *)interstitialView callbackValue:(NSInteger)callbackValue
{
    switch (callbackValue) {
        case FluctInterstitialShow:
            // 広告表示が完了した場合
            NSLog(@"サンプル : FluctInterstitialShow");
            break;
        case FluctInterstitialTap:
            // 広告をタップされた場合
            // (同時に広告表示は閉じられます)
            NSLog(@"サンプル : FluctInterstitialTap");
            break;
        case FluctInterstitialClose:
            // 広告が閉じられた場合
            NSLog(@"サンプル : FluctInterstitialClose");
            break;
        case FluctInterstitialCancel:
            // 広告が表示率の設定によって表示キャンセルされた場合
            // (表示率は管理画面から設定が可能です)
            NSLog(@"サンプル : FluctInterstitialCancel");
            break;
        case FluctInterstitialOffline:
            // 圏外状態の場合
            NSLog(@"サンプル : FluctInterstitialOffline");
            break;
        case FluctInterstitialMediaIDError:
            // メディアIDが未設定の場合
            NSLog(@"サンプル : ");
            break;
        case FluctInterstitialNoConfig:
            // メディアIDの設定がインタースティシャル広告になっていない場合
            NSLog(@"サンプル : FluctInterstitialMediaIDError");
            break;
        case FluctInterstitialSizeError:
            // 端末の画面内に広告が収まらない場合
            // (広告は表示されません)
            NSLog(@"サンプル : FluctInterstitialSizeError");
            break;
        case FluctInterstitialGetConfigError:
            // 広告設定の取得時に問題がある場合
            // (メディアIDが正しいかご確認ください)
            NSLog(@"サンプル : FluctInterstitialGetConfigError");
            break;
        case FluctInterstitialOtherError:
            // その他エラーが発生した場合
            NSLog(@"サンプル : FluctInterstitialOtherError");
            break;
        default:
            // 予期せぬCallbackValueが通知された場合
            NSLog(@"サンプル : FluctInterstitialUndefined");
    }
}

@end
