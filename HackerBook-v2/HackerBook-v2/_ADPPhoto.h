// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADPPhoto.h instead.

@import CoreData;
#import "ADPHackerBookBaseClass.h"

extern const struct ADPPhotoAttributes {
	__unsafe_unretained NSString *photoData;
	__unsafe_unretained NSString *photoUrl;
} ADPPhotoAttributes;

extern const struct ADPPhotoRelationships {
	__unsafe_unretained NSString *annotation;
	__unsafe_unretained NSString *book;
} ADPPhotoRelationships;

@class ADPAnnotation;
@class ADPBook;

@interface ADPPhotoID : NSManagedObjectID {}
@end

@interface _ADPPhoto : ADPHackerBookBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ADPPhotoID* objectID;

@property (nonatomic, strong) NSData* photoData;

//- (BOOL)validatePhotoData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* photoUrl;

//- (BOOL)validatePhotoUrl:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ADPAnnotation *annotation;

//- (BOOL)validateAnnotation:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ADPBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@end

@interface _ADPPhoto (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhotoData;
- (void)setPrimitivePhotoData:(NSData*)value;

- (NSString*)primitivePhotoUrl;
- (void)setPrimitivePhotoUrl:(NSString*)value;

- (ADPAnnotation*)primitiveAnnotation;
- (void)setPrimitiveAnnotation:(ADPAnnotation*)value;

- (ADPBook*)primitiveBook;
- (void)setPrimitiveBook:(ADPBook*)value;

@end
