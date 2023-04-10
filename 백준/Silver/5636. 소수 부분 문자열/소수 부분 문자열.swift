import Foundation
var prime = [Int]()
var temp = [Int](0...100000)
for i in 2...100000{
    if temp[i] == -1{
        continue
    }
    for k in stride(from: 2*i, to: 100000, by: i){
        temp[k] = -1
    }
}
for t in temp{
    if t != -1{
        prime.append(t)
    }
}
prime.reverse()

while let line = readLine(){
    if line == "0"{
        break
    }
    for p in prime{
        if line.contains(String(p)){
            print(p)
            break
        }
    }
}