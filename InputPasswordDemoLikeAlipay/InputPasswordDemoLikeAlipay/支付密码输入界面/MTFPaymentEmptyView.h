//
//  MTFPaymentEmptyView.h
//  demo
//
//  Created by TengfeiMa on 15/9/28.
//  Copyright (c) 2015年 shaw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZSDSetPasswordView.h"
@interface MTFPaymentEmptyView : UIView <ZSDSetPasswordViewDelegate>
@property (weak, nonatomic) IBOutlet ZSDSetPasswordView *firstInput;

@property (weak, nonatomic) IBOutlet ZSDSetPasswordView *confirmInput;
- (IBAction)cancel:(id)sender;

- (IBAction)confirm:(id)sender;
-(CGSize)viewSize;
-(void)fieldBecomeFirstResponder;


@property (nonatomic,copy) void (^completeHandle)(NSString *inputPwd);
@end
