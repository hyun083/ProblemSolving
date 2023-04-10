import Foundation

var numbers = Array(repeating: true, count: 1000001)

for i in 0..<1000001{
    if i <= 1{
        numbers[i] = false
        continue
    }
    if numbers[i]{
        for k in stride(from: i+i, to: 1000001, by: +i){
            numbers[k] = false
        }
    }
}

while let input = readLine(){
    let n = Int(input)!
    if n == 0{ break }
    
    var flag = false
    for i in 3..<1000001{
        if numbers[i]{
            let chk = n-i
            if numbers[chk]{
                flag = true
                print(n,"=",i,"+",chk)
                break
            }
        }
    }
    if !flag{
        print("Goldbach's conjecture is wrong.")
    }
}