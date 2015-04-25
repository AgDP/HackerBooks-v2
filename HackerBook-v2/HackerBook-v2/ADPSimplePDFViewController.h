//
//  ADPSimplePDFViewController.h
//  HackerBook-v2
//
//  Created by Agustín on 20/04/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ADPBook;

@interface ADPSimplePDFViewController : UIViewController

@property(nonatomic, strong) ADPBook *model;
@property (weak, nonatomic) IBOutlet UIWebView *pdfView;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;
@property(nonatomic, strong) NSManagedObjectContext *context;

-(IBAction)displayAnnotations:(id)sender;

-(id)initWithModel:(ADPBook *) book andContext: (NSManagedObjectContext *) context;

@end
