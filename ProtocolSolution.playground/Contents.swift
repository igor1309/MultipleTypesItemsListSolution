import Foundation

/// CONS:
/// - cast to a specific type required
/// - undefined state possible

protocol Item: Identifiable {

    var id: UUID
    var name: String { get }
}

struct SimpleItem: Item {
    
    let id: UUID
    let name: String
}

struct ComplexItem: Item {
    
    let id: UUID
    let name: String
    let value: String
    let action: () -> Void
}

struct ItemsCollection {
    
    let items: [any Item]
    
    func use(item: any Item) {
        
        switch item {
        case let simpleItem as SimpleItem:
            print(simpleItem.name)
            
        case let complexItem as ComplexItem:
            print(complexItem.name)
            print(complexItem.value)
            complexItem.action()
            
        default:
            break
        }
    }
    
    func item(with id: UUID) -> (any Item)? {
        
        items.first(where: { $0.id == id })
    }
}
