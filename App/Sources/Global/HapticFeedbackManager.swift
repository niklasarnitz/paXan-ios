// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

/// Use the shared singleton to generate different haptic feedbacks for the user.
final class HapticFeedbackManager {
    // MARK: - Properties
    /// Globally accessible singleton
    static let shared = HapticFeedbackManager()

    /// Generates an Impact Feedback
    private let impactGenerator = UIImpactFeedbackGenerator(style: .medium)
    /// Generates an Feedback for success, failure and warning
    private let actionGenerator = UINotificationFeedbackGenerator()
    /// Generates an Feedback for selection change.
    private let selectionGenerator = UISelectionFeedbackGenerator()

    // MARK: - Initialization
    /// Initializes an HapticFeedbackManager privately
    private init() {
        // This is supposed to be empty
    }

    /// Makes sure singletion initialization did happen.
    func configure() {
        // Make sure singletion initialization did happen.
    }

    // MARK: - Methods
    /// Generates a medium impact feedback.
    func generateImpact() { impactGenerator.impactOccurred() }

    /// Generates a failure feedback.
    func generateError() { actionGenerator.notificationOccurred(.error) }
    /// Generates a success feedback.
    func generateSuccess() { actionGenerator.notificationOccurred(.success) }
    /// Generates a warning feedback.
    func generateWarning() { actionGenerator.notificationOccurred(.warning) }

    /// Generates a selection change feedback.
    func generateSelection() { selectionGenerator.selectionChanged() }
}
