# 🎨 Miss Lara AI Chatbot - Visual Design Guide

## Main Container
```
┌─────────────────────────────────────────────────────┐
│  ╔═══════════════════════════════════════════════╗  │
│  ║ HEADER                                        ║  │
│  ║  [🧠] Miss Lara AI              [●Online] ↻   ║  │
│  ║  purple avatar                  green   reset ║  │
│  ╚═══════════════════════════════════════════════╝  │
│                                                      │
│  ╔═══════════════════════════════════════════════╗  │
│  ║ CHAT AREA (White Background)                  ║  │
│  ║                                                ║  │
│  ║  [🧠] ┌─────────────────────────────┐         ║  │
│  ║       │ Hello! 👋 I'm Miss Lara... │         ║  │
│  ║       └─────────────────────────────┘         ║  │
│  ║       Light purple gradient                   ║  │
│  ║                                                ║  │
│  ║                    ┌──────────────────┐ [👤]  ║  │
│  ║                    │ What safety tips │       ║  │
│  ║                    │ can you share?   │       ║  │
│  ║                    └──────────────────┘       ║  │
│  ║                    Purple gradient            ║  │
│  ║                                                ║  │
│  ║  [🧠] ┌─────────────────────────────┐         ║  │
│  ║       │ Great question! Here are... │         ║  │
│  ║       └─────────────────────────────┘         ║  │
│  ║                                                ║  │
│  ╚═══════════════════════════════════════════════╝  │
│                                                      │
│  ┌─────────────────────────────────────────────┐   │
│  │ QUICK ACTIONS (Horizontal Scroll)           │   │
│  │ [🛡️ Safety Tips] [⚠️ Emergency] [🧘 Stress] │   │
│  └─────────────────────────────────────────────┘   │
│                                                      │
│  ┌─────────────────────────────────────────────┐   │
│  │ INPUT FIELD (White)                         │   │
│  │ [😊] Type your message...           [▶️]    │   │
│  │ emoji                              send      │   │
│  └─────────────────────────────────────────────┘   │
│                                                      │
└─────────────────────────────────────────────────────┘
   Outer container: Light purple gradient (#E8D5FF → #D6BEFA)
```

## Color Breakdown

### 🎨 Background Layers
1. **Outer Container**: Light purple gradient (`#E8D5FF` → `#D6BEFA`)
2. **Chat Area**: Pure white (`#FFFFFF`)
3. **Input Field**: Pure white (`#FFFFFF`)

### 💬 Chat Bubbles

#### Lara's Messages (Left-aligned)
```
[🧠] ┌──────────────────────┐
     │ Very light purple    │ ← Gradient: #E8D5FF → #D6BEFA
     │ background           │
     └──────────────────────┘
     Rounded corners (20px)
     Subtle shadow
```

#### User's Messages (Right-aligned)
```
                  ┌──────────────────────┐ [👤]
                  │ Brighter purple      │ ← Gradient: #CB94F7 → #D6BEFA
                  │ background           │
                  └──────────────────────┘
                  Rounded corners (20px)
                  Subtle shadow
```

### 🎯 Interactive Elements

#### Avatar Circle
```
  ┌─────┐
  │ 🧠  │ ← Purple gradient (#CB94F7 → #D6BEFA)
  └─────┘    White icon, purple glow shadow
```

#### Send Button
```
  ┌─────┐
  │ ▶️  │ ← Purple gradient (#CB94F7 → #D6BEFA)
  └─────┘    White icon, circular (40px)
```

#### Quick Action Buttons
```
┌──────────────────┐
│ 🛡️ Safety Tips  │ ← Light purple bg (#E8D5FF → #D6BEFA)
└──────────────────┘    Purple border (#CB94F7)
                        Purple icon
```

#### Online Indicator
```
┌─────────────┐
│ ● Online    │ ← Green background (shade 100)
└─────────────┘    Green dot (shade 600)
                   Green text (shade 700)
```

### ⏳ Typing Indicator
```
[🧠] ┌────────┐
     │ • • •  │ ← Animated purple dots (#CB94F7)
     └────────┘    Light purple background
                   Pulsing animation
```

## Typography

### Headers
- **"Miss Lara AI"**: 24px, Bold, Black87
- **"Online"**: 12px, Semi-bold, Green shade 700

### Messages
- **Content**: Default size, Black87
- **Timestamps**: Small, Black54

### Input
- **Placeholder**: Grey ("Type your message...")
- **User input**: Black87

## Spacing & Layout

### Padding
- Main container: 20px all sides
- Chat bubbles: 16px horizontal, 12px vertical
- Input field: 16px horizontal, 8px vertical

### Margins
- Between bubbles: 12px
- Main container from edges: 16px
- Between sections: 12px

### Border Radius
- Main container: 30px
- Chat area: 20px
- Chat bubbles: 20px (with one corner 4px for chat tail effect)
- Input field: 30px
- Buttons: 20px
- Avatar: 25px (circular)

## Animations

1. **Typing Indicator**: Pulsing dots (600ms cycle)
2. **Auto-scroll**: Smooth scroll to bottom (300ms)
3. **Button Press**: Subtle scale effect
4. **Message Appear**: Fade in from bottom

## Accessibility

- ✅ High contrast text (Black87 on white)
- ✅ Large touch targets (40px minimum)
- ✅ Clear visual hierarchy
- ✅ Consistent color meanings (purple = app theme, green = online)
- ✅ Readable font sizes

## Responsive Behavior

- Chat area expands to fill available space
- Quick action buttons scroll horizontally
- Messages wrap text properly
- Keyboard doesn't overlap input field

## State Indicators

1. **Empty State**: Loading spinner (purple)
2. **Typing State**: Animated dots in bubble
3. **Online State**: Green indicator with dot
4. **Timestamps**: Smart formatting (Just now, 5m ago, etc.)

---

**Design Philosophy**: 
Maintain the app's signature purple/lavender aesthetic while ensuring a clean, modern, and user-friendly chat interface. Every element uses the same color palette for perfect consistency! 💜
