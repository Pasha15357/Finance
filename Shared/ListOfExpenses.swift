//
//  ListOfExpenses.swift
//  Finance
//
//  Created by Паша on 19.10.23.
//

import SwiftUI

struct ExpenseItem {
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
struct ListOfExpenses: View {
    
    @ObservedObject var expenses = Expenses()
    var body: some View {
        NavigationView {
            List {
                ForEach (expenses.items, id: \.name) { item in
                    
                }
            }
        }
        .navigationBarTitle("Мои расходы")
        .navigationBarItems(leading:
                                Button(action: {
            let expense = ExpenseItem(name: "Test", type: "", amount: 50)
            self.expenses.items.append(expense)
        }) {
            Image(systemName: "plus")
        })
    }
}

struct ListOfExpenses_Previews: PreviewProvider {
    static var previews: some View {
        ListOfExpenses()
    }
}
