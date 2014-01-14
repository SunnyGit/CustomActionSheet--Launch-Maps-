//
//  SGMapData.h
//  CustomActionSheet
//
//  Created by Sunil Gandham on 10/01/14.
//  Copyright (c) 2014 Sunil Gandham. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreLocation/CoreLocation.h>

typedef NS_ENUM (NSUInteger, SGMapDataType) {
    SGMapDataTypeSearchText,
    SGMapDataTypeCoordinates,
    SGMapDataTypeDirections,
    SGMapDataTypeSearchTextWithCenter,
    SGMapDataTypeDirectionsWithCenter,
};

@interface SGMapData : NSObject

/**
 This holds the zoom level of the map.
 */
@property (nonatomic, assign) NSInteger zoom;

/**
 This holds the search text to be searched on the map.
 */
@property (nonatomic, copy) NSString *searchText;

/**
 This holds the map data type.
 */
@property (nonatomic, assign) SGMapDataType mapDatatype;

/**
 This will hold the current search location co-ordinates
 */
@property (nonatomic, assign) CLLocationCoordinate2D searchCoordinates;

/**
 This will hold the current search location co-ordinates
 */
@property (nonatomic, assign) CLLocationCoordinate2D sourceCoordinates;

/**
 This will hold the current search location co-ordinates
 */
@property (nonatomic, assign) CLLocationCoordinate2D destinationCoordinates;


/**
 This holds the source location for direction in the map
 */
@property (nonatomic, assign) NSString *sourceLocation;

/**
 This holds the destination location for direction in the map
 */
@property (nonatomic, assign) NSString *destinationLocation;

/**
 @method googleMapsCompleteLink
 @returnType NSString return a link of type string
 @abstract This method will return the complete link for google maps based on map data type
 */
- (NSString *)googleMapsCompleteLink;

/**
 @method appleMapsCompleteLink
 @returnType NSString return a link of type string
 @abstract This method will return the complete link for apple maps based on map data type
 */
- (NSString *)appleMapsCompleteLink;


@end
