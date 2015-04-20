#import "ADPBook.h"
#import "ADPAuthor.h"
#import "ADPTag.h"
#import "ADPPhoto.h"
#import "ADPPdf.h"

@interface ADPBook ()

@end

@implementation ADPBook

+(instancetype)  initWithTitulo: (NSString *)titulo
                     isFavorite: (BOOL) isFavorite
                         author: (NSString *) authors
                           tags: (NSString *) tags
                            pdf: (NSString *) urlPDF
                       urlPhoto: (NSString *) urlPhoto
                        context: (NSManagedObjectContext * ) context{
    
    ADPBook *book = [self insertInManagedObjectContext:context];
    book.title = titulo;
    [book setIsFavoriteValue:isFavorite];
    
    [ADPAuthor addAuthorWithNames:authors context:context book:book];

    [ADPTag addTagWithNames:tags context:context book:book];
    
    [ADPPhoto addPhotoWithName: titulo andURL: urlPhoto context:context book:book];
    
#warning Provisional
    ADPPdf *pdf = [NSEntityDescription insertNewObjectForEntityForName:@"PDF"
                                                inManagedObjectContext:context];
    pdf.pdfData = [NSData new];
    pdf.pdfUrl = urlPDF;
    
    book.pdf = pdf;

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

-(NSString *) tagsWithNameAndSeparate{
    
    NSSet *tags = self.tags;
    NSMutableString *tagsString = [[NSMutableString alloc] init];
    
    for (ADPTag *tag in tags) {
        [tagsString appendString:tag.name];
        [tagsString appendString:@", "];
    }
#warning Cambiar para que no salga la coma siempre detras del último
    
    return tagsString;
    
}




















@end
