//
//  TACTimedTaskController.m
//  TimeTracker
//
//  Created by Lambda_School_Loaner_218 on 2/18/20.
//  Copyright © 2020 Tyler Christian. All rights reserved.
//

#import "TACTimedTaskController.h"
#import "TACTimedTask.h"

@implementation TACTimedTaskController

- (instancetype)init {
    self = [super init];
    if (self) {
        _TimedTask = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) createTimedTaskWithClient:(NSString *)client
                           summary:(NSString *)summary
                        hourlyRate:(double)hourlyRate
                        hoursWorked:(int)hoursWorked {
    
TACTimedTask *task = [[TACTimedTask alloc] initWithClient:client
                                                  summary:summary
                                               hourlyRate:hourlyRate
                                              hoursWorked:hoursWorked];
    
    [self.TimedTask addObject:task];
    
}

@end
