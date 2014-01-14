CustomActionSheet--Launch-Maps-
===============================

It is build to launch maps from you native iOS apps using a action sheet. It will take a bunch of inputs to launch the map and show the respective results. All that you need to do is create a instance of SGActionSheet and supply data to it using SGMapData.Let's have a look at sample code

    self.actionSheet = [[SGMapActionSheet alloc] 
			initWithTitle:@"Open Locations using"];
     //setting data   
    SGMapData *data = [[SGMapData alloc] init];
    data.mapDatatype = SGMapDataTypeDirections;  
    data.sourceCoordinates = CLLocationCoordinate2DMake(29.38265, -95.32355);
    data.destinationCoordinates = CLLocationCoordinate2DMake(44.314, -85.606);
    data.zoom = 12;
   
    self.actionSheet.mapData = data;    
    [_actionSheet showActionSheetInView:self.view];

SGMapData has different attributes like search text, search coordinates, source location (accepts string),destination location (accepts string). The data you provide will depend on type map data type. For instance if you set mapDataType to SGMapDataTypeSearchText then you should make sure that you are providing the search Text.  
