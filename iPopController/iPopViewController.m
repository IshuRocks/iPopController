//
//  iPopViewController.m
//  iPopController
//
//  Created by homebethe e-commerce private limited on 10/14/17.
//  Copyright © 2017 homebethe e-commerce private limited. All rights reserved.
//

#import "iPopViewController.h"

@interface iPopViewController ()<UIPopoverPresentationControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *poptableView;

@end

@implementation iPopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.frame = CGRectMake(0, 0, 170, (self.itemsArray.count*44));
    self.preferredContentSize = CGSizeMake(170, (self.itemsArray.count*44));
    self.popoverPresentationController.sourceView = self.sourceView;
    self.poptableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.poptableView.delegate = self;
    self.poptableView.dataSource = self;
    self.poptableView.scrollEnabled = NO;
    self.poptableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.poptableView];
    
    if (self.backgroundImage != nil && self.backgroundColor == nil)
    {
        UIImageView *tempImageView = [[UIImageView alloc] initWithImage:self.backgroundImage];
        [tempImageView setFrame:self.poptableView.frame];
        self.poptableView.backgroundView = tempImageView;
        self.poptableView.backgroundColor = [UIColor clearColor];
    } else if (self.backgroundImage != nil && self.backgroundColor != nil)
    {
        UIImageView *tempImageView = [[UIImageView alloc] initWithImage:self.backgroundImage];
        [tempImageView setFrame:self.poptableView.frame];
        self.poptableView.backgroundView = tempImageView;
        self.poptableView.backgroundColor = [UIColor clearColor];
    } else if (self.backgroundImage == nil && self.backgroundColor != nil) {
        self.poptableView.backgroundColor = [UIColor clearColor];
    } else {
        
        self.poptableView.backgroundColor = [UIColor whiteColor];
    }
    
    self.popoverPresentationController.sourceRect = CGRectMake(0, 0, 170, 30);
    self.popoverPresentationController.permittedArrowDirections = self.Directions;
    self.popoverPresentationController.backgroundColor = [UIColor whiteColor];
    
    if (self.arrowColor != nil) {
        self.popoverPresentationController.backgroundColor = self.arrowColor;
    }
    [self.poptableView reloadData];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.poptableView reloadData];
}

- (id)init {
    if (self == [super initWithNibName:nil bundle:nil]) {
        self.modalPresentationStyle = UIModalPresentationPopover;
        self.popoverPresentationController.delegate = self;
    }
    return self;
}

-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationNone;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"popupCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"popupCell"];
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.text = self.itemsArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.popCellBlock != nil)
    {
        self.popCellBlock(self, cell, indexPath.row, indexPath.section);
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.textColor = [UIColor whiteColor];
    
    if (self.itemTitleColor != nil)
    {
        cell.textLabel.textColor = self.itemTitleColor;
    }
    
    if (self.backgroundImage == nil && self.backgroundColor == nil)
    {
        cell.textLabel.textColor = [UIColor blackColor];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    
    UIView * additionalSeparator = [[UIView alloc] initWithFrame:CGRectMake(0,cell.frame.size.height,cell.frame.size.width,1)];
    additionalSeparator.backgroundColor = [UIColor lightGrayColor];
    [cell addSubview:additionalSeparator];
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor clearColor];
    if (self.itemSelectionColor != nil)
    {
        bgColorView.backgroundColor = self.itemSelectionColor;
    }
    
    [cell setSelectedBackgroundView:bgColorView];
    cell.textLabel.alpha = 1.0;
    
}


@end
