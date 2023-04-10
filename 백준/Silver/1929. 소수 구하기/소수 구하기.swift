import Foundation

var numbers = Array<Int>(0...1000000)
numbers[1] = 0
for index in 2...1000000{
    if(numbers[index] == 0){ continue }
    for i in stride(from: index*2, through: 1000000, by: index){
        numbers[i] = 0
    }
}

var inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

for index in inputs[0]...inputs[1]{
    let res = numbers[index]
    if(res == 0){
        continue
    }else{
        print(res)
    }
}
