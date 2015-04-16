#import "_ADPPhoto.h"
@import UIKit;
@class ADPBook;

@interface ADPPhoto : _ADPPhoto {}

+(void) addPhotoWithName: (NSString *) titulo andURL: (NSString *) urlPhoto context: (NSManagedObjectContext *) context book: (ADPBook *) book;
-(void) setImage:(UIImage *)image;
-(UIImage *) image;

@end
