import Foundation

/// CONS:
/// - reference type, even if not nessary
/// - verbose solution (explicit inits)
/// - cast to a specific type required

class Item: Identifiable {
    
    let id: UUID
    let name: String
    
    init(id: UUID, name: String) {
        
        self.id = id
        self.name = name
    }
}

final class ComplexItem: Item {
    
    let value: String
    let action: () -> Void
    
    init(id: UUID, name: String, value: String, action: @escaping () -> Void) {
        
        self.value = value
        self.action = action
        super.init(id: id, name: name)
    }
}

struct ItemsCollection {
    
    let items: [Item]
    
    func use(item: Item) {
        
        switch item {
        case let complexItem as ComplexItem:
            print(complexItem.name)
            print(complexItem.value)
            complexItem.action()
            
        default:
            print(item.name)
        }
    }
    
    func item(with id: UUID) -> Item? {
        
        items.first(where: { $0.id == id })
    }
}
