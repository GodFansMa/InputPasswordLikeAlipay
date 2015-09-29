//
//  ZSDPaymentView.h
//  demo
//
//  Created by shaw on 15/4/11.
//  Copyright (c) 2015年 shaw. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol InputPayPasswordDelegate <NSObject>

/**
 *  密码输入完成回调
 *
 *  @param password 密码
 */
-(void)passwordInputCompleted:(NSString *)password;
@end


@interface ZSDPaymentView : UIView

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *goodsName;
@property (nonatomic,assign) CGFloat amount;

-(void)show;
-(void)dismiss;
@property (nonatomic,weak)id<InputPayPasswordDelegate> delegate;
@end
