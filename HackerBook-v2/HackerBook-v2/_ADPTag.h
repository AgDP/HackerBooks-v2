// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADPTag.h instead.

@import CoreData;
#import "ADPHackerBookBaseClass.h"

extern const struct ADPTagAttributes {
	__unsafe_unretained NSString *name;
} ADPTagAttributes;

extern const struct ADPTagRelationships {
	__unsafe_unretained NSString *books;
} ADPTagRelationships;

@class ADPBook;

@interface ADPTagID : NSManagedObjectID {}
@end

@interface _ADPTag : ADPHackerBookBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ADPTagID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *books;

- (NSMutableSet*)booksSet;

@end

@interface _ADPTag (BooksCoreDataGeneratedAccessors)
- (void)addBooks:(NSSet*)value_;
- (void)removeBooks:(NSSet*)value_;
- (void)addBooksObject:(ADPBook*)value_;
- (void)removeBooksObject:(ADPBook*)value_;

@end

@interface _ADPTag (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveBooks;
- (void)setPrimitiveBooks:(NSMutableSet*)value;

@end
