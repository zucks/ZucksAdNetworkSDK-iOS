//
//  InterstitialViewController.m
//  SampleApp
//
//  Fluct SDK
//  Copyright (c) 2014 VOYAGE GROUP, Inc. All rights reserved.
//

#import "InterstitialViewController.h"

#import "FluctInterstitialView.h"

@interface InterstitialViewController () <FluctInterstitialViewDelegate>

@property (nonatomic) FluctInterstitialView *interstitialView;

@end

@implementation InterstitialViewController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)showInterstitial:(id)sender
{
    if (self.interstitialView != nil) {
        return;
    }
    self.interstitialView = [[FluctInterstitialView alloc] initWithMediaID:FLUCT_INTERSTITIAL_MEDIA_ID];
    self.interstitialView.delegate = self;
    [self.interstitialView showInterstitialAdWithHexColor:@"#0000FF"];
}

- (void)fluctInterstitialView:(FluctInterstitialView *)interstitialView
                callbackValue:(NSInteger)callbackValue
{
    NSLog(@"%ld", (long)callbackValue);
    
    switch (callbackValue) {
        case FluctInterstitialClose:
        case FluctInterstitialTap:
        case FluctInterstitialCancel:
        case FluctInterstitialOffline:
        case FluctInterstitialMediaIDError:
        case FluctInterstitialNoConfig:
        case FluctInterstitialSizeError:
        case FluctInterstitialGetConfigError:
        case FluctInterstitialOtherError:
            self.interstitialView = nil;
            break;
    }
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self.interstitialView dismissInterstitialAd];
    self.interstitialView = nil;
}

@end
