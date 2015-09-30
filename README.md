# InputPasswordLikeAlipay
基于ZSDPaymentView，仿支付宝密码输入框，添加设置密码，添加密码输入完成回调，优化界面
用法（install）：

密码输入框

1.#import "ZSDPaymentView.h":导入密码输入框头文件

2.add InputPayPasswordDelegate for your class: 添加密码输入完成代理

3.new a ZSDPaymentView instance:新建一个ZSDPaymentView实例

    ZSDPaymentView *payment = [[ZSDPaymentView alloc]init];
    payment.title = @"支付密码标题";
    payment.goodsName = @"商品名称";
    payment.amount = 20.00f;
    payment.delegate = self;
    
4.show: 调用show方法来显示view  
    [payment show];

密码为空时，密码设置框

1.#import "MTFPaymentEmptyViewForm.h":导入头文件

2.add SetupPaymentPasswordDelegate in your class:添加密码设置完成代理

3.new a MTFPaymentEmptyViewForm instance:新建一个MTFPaymentEmptyViewForm实例

    MTFPaymentEmptyViewForm *initPayPWD = [[MTFPaymentEmptyViewForm alloc]init];
    initPayPWD.delegate = self;
    
4.show:调用show方法来显示view  
    [initPayPWD show];
