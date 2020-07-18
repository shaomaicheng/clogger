//
//  main.c
//  filerw
//
//  Created by 程磊 on 2020/7/18.
//  Copyright © 2020 程磊. All rights reserved.
//

#include "mmap_util.h"
#include "clogan_core.h"

int main() {

    clogan_init("../cache", "../path", 10, "chenglei", "leicheng");
    clogan_open("../demo.txt");
    clogan_write(1, "我是程磊啊 ", 1502100065601, "main", 0, 0);
    clogan_flush();
    return 0;
}
