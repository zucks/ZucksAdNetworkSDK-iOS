//
//  SampleForCodingAppDelegate.h
//  SampleForCoding
//
//  Fluct SDK
//  Copyright 2011-2013 VOYAGE GROUP, Inc. All rights reserved.
//


#import <UIKit/UIKit.h>


@class SampleForCodingViewController;

@interface SampleForCodingAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SampleForCodingViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SampleForCodingViewController *viewController;

@end

