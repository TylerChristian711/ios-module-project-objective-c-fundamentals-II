//
//  TACTimeTrackerViewController.m
//  TimeTracker
//
//  Created by Lambda_School_Loaner_218 on 2/18/20.
//  Copyright © 2020 Tyler Christian. All rights reserved.
//

#import "TACTimeTrackerViewController.h"
#import "TACTimedTaskController.h"
#import "TACTimedTask.h"

@interface TACTimeTrackerViewController ()

// -------- --------- --------
//MARK: PROPERTIES
@property (nonatomic) NSString *client;
@property (nonatomic) NSString *summary;
@property (nonatomic) double hourlyRate;
@property (nonatomic) int hoursWorked;
@property (nonatomic) TACTimedTaskController *timedTaskController;
@property (nonatomic) BOOL isUpdating;
@property (nonatomic) TACTimedTask *task;

// -------- --------- --------
 //MARK: OUTLETS
@property (strong, nonatomic) IBOutlet UITextField *clientTextField;
@property (strong, nonatomic) IBOutlet UITextField *summaryTextField;
@property (strong, nonatomic) IBOutlet UITextField *hourlyRateTextField;
@property (strong, nonatomic) IBOutlet UITextField *timeWorkedTextField;
@property (strong, nonatomic) IBOutlet UITableView *tableView;



@end

@implementation TACTimeTrackerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.timedTaskController = [[TACTimedTaskController alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.isUpdating = NO;
}
- (IBAction)logTime:(UIButton *)sender {
    if (!self.isUpdating) {
        self.client = self.clientTextField.text;
        self.summary = self.summaryTextField.text;
        self.hourlyRate = [self.hourlyRateTextField.text doubleValue];
        self.hoursWorked = [self.timeWorkedTextField.text intValue];
        
        [self.timedTaskController createTimedTaskWithClient:self.client
                                                    summary:self.summary
                                                 hourlyRate:self.hourlyRate
                                                hoursWorked:self.hoursWorked];
        
        [self.tableView reloadData];
        [self clearTextFields];
    } else {
        self.client = self.clientTextField.text;
        self.summary = self.summaryTextField.text;
        self.hourlyRate = [self.hourlyRateTextField.text doubleValue];
        self.hoursWorked = [self.timeWorkedTextField.text intValue];
        
        [self.timedTaskController updateTask:self.task
                                  withClient:self.client
                                     summary:self.summary
                                  hourlyRate:self.hourlyRate
                                 hoursWorked:self.hoursWorked];
        
        [self.tableView reloadData];
        [self clearTextFields];
        self.isUpdating = NO;
    }
}

- (void) clearTextFields {
     self.clientTextField.text = @"";
     self.summaryTextField.text = @"";
     self.hourlyRateTextField.text = @"";
     self.timeWorkedTextField.text = @"";

}

-(void) updateViews {
    self.clientTextField.text = self.client;
    self.summaryTextField.text = self.summary;
    self.hourlyRateTextField.text = [NSString stringWithFormat:@"%0.2f",self.hourlyRate];
    self.timeWorkedTextField.text = [NSString stringWithFormat:@"%d",self.hoursWorked];
}



//MARK: TABELVIEW DATASOURCE

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.timedTaskController.TimedTask.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TaskCell" forIndexPath:indexPath];
    TACTimedTask *task = [self.timedTaskController.TimedTask objectAtIndex:indexPath.row];
    cell.textLabel.text = task.client;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"$%0.2f", task.total];
    return cell;
}

// MARK: TABLEVIEW DELEGATE
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TACTimedTask *task = [self.timedTaskController.TimedTask objectAtIndex:indexPath.row];
    self.task = task;
    self.client = task.client;
    self.summary = task.summary;
    self.hourlyRate = task.hourlyRate;
    self.hoursWorked = task.hoursWorked;
    [self updateViews];
    self.isUpdating = YES;
}


@end
