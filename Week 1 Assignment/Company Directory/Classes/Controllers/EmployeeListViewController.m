//
//  EmployeeListViewController.m
//  Company Directory
//
//  Created by Mattt Thompson on 11/12/05.
//  Copyright (c) 2011年 CabForward. All rights reserved.
//

#import "EmployeeListViewController.h"

#import "EmployeeViewController.h"

#import "Employee.h"

@implementation EmployeeListViewController

@synthesize employees = _employees;

- (void)dealloc {
    // @todo Release instance variables from properties
    [super dealloc];
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.employees = [Employee sampleListOfEmployees];
    self.title = NSLocalizedString(@"Company Directory", nil);
    [self.tableView reloadData];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.employees count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
  

    Employee *employee = [self.employees objectAtIndex:indexPath.row];
    cell.textLabel.text = employee.name;
    cell.detailTextLabel.text = employee.jobTitle;
      
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  Employee *employee = [self.employees objectAtIndex:indexPath.row];
  EmployeeViewController *viewController = [[[EmployeeViewController alloc] initWithEmployee:employee] autorelease];
  
  NSLog(@"tracer =========");
  NSLog(@" %@", viewController);

  [self.navigationController pushViewController:viewController animated:YES];
}

@end
