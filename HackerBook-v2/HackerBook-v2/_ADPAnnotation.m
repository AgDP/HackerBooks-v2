// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADPAnnotation.m instead.

#import "_ADPAnnotation.h"

const struct ADPAnnotationAttributes ADPAnnotationAttributes = {
	.creationDate = @"creationDate",
	.modificationDate = @"modificationDate",
	.text = @"text",
};

const struct ADPAnnotationRelationships ADPAnnotationRelationships = {
	.book = @"book",
	.localization = @"localization",
	.photo = @"photo",
};

@implementation ADPAnnotationID
@end

@implementation _ADPAnnotation

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Annotation" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Annotation";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Annotation" inManagedObjectContext:moc_];
}

- (ADPAnnotationID*)objectID {
	return (ADPAnnotationID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic creationDate;

@dynamic modificationDate;

@dynamic text;

@dynamic book;

@dynamic localization;

@dynamic photo;

@end

