import SwiftUI

struct MenuView: View {
    
    var body: some View {
        VStack {
            Color.gray
            firstCard
            secondCard
        }
        .background(.gray)
    }
    
    // MARK: - Private
    
    private var firstCard: some View {
        FloatingBackground(color: .white) {
            VStack(alignment: .leading) {
                Text("GET VERIFIED")
                    .font(.custom("BebasNeue-Regular", size: 39))
                    .foregroundColor(Color(red: 0.11, green: 0.19, blue: 0.28))
                Text("Become a trusted memeber of the komunity and start interacting")
                    .font(.custom("Lato-Regular", size: 13))
                    .frame(width: 198)
                verifyNowButton
            }
            .padding(.leading, 16)
            .frame(width: 345, alignment: .leading)
            .background {
                GeometryReader { proxy in
                    Image("verify_image")
                        .offset(x: 187, y: -15)
                    
                }
            }
        }
        .frame(width: 345, height: 166)
    }
    
    private var secondCard: some View {
        FloatingBackground(color: .white) {
            VStack {
                HStack {
                    
                    VStack {
                        Text("COMPLETE YOUR PROFILE")
                            .font(.custom("BebasNeue-Regular", size: 29))
                            .foregroundColor(Color(red: 0.11, green: 0.19, blue: 0.28))
                        Text("Take a few steps to show the kommunity who you really are")
                            .font(.custom("Lato-Regular", size: 13))
                            .frame(width: 192)
                    }
                }
                doneButton
                    .padding(.bottom, -21)
            }
            .padding([.top, .bottom], 22)
            .padding(.leading, 16)
            .frame(width: 345, alignment: .leading)
        }
        .frame(width: 345, height: 218)
    }

    private var verifyNowButton: some View {
        Button {
            // do something
        } label: {
            ZStack {
                Capsule()
                    .fill(.linearGradient(stops: [
                        Gradient.Stop(color: Color(red: 1, green: 0.35, blue: 0.35), location: 0.00),
                        Gradient.Stop(color: Color(red: 0.95, green: 0, blue: 0), location: 1.00),
                        ], startPoint: UnitPoint(x: 0.82, y: 0.2), endPoint: UnitPoint(x: 0.08, y: 1)))
                HStack {
                    Image("Warning")
                    Text("Verify now")
                        .font(.custom("Lato", size: 14)
                        )
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
            .frame(width: 115, height: 35)
        }
    }
    
    private var doneButton: some View {
        Button {
            // do something
        } label: {
            ZStack {
                Capsule()
                    .fill(.linearGradient(stops: [
                            Gradient.Stop(color: Color(red: 0.87, green: 0.98, blue: 1), location: 0.00),
                            Gradient.Stop(color: Color(red: 0, green: 0.82, blue: 1), location: 1.00),
                            ],
                                        startPoint: UnitPoint(x: 0.81, y: -1.02),
                                        endPoint: UnitPoint(x: 0.42, y: 1.07)))
                HStack {
                    Text("Let's get it done")
                        .font(.custom("Lato", size: 14)
                        )
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
            .frame(width: 300, height: 45)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
