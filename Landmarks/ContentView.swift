import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var rememberMe: Bool = false
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(hex: "994ECC"), // Lighter shade of purple
                        Color(hex: "3E187A")  // Darker shade of purple
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Image("SAlogo") // Replace "SAlogo" with the actual name of your logo image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 150)
                        .padding(.bottom, 10)
                    
                    VStack(spacing: 15) {
                        HStack {
                            Image(systemName: "person")
                                .foregroundColor(.white)
                                .padding(.leading, 10)
                            
                            
                            TextField("Username", text: $username)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, 10)
                                .frame(width: 190)
                                .foregroundColor(.black)
                                .autocapitalization(.none)
                        }
                        
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.white)
                                .padding(.leading, 10)
                            
                            SecureField("Password", text: $password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, 10)
                                .frame(width: 190)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.vertical, 20)
                    
                    HStack {
                        Image(systemName: rememberMe ? "checkmark.square" : "square")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.white)
                            .onTapGesture {
                                rememberMe.toggle()
                            }
                        
                        Text("Remember Me")
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 100)
                    
                    Spacer() // Push everything to the center
                    
                    Button(action: {
                        // Perform authentication logic here
                        
                        // Simulate successful login
                        isLoggedIn = true
                        
                        // Save login state if "Remember Me" is enabled
                        if rememberMe {
                            UserDefaults.standard.set(true, forKey: "RememberMe")
                        } else {
                            UserDefaults.standard.removeObject(forKey: "RememberMe")
                        }
                    }) {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 150, height: 40) // Adjusted size
                            .background(LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(hex: "9b88d7"),
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                            .cornerRadius(20) // Adjusted corner radius
                            .padding(.top, 20)
                    }
                    .padding(.bottom, 200)
                    
                    // Only activate the NavigationLink when isLoggedIn is true
                    NavigationLink(destination: GradesView(), isActive: Binding(
                        get: { isLoggedIn },
                        set: { _ in }
                    )) {
                        EmptyView()
                    }
                }
                .onAppear {
                    // Check if "Remember Me" is enabled
                    rememberMe = UserDefaults.standard.bool(forKey: "RememberMe")
                    
                    // Automatically log in if "Remember Me" is enabled
                    if rememberMe {
                        isLoggedIn = true
                    }
                }
                .navigationBarHidden(true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}
