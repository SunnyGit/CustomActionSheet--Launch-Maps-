//
//  PSViewController.m
//  CustomActionSheet
//
//  Created by Sunil Gandham on 09/01/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import "PSViewController.h"

#import "SGMapActionSheet.h"
#import "SGMapData.h"

@interface PSViewController ()

@property (nonatomic, strong) SGMapActionSheet *actionSheet;

@end

@implementation PSViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.actionSheet = [[SGMapActionSheet alloc] initWithTitle:@"TIt"];
    //setting data
    SGMapData *data = [[SGMapData alloc] init];
    data.mapDatatype = SGMapDataTypeDirections;
    data.sourceCoordinates = CLLocationCoordinate2DMake(29.38265, -95.32355);
    data.destinationCoordinates = CLLocationCoordinate2DMake(44.31484, -85.60236);
    data.zoom = 12;
    
    self.actionSheet.mapData = data;
    [_actionSheet showActionSheetInView:self.view];
}

@end
