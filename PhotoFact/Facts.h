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
@property (nonatomic, strong)NSString *category_id;

+ (NSArray *)factsFromJSON: (NSArray *)facts;


@end
