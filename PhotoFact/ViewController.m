//
//  ViewController.m
//  PhotoFact
//
//  Created by Sharell Bryant on 9/30/14.
//  Copyright (c) 2014 Sharell Bryant. All rights reserved.
//

#import "ViewController.h"
#import "Facts.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *facts;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSURL *url = [NSURL URLWithString:@"http://sheltered-coast-4961.herokuapp.com/facts.json"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:urlRequest
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data
                                                                                    options:0
                                                                                      error:nil];
                               
                               self.facts = [Facts factsFromJSON:jsonArray];
                         
                           }];
}


- (IBAction)nextFactButton {
    int random = arc4random_uniform(self.facts.count);
    Facts *fact = self.facts[random];
    self.FactLabel.text = fact.info;
}
@end
