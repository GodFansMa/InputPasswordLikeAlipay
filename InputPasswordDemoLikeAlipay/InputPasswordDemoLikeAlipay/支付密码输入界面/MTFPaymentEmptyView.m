//
//  MTFPaymentEmptyView.m
//  demo
//
//  Created by TengfeiMa on 15/9/28.
//  Copyright (c) 2015年 shaw. All rights reserved.
//

#import "MTFPaymentEmptyView.h"
#import "common.h"

@interface MTFPaymentEmptyView()
{
    NSString *_password;
    NSString *_confirmPWD;

}
@end

@implementation MTFPaymentEmptyView

-(instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];

    self.layer.cornerRadius = 5.0f;
    self.layer.masksToBounds = YES;
    
    //
    _firstInput.layer.borderWidth = 1.0f;
    _firstInput.layer.borderColor = UIColorFromRGB(0xC8C8C8).CGColor;
    _firstInput.delegate = self;
    
    //
    _confirmInput.layer.borderWidth = 1.0f;
    _confirmInput.layer.borderColor = UIColorFromRGB(0xC8C8C8).CGColor;
    _confirmInput.delegate = self;
}

-(void)passwordView:(ZSDSetPasswordView *)passwordView inputPassword:(NSString *)password
{
    //每次输入密码，都保存，修改原来只是输入6为才保存
    if (passwordView == _firstInput) {
//    if ((passwordView == _firstInput)&&[password length ] == 6) {
        _password = password;
    //当密码输入长度为6位时，就跳到确认密码输入框
    if (_password.length == 6) {
       [_confirmInput fieldBecomeFirstResponder];
        }
        return;
    }
    
    if (passwordView == _confirmInput) {
//    if ((passwordView == _confirmInput)&&[password length ] == 6) {
        _confirmPWD = password;
    }
}


#pragma mark -- 取消
- (IBAction)cancel:(id)sender {
    [self.superview performSelector:@selector(dismiss)];
}
#pragma mark -- 确定
- (IBAction)confirm:(id)sender {
    if ([_password isEqualToString:@""]||(_password == nil)) {
        NSLog(@"\n密码为空");
        return;
    }
    if (_password.length < 6) {
        NSLog(@"\n密码长度小于6");
        return;
    }
    if ([_confirmPWD isEqualToString:@""]||(_confirmPWD == nil)) {
        NSLog(@"\n确认密码为空");
        return;
    }
    if (![_password isEqualToString:_confirmPWD]) {
        NSLog(@"\n两次密码输入不相同");
        return;
    }
    
    if(_completeHandle)
    {
        _completeHandle(_password);
    }
    
}

-(CGSize)viewSize
{
    CGSize size = [self systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size;
}

-(void)fieldBecomeFirstResponder
{
    [_firstInput fieldBecomeFirstResponder];
}

-(void)dismiss
{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
@end
