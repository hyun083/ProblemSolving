import Foundation

let nwl = readLine()!.split(separator: " ").map{Int($0)!}
let n = nwl[0]
let w = nwl[1]
let l = nwl[2]
var trucks = Array(readLine()!.split(separator: " ").map{Int($0)!}.reversed())
var time = 0

var bridge = Array(repeating: 0, count: w)
var weight = 0
func enter(truck:Int){
    weight -= bridge.last!
    for i in stride(from: w-1, through: 1, by: -1){
        bridge[i] = bridge[i-1]
    }
    bridge[0] = truck
    weight += truck
}

while !trucks.isEmpty{
    time+=1
    if weight+trucks.last!-bridge.last! <= l{
        enter(truck: trucks.removeLast())
    }else{
        enter(truck: 0)
    }
}

while weight>0{
    time+=1
    enter(truck: 0)
}
print(time)