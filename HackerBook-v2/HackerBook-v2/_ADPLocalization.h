// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADPLocalization.h instead.

@import CoreData;

extern const struct ADPLocalizationAttributes {
	__unsafe_unretained NSString *direction;
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *longitude;
} ADPLocalizationAttributes;

extern const struct ADPLocalizationRelationships {
	__unsafe_unretained NSString *annotation;
} ADPLocalizationRelationships;

@class ADPAnnotation;

@interface ADPLocalizationID : NSManagedObjectID {}
@end

@interface _ADPLocalization : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ADPLocalizationID* objectID;

@property (nonatomic, strong) NSString* direction;

//- (BOOL)validateDirection:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* latitude;

//- (BOOL)validateLatitude:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* longitude;

//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ADPAnnotation *annotation;

//- (BOOL)validateAnnotation:(id*)value_ error:(NSError**)error_;

@end

@interface _ADPLocalization (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveDirection;
- (void)setPrimitiveDirection:(NSString*)value;

- (NSString*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSString*)value;

- (NSString*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSString*)value;

- (ADPAnnotation*)primitiveAnnotation;
- (void)setPrimitiveAnnotation:(ADPAnnotation*)value;

@end
