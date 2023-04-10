import Foundation

while(true){
    var flag = true
    let input = readLine()!
    if(input == "."){
        break
    }
    var arr = Array<String.Element>()
    
    for char in input{
        if(char == "(" || char == "["){
            arr.append(char)
        }
        if(char == ")"){
            if (arr.last == "("){ arr.removeLast() }
            else{ flag = false; break }
        }
        if(char == "]"){
            if (arr.last == "["){ arr.removeLast() }
            else{ flag = false; break }
        }
    }
    if(arr.isEmpty && flag == true){
        print("yes")
    }else{
        print("no")
    }
}
