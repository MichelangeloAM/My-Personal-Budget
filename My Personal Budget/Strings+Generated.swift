// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Data successfully updated
  internal static let datiAggiornati = L10n.tr("Localazible", "dati_aggiornati")
  /// Please fill in all data fields
  internal static let inserisciAllData = L10n.tr("Localazible", "inserisci_all_data")
  /// LoginInApp
  internal static let loginSegue = L10n.tr("Localazible", "login_segue")
  /// Fill in all the data fields
  internal static let messaggioErrore = L10n.tr("Localazible", "messaggio_errore")
  /// Your new accountant, that fits in your pocket!
  internal static let mottoApp = L10n.tr("Localazible", "motto_app")
  /// My Personal Budget
  internal static let nomeApp = L10n.tr("Localazible", "nome_app")
  /// RegistratiAdApp
  internal static let registratiSegue = L10n.tr("Localazible", "registrati_segue")
  /// Insert
  internal static let scrittaInserisci = L10n.tr("Localazible", "scritta_inserisci")
  /// Log In
  internal static let scrittaLogin = L10n.tr("Localazible", "scritta_login")
  /// Profile
  internal static let scrittaProfilo = L10n.tr("Localazible", "scritta_profilo")
  /// Statistics
  internal static let scrittaStatistiche = L10n.tr("Localazible", "scritta_statistiche")
  /// Hi and welcome! I'll hereby explain the app's functionalities. On the bottom bar you will see 4 options, the first one is this page, the second one (Profile) is for you to modify your personal profile info, the third one is to add new transactions and the fourth one is to view statistics about them.
  internal static let tutorialApp = L10n.tr("Localazible", "tutorial_app")
  /// Click on the '+' button to add a new transaction. Select the type, category and finally the amount and click 'Add' to add it.
  internal static let tutorialInserisci = L10n.tr("Localazible", "tutorial_inserisci")
  /// Here you'll be able to visualize your statistics regarding your transactions to get a better understanding of how you are earning or spending your money on the fly!
  internal static let tutorialStatistiche = L10n.tr("Localazible", "tutorial_statistiche")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
