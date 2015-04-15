#import "_ADPBook.h"

@interface ADPBook : _ADPBook {}


//Designated
+(instancetype)  initWithTitulo: (NSString *)titulo
                     isFavorite: (BOOL) isFavorite
                         author: (NSString *) authors
                        context: (NSManagedObjectContext * ) context;

-(NSString *) authorsWithNameAndSeparate;

@end