//
//  Facts.h
//  PhotoFact
//
//  Created by Sharell Bryant on 10/2/14.
//  Copyright (c) 2014 Sharell Bryant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Facts : NSObject

@property (nonatomic, strong)NSString *info;

+ (NSArray *)factsFromJSON: (NSArray *)facts;


@end
