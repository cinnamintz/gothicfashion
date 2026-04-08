import SwiftUI


let data = [
Item(name: "THE BRIDE!", designer: "Sandy Powell", category: "✮⋆˙film", desc: "Directer Maggie Gyllenhall carefully chose Sandy Powell as the costumer designer for her classic monsterous tale. Powell is a British designer with 3 Acedemy Awards and a lifetime of experience.", character: "the Bride",  imageName: "rest1"),
Item(name: "Frankenstein", designer: "Kate Hawley", category: "✮⋆˙film", desc: "Directer Guilermo del Toro needed Elizabeth to portray many emotions and change through her fashion. It needed to represent the 1850's and instead of following the usual dark gothic Victorian pallete, they mixed gothic with vibrancy to show an erray of emotions. ", character: "Elizabeth. Cr. Frank Ockenfels", imageName: "rest2"),
Item(name: "Real Life Horror",designer: "Helen McGuckin", category: "𓆩♱𓆪photography", desc: "Helen McGuckin says she was always drawn to gothic fashion and community. McGuckin teamed up with Hutchinson to survey goth communities over England. They realized the definition of goth has expanded. They photographed different people and their unique ways of expression.", character: "Xanthe Hutchtinson", imageName: "rest3"),
Item(name: "Models gone goth", designer: "Gabriette", category: "runway⋆.ೃ࿔*:･", desc: "Model, musician, icon. Gabriette is Californian native and has sparked soft goth back into pop-culture. ", character: "Gabriette", imageName: "rest4"),
]

struct Item: Identifiable {
    let id = UUID()
    let name: String
    let designer: String
    let category: String
    let desc: String
    let character: String
    let imageName: String
}

struct ContentView: View {
    
    let categories = ["media types"] + Array(Set(data.map { $0.category })).sorted()
       @State private var selectedCategory = "media types"

       var filteredData: [Item] {
           if selectedCategory == "media types" {
               return data
           } else {
               return data.filter { $0.category == selectedCategory }
           }
       } // end filteredData
    
    
var body: some View {
    NavigationView {
    VStack {
    Picker("Category", selection: $selectedCategory) {
          ForEach(categories, id: \.self) { category in
              Text(category).tag(category)
          }
      } // end Picker
      .pickerStyle(.menu)
      .padding()

        List(filteredData, id: \.name) { item in
            NavigationLink(destination: DetailView(item: item)) {
                HStack {
                    Image(item.imageName)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(10)
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.category)
                            .font(.subheadline)
                        Text(item.designer)
                            .font(.subheadline)
                    } // end internal VStack
                } // end HStack
            } // end NavigationLink
        } // end List
            
        } // end VStack
        .listStyle(PlainListStyle())
             .navigationTitle("⊹ ࣪ ˖gothic fashion⊹ ࣪ ˖")
         } // end NavigationView
    } // end body
}


struct DetailView: View {
// initialize variables for Map in Detail View abd set zoom and centering on specific item
        
let item: Item
               
var body: some View {
VStack {
   Image(item.imageName)
       .resizable()
       .aspectRatio(contentMode: .fit)
       .frame(maxWidth: 200)
   Text("designer: \(item.designer)")
       .font(.subheadline)
   Text("Category: \(item.category)")
       .font(.subheadline)
       
   Text((item.character))
       .font(.subheadline)
       .frame(maxWidth: .infinity, alignment: .leading)
       .padding()
   Text("Description: \(item.desc)")
       .font(.subheadline)
       .padding(10)
               
//Map code in Detail View
    Spacer()
           
    } // end VStack
    .navigationTitle(item.name)
   
        } // end body
     } // end DetailView
   

#Preview {
    ContentView()
}
   
