//
//  main.c
//  C_Test001
//
//  Created by APPLE on 2020/1/9.
//  Copyright © 2020 APPLE. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>     //提供malloc()原型
#include <string.h>    //提供strcpy()原型

#define TSIZE 45     //储存片名数组的大小

struct film {
    char title[TSIZE];
    int rating;
    struct film *next;//指向链表中的下一个结构
};

int main(int argc, const char * argv[]) {
    // insert code here...
//    printf("Hello, World!\n");
    
    
    
    
    return 0;
}
