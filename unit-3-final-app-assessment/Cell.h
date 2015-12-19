//
//  Cell.h
//  unit-3-final-app-assessment
//
//  Created by Chris David on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *factLabel;
@property (nonatomic) NSString *catFact;
@end
