#import "_ADPAuthor.h"

@interface ADPAuthor : _ADPAuthor {}


+(instancetype)  initWithName: (NSString *)name
                      context: (NSManagedObjectContext * ) context;

+(void) addAuthorWithNames: (NSString *) tags context: (NSManagedObjectContext *) context book: (ADPBook *) book;

@end
