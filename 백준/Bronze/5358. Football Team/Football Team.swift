import Foundation

func correction(str:String)->String{
    if str=="i"{
        return "e"
    }else if str=="e"{
        return "i"
    }else if str=="I"{
        return "E"
    }else if str=="E"{
        return "I"
    }else{
        return str
    }
}

while let line = readLine(){
    let name = line.map{correction(str: String($0))}
    print(name.joined(separator: ""))
}