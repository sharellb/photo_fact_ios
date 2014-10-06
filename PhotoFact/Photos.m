//
//  Photos.m
//  PhotoFact
//
//  Created by Sharell Bryant on 10/6/14.
//  Copyright (c) 2014 Sharell Bryant. All rights reserved.
//

#import "Photos.h"

@implementation Photos

+ (NSArray *)photosFromJSON:(NSArray *)photos
{
    NSMutableArray *photoModels = [NSMutableArray new];
    
    for (NSDictionary *photo in photos) {
        Photos *newPhoto = [[Photos alloc] init];
        
        newPhoto.image = photo[@"image"];
        
        [photoModels addObject:newPhoto];
    }
    
    return [NSArray arrayWithArray:photoModels];
}

@end

