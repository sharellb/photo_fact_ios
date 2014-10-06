//
//  Photos.h
//  PhotoFact
//
//  Created by Sharell Bryant on 10/6/14.
//  Copyright (c) 2014 Sharell Bryant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photos : NSObject

@property (nonatomic, strong)NSString *image;

+ (NSArray *)photosFromJSON: (NSArray *)photos;

@end
