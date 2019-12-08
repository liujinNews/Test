//
//  NSObject+ModelToDic.m
//  Test
//
//  Created by APPLE on 2019/10/28.
//  Copyright © 2019 APPLE. All rights reserved.
//

#import "NSObject+ModelToDic.h"
#import <objc/runtime.h>

@implementation NSObject(ModelToDic)

+ (NSDictionary *)getObjectData:(id)obj{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    unsigned int propsCount;
//    无论如何先把对象当作一个数组
    objc_property_t *props = class_copyPropertyList([obj class], &propsCount);
    for (int i = 0; i < propsCount; i ++) {
        objc_property_t prop = props[i];
        NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
        id value = [obj valueForKey:propName];
        if (value == nil||[value isEqual:@""]) {
           value = [self getObjectInternal:[NSNull null]];
        }else{
           value = [self getObjectInternal:value];
        }
        [dic setValue:value forKey:propName];
    }
    return dic;
}

+ (id)getObjectInternal:(id)obj{
    if ([obj isKindOfClass:[NSNull class]]||[obj isKindOfClass:[NSString class]]||[obj isKindOfClass:[NSNumber class]]) {
        return obj;
    }else if ([obj isKindOfClass:[NSArray class]]){
        NSArray *objArr = obj;
        NSMutableArray *dataArr = [NSMutableArray arrayWithCapacity:objArr.count];
        for (int i = 0; i < objArr.count; i ++) {
            id everyObj = objArr[i];
           id dataObj = [self getObjectInternal:everyObj];
            [dataArr addObject:dataObj];
        }
        return dataArr;
    }else if ([obj isKindOfClass:[NSDictionary class]]){
        NSDictionary *objDic = obj;
        NSMutableDictionary *dataDic = [NSMutableDictionary dictionaryWithCapacity:[objDic count]];
        for (NSString *key in objDic.allKeys) {
            id everyObj = [objDic objectForKey:key];
            id dataObj = [self getObjectInternal:everyObj];
            [dataDic setValue:dataObj forKey:key];
        }
        return dataDic;
    }
    return [self getObjectData:obj];
}

@end
