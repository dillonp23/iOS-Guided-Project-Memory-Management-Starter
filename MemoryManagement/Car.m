//
//  Car.m
//  iOS9-MemoryManagement
//
//  Created by Paul Solt on 11/13/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import "Car.h"
#import "LSILog.h"

@implementation Car

- (instancetype)initWithMake:(NSString *)make
{
    self = [super init];
    if (self) {
        NSLog(@"-[Car init]: %@", make);
        _make = [make copy];
    }
    return self;
}

// Implement autoreleased class car method
+ (instancetype)carWithMake:(NSString *)make;
{
    Car *car = [[self alloc] initWithMake:make];
    // AKA: Car * [[Car alloc]....
    return  [car autorelease];
}

+ (instancetype)car
{
    Car *car = [self carWithMake:@"Toyota"];
    return car;
}

- (void)dealloc
{
    NSLog(@"-[Car dealloc]: %@", self);
    // Implement dealloc with MRC
    [_make release];
    [super dealloc]; // Tells NSobject to replace with dummy object to crash
}

- (NSString *)description
{
    // Implement a standard autoreleasing method.
    NSString *description = [[NSString alloc] initWithFormat:@"Car: %@", self.make];
    return [description autorelease];
}

@end
