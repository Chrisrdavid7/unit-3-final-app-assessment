//
//  C4QColorPickerViewControllerDelegate.h
//  unit-3-final-app-assessment
//
//  Created by Chris David on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "C4QColorPickerViewController.h"

@class C4QColorPickerViewController;

@protocol C4QColorPickerViewControllerDelegate <NSObject>

- (void)colorPickerViewController:(C4QColorPickerViewController *)vc didPickColorButton:(UIButton *)colorButton;

@end



