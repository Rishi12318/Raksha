// Raksha Sutra - Miss Lara AI Chatbot
// Color Palette Reference

/*
 * PRIMARY COLORS (Purple/Lavender Theme)
 * =====================================
 */

// Main purple gradient
const primaryGradient = [
  Color(0xFFCB94F7), // Bright purple
  Color(0xFFD6BEFA), // Light lavender
];

// Light background gradient
const lightBackgroundGradient = [
  Color(0xFFE8D5FF), // Very light purple
  Color(0xFFD6BEFA), // Light lavender
];

// Container backgrounds
const containerBackground = Colors.white; // #FFFFFF

/*
 * CHAT BUBBLE COLORS
 * ==================
 */

// Lara's messages (AI responses)
const laraMessageGradient = [
  Color(0xFFE8D5FF), // Very light purple
  Color(0xFFD6BEFA), // Light lavender
];

// User's messages
const userMessageGradient = [
  Color(0xFFCB94F7), // Bright purple
  Color(0xFFD6BEFA), // Light lavender
];

/*
 * UI ELEMENTS
 * ===========
 */

// Avatar circle
const avatarGradient = [
  Color(0xFFCB94F7), // Bright purple
  Color(0xFFD6BEFA), // Light lavender
];

// Avatar shadow
final avatarShadow = BoxShadow(
  color: Color(0xFFCB94F7).withOpacity(0.4),
  blurRadius: 8,
  offset: Offset(0, 4),
);

// Online status indicator
const onlineIndicatorBackground = Colors.green.shade100;
const onlineIndicatorDot = Colors.green.shade600;
const onlineIndicatorText = Colors.green.shade700;

// Send button
const sendButtonGradient = [
  Color(0xFFCB94F7), // Bright purple
  Color(0xFFD6BEFA), // Light lavender
];
const sendButtonIcon = Colors.white;

// Quick action buttons
const quickActionBackground = [
  Color(0xFFE8D5FF), // Very light purple
  Color(0xFFD6BEFA), // Light lavender
];
const quickActionBorder = Color(0xFFCB94F7); // Bright purple
const quickActionIcon = Color(0xFFCB94F7); // Bright purple

// Typing indicator dots
const typingDotColor = Color(0xFFCB94F7); // Bright purple

/*
 * TEXT COLORS
 * ===========
 */
const primaryText = Colors.black87;
const secondaryText = Colors.black54;
const hintText = Colors.grey;

/*
 * SHADOWS & EFFECTS
 * =================
 */
final containerShadow = BoxShadow(
  color: Colors.black.withOpacity(0.1),
  blurRadius: 15,
  offset: Offset(0, 5),
);

final bubbleShadow = BoxShadow(
  color: Colors.black.withOpacity(0.05),
  blurRadius: 5,
  offset: Offset(0, 2),
);

final inputShadow = BoxShadow(
  color: Colors.black.withOpacity(0.05),
  blurRadius: 10,
  offset: Offset(0, 2),
);

/*
 * BORDER RADIUS
 * =============
 */
const mainContainerRadius = 30.0;
const innerContainerRadius = 20.0;
const avatarRadius = 25.0;
const bubbleRadius = 20.0;
const inputRadius = 30.0;
const buttonRadius = 20.0;

/*
 * COLOR USAGE SUMMARY
 * ===================
 * 
 * Purple Gradient (#CB94F7 to #D6BEFA):
 * - Avatar circle
 * - Send button
 * - User message bubbles
 * - Quick action icons
 * - Typing indicator dots
 * 
 * Light Purple Gradient (#E8D5FF to #D6BEFA):
 * - Main container background
 * - Lara message bubbles
 * - Quick action buttons
 * 
 * White (#FFFFFF):
 * - Chat area background
 * - Input field background
 * - Send button icon
 * 
 * Green (various shades):
 * - Online status indicator only
 * 
 * Black (87%, 54% opacity):
 * - Text content
 * - Icons
 * 
 * Shadows:
 * - Black with 5-10% opacity
 * - Subtle depth effects
 */
