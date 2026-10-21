import SwiftUI
import Playgrounds

struct ContentView: View {
    var body: some View {
       
        List{
            
            VStack{
                Image(.meow)
                    .resizable()
                    .frame(width:120,
                           height: 120)
                clipShape(.circle)
                Text("Lujain, \(20)")
                    .font(.title)
                    .fontWeight(
                        .semibold)
                
            }
            .frame(maxWidth:.infinity,
                   alignment: .center)
            .listRowBackground(Color.clear)
            
            Section{
                Text("blah blah")
                
            } header: {
                Text("about")
            }
            
        }
        
        
           
    }
}

#Preview {
    ContentView()
}

#Playground {
    _ = 1 + 2
}
