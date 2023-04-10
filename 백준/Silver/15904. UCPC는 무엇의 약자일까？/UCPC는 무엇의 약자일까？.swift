import Foundation

let inputs = readLine()!.split(separator: " ").map{String($0)}
var result = ""
for input in inputs {
    for char in input{
        if result=="" && char=="U"{
            result.append(char)
        }
        if result=="U" && char=="C"{
            result.append(char)
        }
        if result=="UC" && char=="P"{
            result.append(char)
        }
        if result=="UCP" && char=="C"{
            result.append(char)
        }
    }
}

if result=="UCPC"{
    print("I love UCPC")
}else{
    print("I hate UCPC")
}