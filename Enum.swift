enum weatherCondition: String{
    case hot = "super hot"
    case cloudy
    case rain
}

var currentWeather = weatherCondition.cloudy

switch currentWeather {
    case .hot:
        print("hello")
    case .cloudy:
        print("wup")
    default:
        print("default")
}

enum vendingMachineError: Error {
    case outOfStock
    case invalidSelection
    case insufficientFund(coinNeeded: Int)
}

struct Item {
    var price: Int
    var count: Int
}

var inventory: [String: Item] = [
    "Pretzel": Item(price: 5, count: 5),
    "Coke": Item(price: 5, count: 5),
    "Hersey": Item(price: 5, count: 5)
]

var coinDeposited: Int = 10

func purchaseItem(name: String) throws {
    guard let item = inventory[name] else {
        throw vendingMachineError.invalidSelection
    }

    guard coinDeposited >= item.price else {
        throw vendingMachineError.insufficientFund(coinNeeded: item.price - coinDeposited )
    }

    guard item.count > 0 else {
        throw vendingMachineError.outOfStock
    }

    coinDeposited -= item.price

    var newItem = item
    newItem.count -= 1
    inventory[name] = newItem

    print(inventory)
}

do {
   try purchaseItem(name: "Pretzel")
} catch let error {
    print(error)
}
