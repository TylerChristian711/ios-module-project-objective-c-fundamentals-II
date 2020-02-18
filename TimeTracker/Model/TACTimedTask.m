//
//  TACTimedTask.m
//  TimeTracker
//
//  Created by Lambda_School_Loaner_218 on 2/18/20.
//  Copyright © 2020 Tyler Christian. All rights reserved.
//

#import "TACTimedTask.h"

@implementation TACTimedTask

- (instancetype) initWithClient:(NSString *)client
                        summary:(NSString *)summary
                     hourlyRate:(double)hourlyRate
                     hoursWorked:(int)hoursWorked {
           self = [super init];
    if (self) {
        _client = client;
        _summary = summary;
        _hourlyRate = hourlyRate;
        _hoursWorked = hoursWorked;
    }
    return self;
}

- (double)total {
    return self.hourlyRate * self.hoursWorked;
}

@end
