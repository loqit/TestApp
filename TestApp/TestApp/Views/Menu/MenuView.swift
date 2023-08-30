import SwiftUI

struct MenuView: View {
    
    private var viewModel = MenuViewModel(updateService: MockUpdateService())
    
    @State var buttonGradient = Constants.defaultGradient
    @State var imageBorderColor = Constants.defaultBorderColor
    @State var cardTitle = Constants.defaultTitle
    @State var cardSubtitle = Constants.defaultSubTitle
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                customNavBar
                firstCard
                secondCard
                thirdCard
            }
            .padding(.leading, 15)
            .padding(.trailing, 10)
            VStack(alignment: .leading, spacing: 1) {
                settingsSection(imageName: "account_settings", title: "Account Settings")
                settingsSection(imageName: "logout", title: "Logout")
                    .padding(.bottom, 1)
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color(red: 0.97, green: 0.96, blue: 0.97))
    }
    
    // MARK: - Private
    
    private var customNavBar: some View {
        HStack {
            Image("profile_image")
                .resizable()
                .frame(width: 38, height: 38)
                .clipShape(Circle())
                .padding(.leading, 20)
            VStack(alignment: .leading) {
                Text("ESSEXLAD")
                    .font(.custom("BebasNeue-Regular", size: 19))
                Text("View and edit profile")
                    .font(.custom("Lato-Regular", size: 13))
            }
            Spacer()
            Button {
                // do something
            } label: {
                Image("close_button")
                    .padding(.trailing, 15)
            }
        }
        .frame(height: 58)
        .background(.white)
    }
    
    private func settingsSection(imageName: String, title: String) -> some View {
        HStack {
            Image(imageName)
                .padding(.leading, 17)
            Text(title)
                .font(.custom("BebasNeue-Regular", size: 20))
            Spacer()
        }
        .frame(height: 51)
        .background(.white)
    }
    
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
                HStack {
                    Spacer()
                    Image("verify_image")
                }
            }
        }
    }
    
    private var secondCard: some View {
        FloatingBackground(color: .white) {
            VStack {
                HStack(spacing: 12) {
                    Circle()
                        .strokeBorder(imageBorderColor, lineWidth: 4)
                        .background {
                            Image("profile_image")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                        }
                        .frame(width: 100, height: 100)
                    VStack(alignment: .leading) {
                        Text(cardTitle)
                            .font(.custom("BebasNeue-Regular", size: 29))
                            .foregroundColor(Color(red: 0.11, green: 0.19, blue: 0.28))
                        Text(cardSubtitle)
                            .font(.custom("Lato-Regular", size: 13))
                            .frame(width: 192, alignment: .leading)
                    }
                }
                Spacer()
                doneButton
            }
            .padding(.vertical, 22)
        }
    }
    
    private var thirdCard: some View {
        FloatingBackground(color: Color(red: 0.13, green: 0.16, blue: 0.16),
                           aligment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Events & E-Tickets")
                        .foregroundColor(.white)
                        .font(.custom("BebasNeue-Regular", size: 39))
                    Text("Buy and access your party and workshop tickets")
                        .foregroundColor(.white)
                        .font(.custom("Lato-Regular", size: 13))
                }
                .frame(width: 154, alignment: .leading)
            }
            .padding(.leading, 16)
        }
                           .overlay {
                               GeometryReader { _ in
                                   HStack {
                                       Spacer()
                                       Image("third_background")
                                           .resizable()
                                           .aspectRatio(contentMode: .fill)
                                           .frame(width: 196, height: 166)
                                           .cornerRadius(20)
                                   }
                               }
                           }
    }
    
    private var verifyNowButton: some View {
        Button {
            
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
                        .font(.custom("Lato", size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
            .frame(width: 115, height: 35)
        }
    }
    
    private var doneButton: some View {
        Button {
            Task {
                await viewModel.loadData()
                if viewModel.isResponseSuccess {
                    updateCard()
                }
            }
        } label: {
            ZStack {
                Capsule()
                    .fill(buttonGradient)
                HStack {
                    Text("Let's get it done")
                        .font(.custom("Lato", size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                }
            }
            .padding(.horizontal, 22)
        }
    }
    
    private func updateCard() {
        buttonGradient = Constants.activatedGradient
        imageBorderColor = Constants.activeBorderColor
        if let data = viewModel.data?.data {
            cardTitle = data.title
            cardSubtitle = data.message
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
