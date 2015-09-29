//
//  ViewController.m
//  InputPasswordDemoLikeAlipay
//
//  Created by TengfeiMa on 15/9/29.
//  Copyright (c) 2015年 GoodOffer. All rights reserved.
//

#import "ViewController.h"
#import "ZSDPaymentView.h"
#import "MTFPaymentEmptyViewForm.h"

@interface ViewController ()<InputPayPasswordDelegate,SetupPaymentPasswordDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(50, 100, 100, 50);
    [btn setTitle:@"输入支付密码" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor greenColor]];
    [btn addTarget:self action:@selector(showAlert:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame = CGRectMake(50, 200, 100, 50);
    [btn2 setTitle:@"设置支付密码" forState:UIControlStateNormal];
    [btn2 setBackgroundColor:[UIColor redColor]];
    [btn2 addTarget:self action:@selector(showEmptyPayment:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}

-(void)showAlert:(id)sender
{
    ZSDPaymentView *payment = [[ZSDPaymentView alloc]init];
    payment.title = @"支付密码标题";
    payment.goodsName = @"商品名称";
    payment.amount = 20.00f;
    payment.delegate = self;
    [payment show];
}

-(void)showEmptyPayment:(id)sender
{
    MTFPaymentEmptyViewForm *initPayPWD = [[MTFPaymentEmptyViewForm alloc]init];
    initPayPWD.delegate = self;
    [initPayPWD show];
    
}

/**
 *  密码输入完成后代理回调
 *
 *  @return 
 */
#pragma mark -- InputPayPasswordDelegate
-(void)passwordInputCompleted:(NSString *)password
{
    NSLog(@"\n密码：%@",password);

}

/**
 *  设置密码完成后代理回调
 *
 *  @return
 */
#pragma mark -- SetupPaymentPasswordDelegate
-(void)setupPaymentPasswordComplete:(NSString *)newPassword
{
    NSLog(@"\n设置的密码：%@",newPassword);

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
