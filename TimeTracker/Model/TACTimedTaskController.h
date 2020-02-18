//
//  TACTimedTaskController.h
//  TimeTracker
//
//  Created by Lambda_School_Loaner_218 on 2/18/20.
//  Copyright © 2020 Tyler Christian. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TACTimedTask;

NS_ASSUME_NONNULL_BEGIN

@interface TACTimedTaskController : NSObject

@property (nonatomic, readonly) NSMutableArray<TACTimedTask *> *TimedTask;

-(void) createTimedTaskWithClient:(NSString *)client
                          summary:(NSString *)summary
                       hourlyRate:(double)hourlyRate
                      hoursWorked:(int)hoursWorked;

@end

NS_ASSUME_NONNULL_END
