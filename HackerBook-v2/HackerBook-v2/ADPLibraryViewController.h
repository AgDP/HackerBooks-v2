//
//  ADPBooksViewController.h
//  HackerBook-v2
//
//  Created by Agustín on 15/04/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import "AGTCoreDataTableViewController.h"
@class ADPBook;
@class ADPLibraryViewController;

@protocol ADPLibraryViewControllerDelegate <NSObject>

@optional
-(void) libraryTableViewController: (ADPLibraryViewController *)library didSelectedBook:(ADPBook *) book;

@end

@interface ADPLibraryViewController : AGTCoreDataTableViewController

@property (weak, nonatomic) id<ADPLibraryViewControllerDelegate> delegate;
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) NSMutableArray *searchResults;

@end
