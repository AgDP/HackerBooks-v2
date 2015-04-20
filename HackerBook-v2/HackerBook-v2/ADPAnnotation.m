#import "ADPAnnotation.h"
#import "ADPBook.h"
#import "ADPPhoto.h"

@interface ADPAnnotation ()

// Private interface goes here.

@end

@implementation ADPAnnotation

+(instancetype) annotationWithName:(NSString *) name
                              book:(ADPBook *) book
                           context:(NSManagedObjectContext *) context{
    
    ADPAnnotation *ann = [self insertInManagedObjectContext:context];
    
    ann.creationDate = [NSDate date];
    ann.name = name;
    
    ADPPhoto *photo = [ADPPhoto insertInManagedObjectContext:context];
    photo.photoData = [NSData new];
    photo.photoUrl = @"";
    
    ann.photo = photo;
    ann.modificationDate = [NSDate date];
    
    ann.book = book;
    
    
    
    return ann;
}


@end

