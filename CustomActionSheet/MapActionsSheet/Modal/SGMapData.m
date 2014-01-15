//
//  SGMapData.m
//  CustomActionSheet
//
//  Created by Sunil Gandham on 10/01/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import "SGMapData.h"

static NSInteger const kZoomDefault = 15;

@implementation SGMapData

- (id)init {
    self = [super init];
    if (!self) return nil;
    _zoom = kZoomDefault;
    return self;
}

- (NSString *)googleMapsCompleteLink {
    switch (self.mapDatatype) {
        case SGMapDataTypeSearchText:
            return [NSString
                    stringWithFormat:@"q=%@&zoom=%d",[self noSpaceTextWithText:_searchText]
                                                   ,_zoom];
        case SGMapDataTypeCoordinates:
            return [NSString
                    stringWithFormat:@"center=%f,%f&zoom=%d",_searchCoordinates.latitude
                                                             ,_searchCoordinates.longitude,_zoom];
        case SGMapDataTypeDirections:
            return [NSString
                    stringWithFormat:@"saddr=%@&daddr=%@&zoom=%d",[self obtaintSourceLocation]
                                                                  ,[self obtainDestinationLocation]
                                                                  ,_zoom];
        case SGMapDataTypeSearchTextWithCenter:
            return [NSString
                    stringWithFormat:@"q=%@&center=%f,%f&zoom=%d",[self noSpaceTextWithText:_searchText]
                                                                  ,_searchCoordinates.latitude
                                                                  ,_searchCoordinates.longitude
                                                                  ,_zoom];
        case SGMapDataTypeDirectionsWithCenter:
            return [NSString
                    stringWithFormat:@"saddr=%@&daddr=%@&center=%f,%f&zoom=%d",[self obtaintSourceLocation]
                                                                  ,[self obtainDestinationLocation]
                                                                  ,_searchCoordinates.latitude
                                                                  ,_searchCoordinates.longitude
                                                                  ,_zoom];
            
        default:
            return nil;
    }
}

- (NSString *)noSpaceTextWithText:(NSString *)textToBeTrimmed {
    NSArray* words = [textToBeTrimmed componentsSeparatedByCharactersInSet :[NSCharacterSet whitespaceCharacterSet]];
    NSString* noSpaceSearchText = [words componentsJoinedByString:@"+"];
    return noSpaceSearchText;
}


- (NSString *)obtaintSourceLocation {
    if (_sourceLocation == nil || [_sourceLocation length] == 0) {
        return [NSString stringWithFormat:@"%f,%f",_sourceCoordinates.latitude,_sourceCoordinates.longitude];
    }
    return [self noSpaceTextWithText:_sourceLocation];
}

- (NSString *)obtainDestinationLocation {
    if (_destinationLocation == nil || [_destinationLocation length] == 0) {
        return [NSString stringWithFormat:@"%f,%f",_destinationCoordinates.latitude,_destinationCoordinates.longitude];
    }
    return [self noSpaceTextWithText:_destinationLocation];
}


- (NSString *)appleMapsCompleteLink {
    switch (self.mapDatatype) {
        case SGMapDataTypeSearchText:
            return [NSString
                    stringWithFormat:@"q=%@&z=%d",[self noSpaceTextWithText:_searchText]
                    ,_zoom];
        case SGMapDataTypeCoordinates:
            return [NSString
                    stringWithFormat:@"sll==%f,%f&zoom=%d",_searchCoordinates.latitude
                    ,_searchCoordinates.longitude,_zoom];
        case SGMapDataTypeDirections:
            return [NSString
                    stringWithFormat:@"saddr=%@&daddr=%@",[self obtaintSourceLocation]
                    ,[self obtainDestinationLocation]];
        case SGMapDataTypeSearchTextWithCenter:
            return [NSString
                    stringWithFormat:@"q=%@&ll=%f,%f&zoom=%d",[self noSpaceTextWithText:_searchText]
                    ,_searchCoordinates.latitude
                    ,_searchCoordinates.longitude
                    ,_zoom];
        case SGMapDataTypeDirectionsWithCenter:
            return [NSString
                    stringWithFormat:@"saddr=%@&daddr=%@&ll=%f,%f&zoom=%d",[self obtaintSourceLocation]
                    ,[self obtainDestinationLocation]
                    ,_searchCoordinates.latitude
                    ,_searchCoordinates.longitude
                    ,_zoom];
        default:
            return nil;
    }
}

@end
