#import "ADPPdf.h"
@import UIKit;
#import "ADPBook.h"

@interface ADPPdf ()

// Private interface goes here.

@end

@implementation ADPPdf

+(void) addPdfWithName: (NSString *) titulo andURL: (NSString *) urlPdf context: (NSManagedObjectContext *) context book: (ADPBook *) book{
    
    UIImage* image = [UIImage imageNamed:@"emptyBookCover.png"];
    
    ADPPdf *pdf = [NSEntityDescription insertNewObjectForEntityForName:@"PDF"
                                                        inManagedObjectContext:context];
        
    pdf.pdfData = UIImageJPEGRepresentation(image, 0.9);
    pdf.pdfUrl = urlPdf;
        
    book.pdf = pdf;
        
}


+(void) setNewImageWithData:(NSData *) data intoPdf:(ADPPdf *) pdf andNSManagedObjectContext: (NSManagedObjectContext *) context{
    
    
    
    // Guardo la imagen en  (con el nombre que tenia en la url
    // original.
    //NSURL *localURL = [self localURLForRemoteURL:self.remoteImageURL];
    //[data writeToURL:localURL atomically:YES];
    
    // Asigno como nueva imagen (esto envía notificación de KVO)
    //photo.image = [UIImage imageWithData:data];
    pdf.pdfData = data;
    
    NSError *error;
    [context save:&error];
    
    //[self setupNotifications];
    [self savePdfIntoDcouments:pdf];
}

+(void) savePdfIntoDcouments: (ADPPdf *) pdf{
    
    
    //Guardamos la imagen con el nombre del libro + jpg
    NSMutableString *nombrePdf = [[NSMutableString alloc] init];
    [nombrePdf appendString:@"Documents/HackerBook/Data/"];
    [nombrePdf appendString:pdf.book.title];
    [nombrePdf appendString:@".pdf"];
    
    //Averiguar la URL a la carpeta Documents
    NSString  *jpgPath = [NSHomeDirectory() stringByAppendingPathComponent:nombrePdf];
    
    
    
    [pdf.pdfData writeToFile:jpgPath atomically:YES];
    
}

@end
