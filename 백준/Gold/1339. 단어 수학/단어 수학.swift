import Foundation

let N = Int(readLine()!)!
var words = [String]()
var numbers = [Int]()
var alphbets = Dictionary<Character,Int>()

for _ in 0..<N{
    words.append(readLine()!)
}

for word in words {
    var temp = 1
    for a in word.reversed(){
        if alphbets[a] == nil{
            alphbets[a] = 1*temp
        }else{
            alphbets[a]! += 1*temp
        }
        temp *= 10
    }
}

var v = 9
for k in alphbets.sorted(by: {$0.value>$1.value}){
    alphbets[k.key] = v
    v -= 1
}

for word in words{
    var number = ""
    for w in word{
        number.append("\(alphbets[w]!)")
    }
    numbers.append(Int(number)!)
}
print(numbers.reduce(0, +))