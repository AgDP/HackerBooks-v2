#import "_ADPAnnotation.h"
@class ADPBook;

@interface ADPAnnotation : _ADPAnnotation {}

+(instancetype) annotationWithName:(NSString *) name
                              book:(ADPBook *) book
                           context:(NSManagedObjectContext *) context;

@end
