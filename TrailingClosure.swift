
var inventory: [String:String] = ["/desktop" : "serving.png"]

func loadDirectory(directory: String, onComplete: (String) -> Void, onFailure: () -> Void) {
    if let image = inventory[directory] {
        onComplete(image)
    } else {
        onFailure()
    }
}

loadDirectory(directory: "/desktop") { image in
    print(image)
} onFailure: {
    print("failed")
}
