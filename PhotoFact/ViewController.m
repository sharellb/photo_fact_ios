//
//  ViewController.m
//  PhotoFact
//
//  Created by Sharell Bryant on 9/30/14.
//  Copyright (c) 2014 Sharell Bryant. All rights reserved.
//

#import "ViewController.h"
#import "Facts.h"
#import "Photos.h"


@interface ViewController ()
@property (nonatomic, strong) NSArray *facts;
@property (nonatomic, strong) NSArray *photos;
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
    
   
    NSURL *factUrl = [NSURL URLWithString:@"http://sheltered-coast-4961.herokuapp.com/facts.json"];
    NSURLRequest *factUrlRequest = [NSURLRequest requestWithURL:factUrl];
    [NSURLConnection sendAsynchronousRequest:factUrlRequest
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               if (data == nil) {
                                   NSLog(@"Something is wrong");
                                   return;
                               }
                               NSArray *factjsonArray = [NSJSONSerialization JSONObjectWithData:data
                                                                                    options:0
                                                                                      error:nil];
                               
                               self.facts = [Facts factsFromJSON:factjsonArray];
                         
                           }];
    
    NSURL *photoUrl = [NSURL URLWithString:@"http://sheltered-coast-4961.herokuapp.com/photos.json"];
    NSURLRequest *photoUrlRequest = [NSURLRequest requestWithURL:photoUrl];
    [NSURLConnection sendAsynchronousRequest:photoUrlRequest
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               if (data == nil) {
                                   NSLog(@"Something is wrong");
                                   return;
                               }
                               NSArray *photojsonArray = [NSJSONSerialization JSONObjectWithData:data
                                                                                    options:0
                                                                                      error:nil];
                               
                               self.photos = [Photos photosFromJSON:photojsonArray];
                               
                           }];
}


- (IBAction)nextFactButton {
    int randomFact = arc4random_uniform(self.facts.count);
    int randomPhoto = arc4random_uniform(self.photos.count);
    Facts *fact = self.facts[randomFact];
    Photos *photo = self.photos[randomPhoto];
    self.FactLabel.text = fact.info;
    UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:photo.image]]];
    self.view.backgroundColor=[UIColor colorWithPatternImage: image];
    
    
}
@end
