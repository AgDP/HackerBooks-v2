#import "_ADPTag.h"

@interface ADPTag : _ADPTag {}

+(void) addTagWithNames: (NSString *) tags context: (NSManagedObjectContext *) context book: (ADPBook *) book;

@end
