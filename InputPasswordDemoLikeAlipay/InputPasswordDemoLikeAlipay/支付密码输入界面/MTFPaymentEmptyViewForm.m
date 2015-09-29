//
//  MTFPaymentEmptyViewForm.m
//  demo
//
//  Created by TengfeiMa on 15/9/28.
//  Copyright (c) 2015年 shaw. All rights reserved.
//

#import "MTFPaymentEmptyViewForm.h"
#import "MTFPaymentEmptyView.h"
@interface MTFPaymentEmptyViewForm()
{
    CGFloat keyboardHeight;
}

@property (nonatomic,strong) MTFPaymentEmptyView *emptyPWDView;
@property (nonatomic,strong) NSLayoutConstraint *heightConstraint;
@property (nonatomic,assign) CGFloat keyboardOriginY;
@end

@implementation MTFPaymentEmptyViewForm
-(instancetype)init
{
    self = [super init];
    if(self)
    {
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5f];
        
        
        __weak MTFPaymentEmptyViewForm* weakSelf = self;
        [self loadNib];
        
        _emptyPWDView.completeHandle = ^(NSString *inputPwd)
        {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",@"^[0-9]{6}$"];
            if([predicate evaluateWithObject:inputPwd])
            {

                if (weakSelf.delegate && ([weakSelf.delegate respondsToSelector:@selector(setupPaymentPasswordComplete:)])) {
                    [weakSelf.delegate setupPaymentPasswordComplete:inputPwd];
                }
            }
            else
            {
                
            }
        };
        
        [self addNotification];
        
    }
    
    
    return self;
}

-(void)dealloc
{

    [self removeNotification];
}
-(void)loadNib
{
    if(!_emptyPWDView)
    {
        UIView *nibView = [[[NSBundle mainBundle] loadNibNamed:@"MTFPaymentEmptyView" owner:nil options:nil] objectAtIndex:0];
        self.emptyPWDView = (MTFPaymentEmptyView *)nibView;
        self.emptyPWDView.center = self.center;
        [self addSubview:nibView];
    }
}

-(void)show
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
    
    
    _emptyPWDView.transform = CGAffineTransformMakeScale(0.01f, 0.01f);
    _emptyPWDView.alpha = 0;
    
    [UIView animateWithDuration:0.3f animations:^{
        _emptyPWDView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
        _emptyPWDView.alpha = 1.0;
    }completion:^(BOOL finished) {
        [_emptyPWDView fieldBecomeFirstResponder];
    }];
}

-(void)dismiss
{
    [UIView animateWithDuration:0.3f animations:^{
        _emptyPWDView.transform = CGAffineTransformMakeScale(0.01f, 0.01f);
        _emptyPWDView.alpha = 0;
    }completion:^(BOOL finished) {
        if(finished)
        {
            [self removeFromSuperview];
        }
    }];
}


-(void)addNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)removeNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

-(void)keyboardWillShow:(NSNotification *)notificaiton
{
    CGRect keyboardFrame = [[notificaiton.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    keyboardHeight = keyboardFrame.size.height;
    
    if((_emptyPWDView.frame.origin.y+10) != _keyboardOriginY)
    {
        [self resetAlertFrame];
    }
}

-(void)keyboardWillHide:(NSNotification *)notificaiton
{
    keyboardHeight = 0;
    [self resetAlertFrame];
}

//改变alert的位置，防止阻挡键盘
-(void)resetAlertFrame
{
    CGFloat bottom = [UIScreen mainScreen].bounds.size.height - CGRectGetMaxY(_emptyPWDView.frame);
    if(bottom < keyboardHeight)
    {
        CGFloat moveY = keyboardHeight - bottom;
        
        CGRect alertFrame = _emptyPWDView.frame;
        alertFrame.origin.y -= moveY;
        
        self.keyboardOriginY = alertFrame.origin.y;
        alertFrame.origin.y -= 10.0f;
        [UIView animateWithDuration:0.3f animations:^{
            _emptyPWDView.frame = alertFrame;
        }];
    }
    else
    {
        CGRect alertFrame = _emptyPWDView.frame;
        alertFrame.origin.y = ([UIScreen mainScreen].bounds.size.height - alertFrame.size.height) / 2.0f;
        
        [UIView animateWithDuration:0.3f animations:^{
            _emptyPWDView.frame = alertFrame;
        }];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
