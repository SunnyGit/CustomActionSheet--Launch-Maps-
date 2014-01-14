//
//  SGMapActionSheet.m
//  CustomActionSheet
//
//  Created by Sunil Gandham on 09/01/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import "SGMapActionSheet.h"

#import "SGMapData.h"

typedef NS_ENUM (NSUInteger, SGMapType) {
    SGGoogleMaps,
    SGAppleMaps,
};

static NSInteger const kYesButton = 1;

NSString *kAppleMapsLink = @"http://maps.apple.com/?";
NSString *kGoogleMapsLink = @"comgooglemaps://?";
NSString *kGoogleMapsAppStoreLink = @"http://itunes.apple.com/in/app/google-maps/id585027354?mt=8";

@interface SGMapActionSheet () <UIActionSheetDelegate,UIAlertViewDelegate>

@property (nonatomic, strong) UIActionSheet *mapActionSheet;
@property (nonatomic, copy) NSString *cancelButtonTitle;
@property (nonatomic, strong) NSMutableArray *mapButtonsCollection;

@property (nonatomic, copy) NSString *completeMapLink;

@end

@implementation SGMapActionSheet

- (id)init {
    self = [super init];
    if (self == nil) return nil;
    _showActionSheetTitle = YES;
    _showCancelButton = YES;
    _mapData = [[SGMapData alloc] init];
    _cancelButtonTitle = NSLocalizedString(@"Cancel", @"");
    _actionSheetTitle = NSLocalizedString(@"Open Using", @"");
    [self setupActionSheet];
    return self;
}

- (instancetype)initWithTitle:(NSString *)actionSheetTitle {
    self = [self init];
    self.actionSheetTitle = actionSheetTitle;
    return self;
}

- (void)setupActionSheet {
    _mapActionSheet = [[UIActionSheet alloc] initWithTitle:_actionSheetTitle
                                                  delegate:self
                                         cancelButtonTitle:_cancelButtonTitle
                                    destructiveButtonTitle:nil
                                         otherButtonTitles:@"Google Maps",@"Apple Maps", nil];
    _mapActionSheet.actionSheetStyle = _mapActionSheetStyle;
    
}

#pragma mark Setter methods

- (void)setActionSheetTitle:(NSString *)actionSheetTitle {
    if (self.showActionSheetTitle == YES) {
       [self.mapActionSheet setTitle:actionSheetTitle];
    }
}

- (void)setMapActionSheetStyle:(UIActionSheetStyle)mapActionSheetStyle {
    _mapActionSheetStyle = mapActionSheetStyle;
    [self.mapActionSheet setActionSheetStyle:mapActionSheetStyle];
}

- (void)showActionSheetInView:(UIView *)view {
    [self.mapActionSheet showInView:view];
}

- (void)setShowActionSheetTitle:(BOOL)showActionSheetTitle {
    _showActionSheetTitle = showActionSheetTitle;
    [self setupActionSheetTitle];
}

- (void)setShowCancelButton:(BOOL)showCancelButton {
    _showCancelButton = showCancelButton;
    [self setupCancelButton];
}

#pragma mark Private Method

- (void)setupActionSheetTitle {
    if (_showActionSheetTitle == NO) {
        self.mapActionSheet.title = nil;
    }
}

- (void)setupCancelButton {
    if (_showCancelButton == NO) {
        self.cancelButtonTitle = nil;
        [self setupActionSheet];
    }
}

- (void)openGoogleMaps {
    if ([self canOpenGoogleMaps]) {
        [self openMap];
    } else {
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Download Google Maps", @"")
                                   message:NSLocalizedString(@"Do You want Install Maps from the Appstore?", @"")
                                  delegate:self
                         cancelButtonTitle:@"No"
                         otherButtonTitles:@"Yes", nil] show];
    }
}

- (void)openGoogleMapsInAppstore {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:kGoogleMapsAppStoreLink]];
}

- (void)openAppleMaps {
    [self openMap];
}

- (BOOL)canOpenGoogleMaps {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:kGoogleMapsLink]]) {
        return YES;
    }
    return NO;
}

- (void)openMap {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.completeMapLink]];
}

- (void)prepareGoogleMapLink {
    NSString *mapLink = [NSString stringWithFormat:@"%@%@",kGoogleMapsLink,
                                                           [_mapData googleMapsCompleteLink]];
    self.completeMapLink = mapLink;
}

- (void)prepareAppleMapLink {
    NSString *mapLink = [NSString stringWithFormat:@"%@%@",kAppleMapsLink,
                                                           [_mapData appleMapsCompleteLink]];
    self.completeMapLink = mapLink;
}

#pragma mark UIActionSheet Delegate Methods

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case SGGoogleMaps:
            [self prepareGoogleMapLink];
            [self openGoogleMaps];
            break;
        case SGAppleMaps:
            [self prepareAppleMapLink];
            [self openAppleMaps];
            break;
        default:
            break;
    }
}

#pragma mark UIAlertView Delegate Methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case kYesButton:
            [self openGoogleMapsInAppstore];
            break;
        default:
            break;
    }
}

@end
