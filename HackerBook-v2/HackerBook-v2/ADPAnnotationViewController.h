//
//  ADPAnnotationViewController.h
//  HackerBook-v2
//
//  Created by Agustín on 20/04/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ADPAnnotation;

@interface ADPAnnotationViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *titleAnnotation;
@property (weak, nonatomic) IBOutlet UILabel *creationDateView;
@property (weak, nonatomic) IBOutlet UILabel *modificationDateView;
@property (nonatomic, strong) ADPAnnotation *model;

-(id) initWithModel:(ADPAnnotation *) model;



- (IBAction)displayPhoto:(id)sender;
- (IBAction)displayShare:(id)sender;

@end