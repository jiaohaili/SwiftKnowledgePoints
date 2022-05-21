//
//  CopyDemo.swift
//  SwiftKnowledgePoints
//
//  Created by haili on 2022/3/14.
//

import UIKit

class CopyDemo: UIViewController {
/**
 参考链接 ->  https://juejin.cn/post/6867731089113219079
 
 1.浅拷贝在拷贝对象过程中
 * 只拷贝了指向对象内存地址的指针
 * 拷贝后新的指针仍然指向原来的内存地址
 2.深拷贝在拷贝对象过程中
 * 不仅拷贝了指向对象内存地址的指针
 * 还会拷贝原指针所指向的内存地址所存储的内容
 * 并且在堆中重新生成一块内存地址来存放拷贝的内容
 * 然后新的指针会指向新的内存地址
 
 
   简单对比：浅拷贝，拷贝指针，不开辟内存地址；深拷贝，拷贝指针和内容，开辟内存地址（存放拷贝的内容）
 
 
   如果对象是不可变的，copy会进行浅拷贝，mutableCopy会进行深拷贝
   如果对象是可变的，那么无论是copy还是mutableCopy都会进行深拷贝
   如果是copy，拷贝后的对象不可变
   如果是mutableCopy，拷贝后的对象可变
 
 
 拓展面试题：
    修饰属性时用strong还是copy?
    修饰不可变对象（NSString，NSArray，NSDictionary等）用copy，修饰可变对象（NSMutableString，NSMutableArray，NSMutableDictionary等）用strong
 
 
 这是因为用copy修饰strCopy属性，底层默认会在strCopy的setter方法中对所赋值的可变字符串mutableStr先做一次copy操作然后再赋值，那么我们很容易能推出来这是一次深拷贝，会开辟新的内存地址，那么使得strCopy会指向新的内存地址，存放copy后的值

 */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text4()
    }
    
    // TODO: 对不可变对象进行copy
    func text1() {
        var A: NSString = "aaa"
        var B = A.copy()
        //指针地址
        let pointer_A = withUnsafePointer(to: &A, {$0})
        let pointer_B = withUnsafePointer(to: &B, {$0})
        print(String(format: "\n不可变-copy\n\(pointer_A) = 原对象指针地址\n\(pointer_B) = copy的对象指针地址\n%p = 原对象的内存地址 - %@\n%p = copy的对象的内存地址 - %@",  A as! CVarArg, A as! CVarArg, B as! CVarArg, B as! CVarArg))
        /*
         不可变-copy
         0x00007ffee5f56f80 = 原对象指针地址
         0x00007ffee5f56f60 = copy的对象指针地址
         0xe93991769549c844 = 原对象的内存地址 - aaa
         0xe93991769549c844 = copy的对象的内存地址 - aaa
         */
    }
    
    // TODO: 对不可变对象进行mutableCopy
    func text2() {
        var A: NSString = "aaa"
        var B = A.mutableCopy()
        //指针地址
        let pointer_A = withUnsafePointer(to: &A, {$0})
        let pointer_B = withUnsafePointer(to: &B, {$0})
        print(String(format: "\n不可变-mutableCopy\n\(pointer_A) = 原对象指针地址\n\(pointer_B) = copy的对象指针地址\n%p = 原对象的内存地址 - %@\n%p = copy的对象的内存地址 - %@",  A as! CVarArg, A as! CVarArg, B as! CVarArg, B as! CVarArg))
        /*
         不可变-mutableCopy
         0x00007ffeedbf1f70 = 原对象指针地址
         0x00007ffeedbf1f50 = copy的对象指针地址
         0xe277cbd670bb5e34 = 原对象的内存地址 - aaa
         0x6000036d14a0 = copy的对象的内存地址 - aaa
         */
    }
    
    // TODO: 对可变对象进行copy
    func text3() {
        var A: NSMutableString = "aaa"
        var B = A.copy()
        //指针地址
        let pointer_A = withUnsafePointer(to: &A, {$0})
        let pointer_B = withUnsafePointer(to: &B, {$0})
        print(String(format: "\n可变-copy\n\(pointer_A) = 原对象指针地址\n\(pointer_B) = copy的对象指针地址\n%p = 原对象的内存地址 - %@\n%p = copy的对象的内存地址 - %@",  A as! CVarArg, A as! CVarArg, B as! CVarArg, B as! CVarArg))
        /*
         可变-copy
         0x00007ffee63c4f60 = 原对象指针地址
         0x00007ffee63c4f40 = copy的对象指针地址
         0x60000109a8b0 = 原对象的内存地址 - aaa
         0xe32307c77ebfaf4c = copy的对象的内存地址 - aaa
         */
    }
    // TODO: 对可变对象进行mutableCopy
    func text4() {
        var A: NSMutableString = "aaa"
        var B = A.mutableCopy()
        //指针地址
        let pointer_A = withUnsafePointer(to: &A, {$0})
        let pointer_B = withUnsafePointer(to: &B, {$0})
        print(String(format: "\n可变-mutableCopy\n\(pointer_A) = 原对象指针地址\n\(pointer_B) = copy的对象指针地址\n%p = 原对象的内存地址 - %@\n%p = copy的对象的内存地址 - %@",  A as! CVarArg, A as! CVarArg, B as! CVarArg, B as! CVarArg))
        /*
         可变-mutableCopy
         0x00007ffeea234f70 = 原对象指针地址
         0x00007ffeea234f50 = copy的对象指针地址
         0x600003288390 = 原对象的内存地址 - aaa
         0x6000032b5170 = copy的对象的内存地址 - aaa
         */
    }
    
    func text5() {
        
    }
}
