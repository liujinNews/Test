import UIKit

var str = "Hello, playground"
var array1:[Int]
var array2:Array<Int>
array1 = []
array2 = Array()
array1 = [1,2,3]
array2 = Array(arrayLiteral: 1,2,3)
var array3 = [String](repeating: "Hello", count: 10)
var array4 = Array(repeating: 1, count: 10)
var array5 = [1,2,3] + [4,5,6]
var array = [1,2,3,4,5,6,7,8,9]
array.count
if array.isEmpty {
    print("array为空数组")
}
var a = array[0]
var subArray = array[0...3]
var b = array.first
var c = array.last
array[0] = 0
array[0...3] = [1,2,3,4]
array.append(10)
array.append(contentsOf:[11,12,13])
array.insert(0, at: 0)
array.insert(contentsOf: [-2,-1], at: 0)
array.remove(at: 1)
array.removeFirst()
array.removeLast()
array.removeFirst(2)
array.removeLast(2)
array.removeSubrange(0...2)
array.replaceSubrange(0...2, with: [0,1])
array.removeAll()
if array.contains(1){
    print(true)
}else{
    print(false)
}
let arrayLet = [0,1,2,3,4]
let arrayLet2 = [(1,2),(2,3),(3,4)]
for item in arrayLet {
    print(item)
}
for item in arrayLet.enumerated() {
    print(item)
}
for index in arrayLet2.indices {
    print(index)
}
var arraySort = [1,3,5,6,7]
arraySort = arraySort.sorted(by:>)
arraySort.sorted(by: <)
arraySort.max()
arraySort.min()

//Set
var set1:Set<Int> = [1,2,3,4]

