#import "ADPTag.h"
#import "ADPBook.h"

@interface ADPTag ()

// Private interface goes here.

@end

@implementation ADPTag

+(void) addTagWithNames: (NSString *) tags context: (NSManagedObjectContext *) context book: (ADPBook *) book{
    
    NSMutableSet *tagsSet = [[NSMutableSet alloc] init];
    
    NSArray *bookTags = [tags componentsSeparatedByString:@", "];
    
    for (NSString *tagName in bookTags) {
        
        //Lo busco
        NSFetchRequest *fetch = [NSFetchRequest fetchRequestWithEntityName:@"Tag"];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@", tagName];
        [fetch setPredicate:predicate];
        NSError *error;
        NSArray *results = [context executeFetchRequest:fetch error:&error];
        
        if (results.count != 0 ) {
            
            
            [book addTagsObject:[results lastObject]];
            
        }else{
            ADPTag *tag = [NSEntityDescription insertNewObjectForEntityForName:@"Tag"
                                                        inManagedObjectContext:context];
            tag.name = tagName;
            [tagsSet addObject:tag];
            book.tags = tagsSet;
            
        }
        
    }
    
}

-(NSInteger) numberOfObjects{
    
    return [[self.books allObjects] count];
}


@end
