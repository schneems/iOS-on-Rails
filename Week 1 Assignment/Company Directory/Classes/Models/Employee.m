//
//  Employee.m
//  Company Directory
//
//  Created by Mattt Thompson on 11/12/05.
//  Copyright (c) 2011年 CabForward. All rights reserved.
//

#import "Employee.h"


static NSDate * BirthdayWithMonthDayYear(NSUInteger month, NSUInteger day, NSUInteger year) {
  NSCalendar *gregorianCalendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
  
  NSDateComponents *birthdayComponents = [[[NSDateComponents alloc] init] autorelease];
  [birthdayComponents setMonth:month];
  [birthdayComponents setDay:day];
  [birthdayComponents setYear:year];
  
  return [gregorianCalendar dateFromComponents:birthdayComponents];
}


// `name`, `jobTitle`, `birthday`, and `salary`

@implementation Employee

@synthesize name     = _name;
@synthesize jobTitle = _jobTitle;
@synthesize birthday = _birthday;
@synthesize salary   = _salary;


// @todo Synthesize properties in interface

- (id)initWithName:(NSString *)name {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.name = name;
    self.salary = [[NSNumber alloc] initWithInt:70];
    self.jobTitle = @"Minion";
    self.birthday = BirthdayWithMonthDayYear(9, 30,1984);

    return self;
}

- (void)dealloc {
    // @todo Release instance variables from properties
    [super dealloc];
}

+ (NSArray *)sampleListOfEmployees {
    Employee *mattt = [[Employee alloc] initWithName:@"Mattt"];
    Employee *richard = [[Employee alloc] initWithName:@"Richard"];
    Employee *tim = [[Employee alloc] initWithName:@"Tim"];
    Employee *ruby = [[Employee alloc] initWithName:@"Ruby"];
    Employee *chris = [[Employee alloc] initWithName:@"Chris"];
    Employee *jeremy = [[Employee alloc] initWithName:@"Jeremy"];
    NSArray *array = [NSArray arrayWithObjects:mattt, richard, tim, ruby, chris, jeremy, nil];
    return array;
}

@end
