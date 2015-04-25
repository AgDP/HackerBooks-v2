#import "_ADPPdf.h"

@interface ADPPdf : _ADPPdf {}


+(void) addPdfWithName: (NSString *) titulo andURL: (NSString *) urlPdf context: (NSManagedObjectContext *) context book: (ADPBook *) book;
+(void) setNewImageWithData:(NSData *) data intoPdf:(ADPPdf *) pdf andNSManagedObjectContext: (NSManagedObjectContext *) context;

@end
