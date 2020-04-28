//
//  ViewController.m
//  MemoryManagement
//
//  Created by Paul Solt on 1/29/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import "Person.h"
#import "LSILog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (NSInteger index = 0; index < 10; index += 1) {
        NSMutableString *string = [[NSMutableString alloc] initWithString:@"Starting value"];
        
        [array addObject:string];
        
        [string release];
    }
    
    NSMutableString *firstString = [array objectAtIndex:0];
    [firstString retain];
    [array release];
    
    NSLog(@"%@", firstString);
    [firstString release];
    
//    CFArrayRef arrayRef = (CFArrayRef)array; // CFBridgingRetain(array) transferring ownership out of ARC into Core Foundation when using ARC
//    CFRelease(arrayRef);
    
    // Example with Core Foundation types like CGColor CG etc...
//    CFArrayRef cfArrayRef = CFArrayCreate(NULL, NULL, 0, NULL);
//    CFRelease(cfArrayRef);
    
    NSMutableString *make = [[NSMutableString alloc] initWithString:@"Honda Civic"];
    
    Person *person = [[Person alloc] init];
    Car *honda = [[Car alloc] initWithMake:make];
    person.car = honda;
    
    [honda release]; // gets rid of the car refernece since we passed to person
    
    [make replaceOccurrencesOfString:@"Civic" withString:@"Passport" options:0 range:NSMakeRange(0, make.length)];
    
    person.car = honda;
    NSLog(@"%@", honda);
    [person release];
    
    [make release];
    
}



@end
