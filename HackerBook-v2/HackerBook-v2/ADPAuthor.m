#import "ADPAuthor.h"

@interface ADPAuthor ()

// Private interface goes here.

@end

@implementation ADPAuthor

+(instancetype)  initWithName: (NSString *)name
                      context: (NSManagedObjectContext * ) context{
    
    
    ADPAuthor *author = [ADPAuthor insertInManagedObjectContext:context];
    author.name = name;
    
    return author;
    
}


@end
