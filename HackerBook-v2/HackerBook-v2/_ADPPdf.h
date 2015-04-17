// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADPPdf.h instead.

@import CoreData;
#import "ADPHackerBookBaseClass.h"

extern const struct ADPPdfAttributes {
	__unsafe_unretained NSString *pdfData;
} ADPPdfAttributes;

extern const struct ADPPdfRelationships {
	__unsafe_unretained NSString *book;
} ADPPdfRelationships;

@class ADPBook;

@interface ADPPdfID : NSManagedObjectID {}
@end

@interface _ADPPdf : ADPHackerBookBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ADPPdfID* objectID;

@property (nonatomic, strong) NSData* pdfData;

//- (BOOL)validatePdfData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ADPBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@end

@interface _ADPPdf (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePdfData;
- (void)setPrimitivePdfData:(NSData*)value;

- (ADPBook*)primitiveBook;
- (void)setPrimitiveBook:(ADPBook*)value;

@end
