//
//  ViewController.h
//  PhotoFact
//
//  Created by Sharell Bryant on 9/30/14.
//  Copyright (c) 2014 Sharell Bryant. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Facts;

@interface ViewController : UIViewController
- (IBAction)nextFactButton;

@property (strong, nonatomic) IBOutlet UILabel *FactLabel;

@end

