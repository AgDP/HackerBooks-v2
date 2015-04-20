//
//  ADPAnnotationsViewController.h
//  HackerBook-v2
//
//  Created by Agustín on 20/04/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import "AGTCoreDataTableViewController.h"
@class ADPBook;

@interface ADPAnnotationsViewController : AGTCoreDataTableViewController

-(id) initWithFetchedResultsController:(NSFetchedResultsController *)aFetchedResultsController
                                 style:(UITableViewStyle)aStyle
                                  book:(ADPBook *) book;
@property(nonatomic, strong) ADPBook *model;


@end
