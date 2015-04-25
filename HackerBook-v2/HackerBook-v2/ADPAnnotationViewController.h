//
//  ADPAnnotationViewController.h
//  HackerBook-v2
//
//  Created by Agustín on 20/04/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ADPAnnotation;

@interface ADPAnnotationViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *titleAnnotation;
@property (weak, nonatomic) IBOutlet UILabel *creationDateView;
@property (weak, nonatomic) IBOutlet UILabel *modificationDateView;
@property (nonatomic, strong) ADPAnnotation *model;
@property(nonatomic, strong) NSManagedObjectContext *context;

-(id) initWithModel:(ADPAnnotation *) model andContext: (NSManagedObjectContext *) context;



- (IBAction)displayPhoto:(id)sender;
- (IBAction)displayShare:(id)sender;
- (IBAction)displayRemove:(id)sender;

@end
