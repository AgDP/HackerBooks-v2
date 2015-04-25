#import "ADPPhoto.h"
@import UIKit;
#import "ADPBook.h"
#import "ADPAnnotation.h"

@interface ADPPhoto ()

// Private interface goes here.

@end

@implementation ADPPhoto

+(void) addPhotoWithName: (NSString *) titulo andURL: (NSString *) urlPhoto context: (NSManagedObjectContext *) context book: (ADPBook *) book{
    
    
    NSMutableString *nombreLibro = [[NSMutableString alloc] init];
    [nombreLibro appendString:@"Documents/HackerBook/Pictures/"];
    [nombreLibro appendString:titulo];
    [nombreLibro appendString:@".jpg"];
    
    //Averiguar la URL a la carpeta Documents
    NSString  *jpgPath = [NSHomeDirectory() stringByAppendingPathComponent:nombreLibro];
    UIImage* image = [UIImage imageWithContentsOfFile:jpgPath];
    
    ADPPhoto *photo = [NSEntityDescription insertNewObjectForEntityForName:@"Photo"
                                                inManagedObjectContext:context];
    
    photo.photoData = UIImageJPEGRepresentation(image, 0.9);
    photo.photoUrl = urlPhoto;
    
    book.photo = photo;
}

-(void) setImage:(UIImage *)image{
    
    // Convertir la UIImage en un NSData
    self.photoData = UIImageJPEGRepresentation(image, 0.9);
}

-(UIImage *) image{
    
    // Convertir la NSData en UIImage
    return [UIImage imageWithData:self.photoData];
}

-(void) saveImage: (UIImage *)image inAnnotation: (ADPAnnotation *) annotation andContext: (NSManagedObjectContext *) context{
    
    ADPPhoto *photo = [NSEntityDescription insertNewObjectForEntityForName:@"Photo"
                                                    inManagedObjectContext:context];
    photo.image = image;
    photo.annotation = annotation;
    photo.photoData = UIImageJPEGRepresentation(image, 0.9);
    
    NSError * error;
    
    BOOL save = [context save:&error];
    
    // Convertir la UIImage en un NSData
    self.photoData = UIImageJPEGRepresentation(photo.image, 0.9);
}

@end
