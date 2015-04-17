// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADPAnnotation.h instead.

@import CoreData;
#import "ADPHackerBookBaseClass.h"

extern const struct ADPAnnotationAttributes {
	__unsafe_unretained NSString *creationDate;
	__unsafe_unretained NSString *modificationDate;
	__unsafe_unretained NSString *text;
} ADPAnnotationAttributes;

extern const struct ADPAnnotationRelationships {
	__unsafe_unretained NSString *book;
	__unsafe_unretained NSString *localization;
	__unsafe_unretained NSString *photo;
} ADPAnnotationRelationships;

@class ADPBook;
@class ADPLocalization;
@class ADPPhoto;

@interface ADPAnnotationID : NSManagedObjectID {}
@end

@interface _ADPAnnotation : ADPHackerBookBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ADPAnnotationID* objectID;

@property (nonatomic, strong) NSDate* creationDate;

//- (BOOL)validateCreationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* modificationDate;

//- (BOOL)validateModificationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ADPBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ADPLocalization *localization;

//- (BOOL)validateLocalization:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ADPPhoto *photo;

//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;

@end

@interface _ADPAnnotation (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCreationDate;
- (void)setPrimitiveCreationDate:(NSDate*)value;

- (NSDate*)primitiveModificationDate;
- (void)setPrimitiveModificationDate:(NSDate*)value;

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (ADPBook*)primitiveBook;
- (void)setPrimitiveBook:(ADPBook*)value;

- (ADPLocalization*)primitiveLocalization;
- (void)setPrimitiveLocalization:(ADPLocalization*)value;

- (ADPPhoto*)primitivePhoto;
- (void)setPrimitivePhoto:(ADPPhoto*)value;

@end
