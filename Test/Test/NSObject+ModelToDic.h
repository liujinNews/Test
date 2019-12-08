//
//  NSObject+ModelToDic.h
//  Test
//
//  Created by APPLE on 2019/10/28.
//  Copyright © 2019 APPLE. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject(NSObject_ModelToDic)

//通过对象返回一个NSDictionary，键是属性名称，值是属性值
+ (NSDictionary *)getObjectData:(id)obj;

@end

NS_ASSUME_NONNULL_END
