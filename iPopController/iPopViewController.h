//
//  iPopViewController.h
//  iPopController
//
//  Created by homebethe e-commerce private limited on 10/14/17.
//  Copyright © 2017 homebethe e-commerce private limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iPopViewController : UIViewController

// popover source view
@property (nonatomic, strong) UIView *sourceView;

// menu items array
@property (nonatomic, strong) NSArray *itemsArray;

// set background image
@property (nonatomic, strong) UIImage *backgroundImage;

// set to clear if you set the backgroundImage
@property (nonatomic, strong) UIColor *backgroundColor;

// item title color
@property (nonatomic, strong) UIColor *itemTitleColor;

// item selection background
@property (nonatomic, strong) UIColor *itemSelectionColor;

// popover arrow direction
@property (nonatomic, assign) UIPopoverArrowDirection Directions;

// popover arrow color
@property (nonatomic, strong) UIColor *arrowColor;

// item cell tapped block
@property (nonatomic, copy) void (^popCellBlock)(iPopViewController * popupVC, UITableViewCell *popCell, NSInteger row, NSInteger section);

@end
