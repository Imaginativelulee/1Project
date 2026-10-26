import SwiftUI
import Playgrounds


struct ContentView: View {
    @State var isAvailable: Bool = true
    @State var textField: String = ""
    //state is to refresh the variable in the UI so we use @state
    var body: some View {
        NavigationStack {
            List{
                VStack{
                    Image(isAvailable ? .sunnyMama : .sleepyMama)
                        .resizable()
                        .frame(width:120,
                               height: 120)
                    // Note: make sure to keep your clipShape modifier here!
                    Text("Ghadeer, \(22)")
                        .font(.title)
                        .fontWeight(
                            .semibold)
                    /*if isAvailable {
                     Text("Available: Yes")
                     .foregroundColor(.green)
                     } else {
                     Text("Available: No")
                     .foregroundColor(.red)
                     }*/
                    
                    //interactive toggle: Putting the $ symbol in front of @State variables (like $isAvailable) passes a two-way binding so the toggle can both read the current state and write changes back to it. If you just write isAvailable without the $, Swift only passes the read-only value, and the toggle won't work.
                    Toggle(isOn: $isAvailable){
                        Text(isAvailable ? "Available: Yes" : "Available: No")
                        .foregroundColor(isAvailable ? .green : .red)}
                    .padding(.horizontal, 40)
                    
                    bio(text: $textField) //fun for bio called
                }
                .frame(maxWidth:.infinity,
                       alignment: .center)
                .listRowBackground(Color.clear)
                
                // 2. Button/Link to navigate to the second page, passing the shared state with a $
                NavigationLink(destination: ContentView2(isAvailable: $isAvailable)) {
                    Text("Go to Second Page")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                }
                .padding(.top, 10)
                .listRowBackground(Color.clear)
                
                
            }
        }
    }
    //bio function, @viewbuilder is to allow a function to return swiftUI value
    @ViewBuilder
    func bio(text: Binding<String>) -> some View {
        Section {
            TextField("no bio", text: text)
        } header: {
            Text("About")
        } footer: {
            // This shows "No bio" at the bottom of the section only when empty
            if text.wrappedValue.isEmpty {
                Text("No bio")
                    .foregroundColor(.gray)
                    .italic()
            }}}
}

struct ContentView2: View {
    // 3. Use @Binding here so it connects to the exact same variable from ContentView
    @Binding var isAvailable: Bool
    //@State var isAvailable: Bool = true
        
    var body: some View {
        VStack(spacing: 20) {
            Text("Second Page")
                .font(.largeTitle)
                .bold()
             
            // This toggle is linked to the same state! When you toggle here, page 1 changes too.
            Toggle(isOn: $isAvailable) {
                Text(isAvailable ? "Status: Available" : "Status: Busy")
                    .foregroundColor(isAvailable ? .green : .red)
                    .font(.title3)
            }
            .padding(40)
             
            Spacer()
        }
        .navigationTitle("Page 2")
    }
}
    
#Preview {
    ContentView()
}
