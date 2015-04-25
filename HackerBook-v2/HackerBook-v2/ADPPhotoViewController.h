//
//  ADPPhotoViewController.h
//  HackerBook-v2
//
//  Created by Agustín on 25/04/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ADPPhoto;
@class ADPAnnotation;

@interface ADPPhotoViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *photoView;

- (IBAction)takePicture:(id)sender;
- (IBAction)deletePhoto:(id)sender;

@property(nonatomic, strong) ADPPhoto *model;
@property(nonatomic, strong) ADPAnnotation *annotation;
@property(nonatomic, strong) NSManagedObjectContext *context;

-(id) initWithModel:(ADPPhoto *) model andAnnotation: (ADPAnnotation *) annotation andContext: (NSManagedObjectContext *) context;

@end
