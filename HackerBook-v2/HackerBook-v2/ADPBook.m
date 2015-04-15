#import "ADPBook.h"
#import "ADPAuthor.h"

@interface ADPBook ()

@end

@implementation ADPBook


+(instancetype)  initWithTitulo: (NSString *)titulo
                     isFavorite: (BOOL) isFavorite
                         author: (NSString *) authors
                        context: (NSManagedObjectContext * ) context{
    
    ADPBook *book = [self insertInManagedObjectContext:context];
    book.title = titulo;
    [book setIsFavoriteValue:isFavorite];
    

    NSMutableSet *bookSet = [[NSMutableSet alloc] init];
    
    NSArray *bookAuthors = [authors componentsSeparatedByString:@","];
    
    for (NSString *name in bookAuthors) {
        ADPAuthor *author = [NSEntityDescription insertNewObjectForEntityForName:@"Author"
                                                          inManagedObjectContext:context];
        author.name = name;
        [bookSet addObject:author];
        book.authors = bookSet;
    }
    
    NSLog(@"Book: %@", book);
    
    return book;
}

-(NSString *) authorsWithNameAndSeparate{
    
    NSSet *authors = self.authors;
    NSMutableString *authorsString = [[NSMutableString alloc] init];
    
    for (ADPAuthor *author in authors) {
        [authorsString appendString:author.name];
        [authorsString appendString:@", "];
    }
#warning Cambiar para que no salga la coma siempre detras del último
    
    return authorsString;
}

@end
