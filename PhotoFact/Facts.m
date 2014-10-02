//
//  Facts.m
//  PhotoFact
//
//  Created by Sharell Bryant on 10/2/14.
//  Copyright (c) 2014 Sharell Bryant. All rights reserved.
//

#import "Facts.h"

@implementation Facts

+ (NSArray *)factsFromJSON:(NSArray *)facts
{
    NSMutableArray *factModels = [NSMutableArray new];
    
    for (NSDictionary *fact in facts) {
        Facts *newFact = [[Facts alloc] init];
        
        newFact.info = fact[@"info"];
        
        [factModels addObject:newFact];
    }
    
    return [NSArray arrayWithArray:factModels];
}

@end
