// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADPLocalization.m instead.

#import "_ADPLocalization.h"

const struct ADPLocalizationAttributes ADPLocalizationAttributes = {
	.direction = @"direction",
	.latitude = @"latitude",
	.longitude = @"longitude",
};

const struct ADPLocalizationRelationships ADPLocalizationRelationships = {
	.annotation = @"annotation",
};

@implementation ADPLocalizationID
@end

@implementation _ADPLocalization

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Localization" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Localization";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Localization" inManagedObjectContext:moc_];
}

- (ADPLocalizationID*)objectID {
	return (ADPLocalizationID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic direction;

@dynamic latitude;

@dynamic longitude;

@dynamic annotation;

@end

