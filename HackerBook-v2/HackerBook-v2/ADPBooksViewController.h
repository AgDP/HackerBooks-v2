//
//  ADPBooksViewController.h
//  HackerBook-v2
//
//  Created by Agustín on 15/04/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADPLibraryViewController.h"
@class ADPBook;


@interface ADPBooksViewController : UIViewController <UISplitViewControllerDelegate, ADPLibraryViewControllerDelegate>

@property (strong, nonatomic) ADPBook *model;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *authors;
@property (weak, nonatomic) IBOutlet UILabel *tags;
@property (weak, nonatomic) IBOutlet UIButton *favorite;

-(IBAction)displayPdf:(id)sender;
-(IBAction)markFavorite:(id)sender;
-(IBAction)displayAnnotation:(id)sender;

-(id) initWithModel:(ADPBook *) model;

@end
