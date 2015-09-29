//
//  common.h
//  InputPasswordDemoLikeAlipay
//
//  Created by TengfeiMa on 15/9/29.
//  Copyright (c) 2015年 GoodOffer. All rights reserved.
//

#ifndef InputPasswordDemoLikeAlipay_common_h
#define InputPasswordDemoLikeAlipay_common_h

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define kFieldSize CGSizeMake(210.0f,45.0f)
#define kDotSize CGSizeMake (10.0f,10.0f)
#define kLineCount 5
#define kDotCount 6
#define kLineMarginTop 5.0f
#endif
