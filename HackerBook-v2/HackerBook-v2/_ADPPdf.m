// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADPPdf.m instead.

#import "_ADPPdf.h"

const struct ADPPdfAttributes ADPPdfAttributes = {
	.pdfData = @"pdfData",
	.pdfUrl = @"pdfUrl",
};

const struct ADPPdfRelationships ADPPdfRelationships = {
	.book = @"book",
};

@implementation ADPPdfID
@end

@implementation _ADPPdf

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PDF" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PDF";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PDF" inManagedObjectContext:moc_];
}

- (ADPPdfID*)objectID {
	return (ADPPdfID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic pdfData;

@dynamic pdfUrl;

@dynamic book;

@end

