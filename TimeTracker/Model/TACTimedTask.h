//
//  TACTimedTask.h
//  TimeTracker
//
//  Created by Lambda_School_Loaner_218 on 2/18/20.
//  Copyright © 2020 Tyler Christian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TACTimedTask : NSObject

@property (nonatomic, readwrite, copy) NSString *client;
@property (nonatomic, readwrite, copy) NSString *summary;
@property (nonatomic, readwrite) double hourlyRate;
@property (nonatomic, readwrite) int hoursWorked;
@property (nonatomic, readonly) double total;

- (instancetype)initWithClient:(NSString *)client
                       summary:(NSString *)summary
                    hourlyRate: (double)hourlyRate
                    hoursWorked: (int)hoursWorked;



@end

NS_ASSUME_NONNULL_END
