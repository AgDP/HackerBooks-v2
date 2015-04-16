#import "ADPAuthor.h"
#import "ADPBook.h"

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

+(void) addAuthorWithNames: (NSString *) authors context: (NSManagedObjectContext *) context book: (ADPBook *) book{
    
    
    
    

    
        NSMutableSet *bookSet = [[NSMutableSet alloc] init];
        
        NSArray *bookAuthors = [authors componentsSeparatedByString:@", "];
        
        for (NSString *name in bookAuthors) {
            
            //Lo busco
            NSFetchRequest *fetch = [NSFetchRequest fetchRequestWithEntityName:@"Author"];
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@", name];
            [fetch setPredicate:predicate];
            NSError *error;
            NSArray *results = [context executeFetchRequest:fetch error:&error];
            
            //NSLog(@"OBJ: %@", results);
            
            if (results.count != 0 ) {
        
                
                [book addAuthorsObject:[results lastObject]];
                
            }else{
                ADPAuthor *author = [NSEntityDescription insertNewObjectForEntityForName:@"Author"
                                                                  inManagedObjectContext:context];
                
                [book addAuthorsObject:author];
                author.name = name;
                [bookSet addObject:author];
                book.authors = bookSet;
            }
        }
            
    
    
    
    
    
    
}

@end
