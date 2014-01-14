//
//  SGMapActionSheet.h
//  CustomActionSheet
//
//  Created by Sunil Gandham on 09/01/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SGMapData;

@interface SGMapActionSheet : NSObject

/**
  This is to set the title of action Sheet.
  Default Title is Open Using
 */
@property (nonatomic, copy) NSString *actionSheetTitle;

/**
 This decides wheather we have to show actionSheetTitle
 Default value is YES
 */
@property (nonatomic, assign) BOOL showActionSheetTitle;

/**
 This decides wheather we have to show cancel button
 Default value is YES
 */
@property (nonatomic, assign) BOOL showCancelButton;

/**
 This is to set ActionSheet Style. AS per iOS 7 UI Transition Guide changes 
 to this will not effect.
 */
@property (nonatomic, assign) UIActionSheetStyle mapActionSheetStyle;

/**
 This will contain various map keys to navigate appropriately 
 */
@property (nonatomic, strong) SGMapData *mapData;


/**
 @method showActionSheetInView:
 @param view The view in which actionsheet should be displayed.
 @abstract This is used to show action sheet in provided view.
 */
- (void)showActionSheetInView:(UIView *)view;

/**
 @method initWithTitle:
 @param viactionSheetTitleew Title to be displayed on top of actionsheet
 @abstract This is custom initializer for Action Sheet which takes actionSheetTitle as imput
 */
- (instancetype)initWithTitle:(NSString *)actionSheetTitle;

@end
