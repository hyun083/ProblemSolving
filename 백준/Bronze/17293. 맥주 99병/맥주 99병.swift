import Foundation

func bottle(num:Int){
    print("\(num) \(num==1 ? "bottle":"bottles") of beer on the wall, \(num) \(num==1 ? "bottle":"bottles") of beer.")
    print("Take one down and pass it around, \(num-1 == 0 ? "no more" : "\(num-1)") \(num-1==1 ? "bottle":"bottles") of beer on the wall.","\n")
}
let N = Int(readLine()!)!
var n = N
while n > 0{
    bottle(num: n)
    n -= 1
}
print("No more bottles of beer on the wall, no more bottles of beer.")
print("Go to the store and buy some more, \(N) \(N==1 ? "bottle":"bottles") of beer on the wall.")