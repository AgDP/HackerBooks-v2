// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADPAuthor.h instead.

@import CoreData;

extern const struct ADPAuthorAttributes {
	__unsafe_unretained NSString *name;
} ADPAuthorAttributes;

extern const struct ADPAuthorRelationships {
	__unsafe_unretained NSString *books;
} ADPAuthorRelationships;

@class ADPBook;

@interface ADPAuthorID : NSManagedObjectID {}
@end

@interface _ADPAuthor : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ADPAuthorID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *books;

- (NSMutableSet*)booksSet;

@end

@interface _ADPAuthor (BooksCoreDataGeneratedAccessors)
- (void)addBooks:(NSSet*)value_;
- (void)removeBooks:(NSSet*)value_;
- (void)addBooksObject:(ADPBook*)value_;
- (void)removeBooksObject:(ADPBook*)value_;

@end

@interface _ADPAuthor (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveBooks;
- (void)setPrimitiveBooks:(NSMutableSet*)value;

@end
