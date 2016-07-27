//
//  ViewController.m
//  08 SimpleTable
//
//  Created by tomandhua on 16/6/15.
//  Copyright © 2016年 tomandhua. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray * dwarves;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dwarves = @[@"Sleepy", @"Sneezy", @"Bashful", @"Happy", @"Doc", @"Grumpy", @"Dopey", @"Thorin", @"Dorin", @"Nori", @"Ori", @"Bali", @"Dwali", @"Fili", @"Kili", @"Ori", @"Groin", @"Bifur", @"Bofur", @"Bobur"];
    
    UITableView *tableView = (id)[self.view viewWithTag:1];
    UIEdgeInsets contentInset = tableView.contentInset;
    contentInset.top = 20;
    [tableView setContentInset:contentInset];
    
}

#pragma mark -
#pragma mark Table View Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dwarves count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * SimpleTableIdentifier = @"SimpleTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:SimpleTableIdentifier];
    }
    UIImage * image = [UIImage imageNamed:@"star_gray"];
    cell.imageView.image = image;
    
    UIImage * hightLightImage = [UIImage imageNamed:@"grade_icon"];
    cell.imageView.highlightedImage = hightLightImage;
    
    cell.textLabel.text = self.dwarves[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:50];
    
    if (indexPath.row < 7) {
        cell.detailTextLabel.text = @"Mr. Disney";
    } else {
        cell.detailTextLabel.text = @"Mr.Yang";
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return indexPath.row;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return nil;
    } else {
        return indexPath;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * rowValue = self.dwarves[indexPath.row];
    
    NSString * message = [NSString stringWithFormat:@"You selected %@", rowValue];
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Row Selected" message:message delegate:nil cancelButtonTitle:@"Yes, I did" otherButtonTitles:nil, nil];
    
    [alert show];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
