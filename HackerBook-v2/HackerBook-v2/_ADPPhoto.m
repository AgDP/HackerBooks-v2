// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADPPhoto.m instead.

#import "_ADPPhoto.h"

const struct ADPPhotoAttributes ADPPhotoAttributes = {
	.photoData = @"photoData",
	.photoUrl = @"photoUrl",
};

const struct ADPPhotoRelationships ADPPhotoRelationships = {
	.annotation = @"annotation",
	.book = @"book",
};

@implementation ADPPhotoID
@end

@implementation _ADPPhoto

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Photo";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Photo" inManagedObjectContext:moc_];
}

- (ADPPhotoID*)objectID {
	return (ADPPhotoID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic photoData;

@dynamic photoUrl;

@dynamic annotation;

@dynamic book;

@end

