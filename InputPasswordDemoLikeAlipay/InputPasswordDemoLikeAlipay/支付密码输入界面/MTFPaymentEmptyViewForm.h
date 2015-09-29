//
//  MTFPaymentEmptyViewForm.h
//  demo
//
//  Created by TengfeiMa on 15/9/28.
//  Copyright (c) 2015年 shaw. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SetupPaymentPasswordDelegate <NSObject>

/**
 *  输入完成回调
 *
 *  @param newPassword 新密码
 */
-(void)setupPaymentPasswordComplete:(NSString *)newPassword;
@end
@interface MTFPaymentEmptyViewForm : UIView

-(void)show;
-(void)dismiss;
@property (nonatomic,weak)id<SetupPaymentPasswordDelegate> delegate;
@end
