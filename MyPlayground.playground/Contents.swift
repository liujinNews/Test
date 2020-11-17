import UIKit

var str = "Hello, playground"
str = "newValue"
str = "hello" + "world"
var b = MemoryLayout<Float>.size
var b1 = MemoryLayout<Float32>.size
var b2 = MemoryLayout<Float64>.size
var b3 = MemoryLayout<Float80>.size
var b4 = MemoryLayout<Double>.size
var num1 = 001.23
var num2 = 1_000
var sun = 1.25e3
var sun2 = 0x1p3
var num3 = 1_000.1_0001
var bool1 = true
var bool2 = false
var pen:(name:String,price:Int) = ("✒️",2)
var name = pen.name
var price = pen.price
var car:(String,Double) = ("奔驰",2e6)
var carName = car.0
var carPrice = car.1
//var (theName,thePrice) = car
//theName
//thePrice
//print(theName,thePrice)
var (theName,_) = car
print(theName)
//var obj:String?
//if obj == nil{
//
//}
var obj:String? = "HS"//此时可以理解为：?的存在是为obj创建一个指针绑定在obj上面，如果未给obj赋值，则指针指向空，如果给obj赋值计算机为这个值创建一个内存空间存储该值，然后将指针指向此内存空间
obj!//!的存在是为了获取上面?所创建的指针指向的内存空间，如果此指针指向了一块内存空间，则取该内存空间的值，否则报错
if obj != nil {
    print(obj!)
}

if let tmp = obj {
    print(tmp)
}else{
    obj = "HS"
    print(obj!)
}

var obj1:Int? = 1
var obj2:Int? = 2
if let tmp1 = obj1,let tmp2 = obj2{//tmp1和tmp2只在大括号里面有用，在大括号外面就报错
    print(tmp1,tmp2)
    tmp1//在这里有效
    tmp2//在这里有效
}
//tmp1;tmp2;在这里报错

if let tmp1 = obj1,let tmp2 = obj2, tmp1<tmp2{
    print(tmp1,tmp2)
}
typealias Price = Int
var penPrice:Price = 100

var ax:Int = 1
var bx = 2
ax = ax + bx
bx = ax - bx
ax = ax - bx
print(ax,bx)

var count1 = 25
var count2 = 0o31
var count3 = 0x19
var count4 = 0b00011001
var bundle:(pencil:Int,eraser:Int,pencilCase:Int) = (3,1,15)
var product:Int? = 100
if let weight = product,weight > 30{
    print("产品合格");
}
