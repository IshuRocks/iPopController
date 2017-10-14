//
//  ViewController.m
//  iPopController
//
//  Created by homebethe e-commerce private limited on 10/14/17.
//  Copyright © 2017 homebethe e-commerce private limited. All rights reserved.
//

#import "ViewController.h"
#import "iPopViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)openPopup:(UIButton*)sender
{
    NSArray * itemArray = [[NSArray alloc]initWithObjects:@"Apple",@"Banana",@"Mango",@"Tomato",@"Potato", nil];
    
    iPopViewController *ipopup = [[iPopViewController alloc] init];
    ipopup.itemsArray = itemArray;
    ipopup.sourceView = sender;
    ipopup.backgroundColor = [UIColor whiteColor];
    ipopup.backgroundImage = nil;
    ipopup.itemTitleColor = [UIColor blackColor];
    ipopup.itemSelectionColor = [UIColor lightGrayColor];
    ipopup.Directions = UIPopoverArrowDirectionAny;
    ipopup.arrowColor = [UIColor whiteColor];
    [ipopup setPopCellBlock:^(iPopViewController *ipop, UITableViewCell *popupCell, NSInteger row, NSInteger section)
     {
         self.lblPrint.text = [itemArray objectAtIndex:row];
         
         [ipop dismissViewControllerAnimated:YES completion:^{
             
         }];
         
     }];
    [self presentViewController:ipopup animated:YES completion:^{
        
        //[_tbl_Product reloadData];
        
    }];
}


@end
