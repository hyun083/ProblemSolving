import Foundation

while let line = readLine(){
    if line == "0"{
        break
    }
    let input = line.map{String($0)}
    var ans = 1
    for number in input{
        if number == "0"{
            ans += 5
        }else if number == "1"{
            ans += 3
        }else{
            ans += 4
        }
    }
    print(ans)
}