// Clock Animation with Zoom Stages
// Stage 1: Clock animation → Stage 2: Zoom in → Stage 3: Real-time rotation → Stage 4: Zoom in → Stage 5: App name

class ClockAnimation {
  constructor() {
    this.stage = 1;
    this.angle = Math.PI / 2;
    this.lastAngle = 0;
    this.animationFrame = null;
    this.zoomLevel = 1;
    this.targetZoom = 1;
    this.isInteractive = false;
    
    this.init();
  }

  init() {
    const clockElement = document.querySelector('.clock');
    if (!clockElement) {
      console.error('Clock element not found');
      return;
    }

    this.clockElement = clockElement;
    this.bounds = clockElement.getBoundingClientRect();
    
    // Start with stage 1: Initial clock animation
    this.startStage1();
    
    // Add zoom interaction listeners
    window.addEventListener('wheel', this.handleZoom.bind(this));
    window.addEventListener('mousemove', this.handleMouseMove.bind(this));
  }

  startStage1() {
    // Stage 1: Show animated clock
    this.stage = 1;
    this.animateClockTicking();
  }

  animateClockTicking() {
    // Automatic clock hand rotation
    const tick = () => {
      if (this.stage === 1) {
        this.angle += 0.02; // Smooth rotation
        this.updateClockRotation();
        this.animationFrame = requestAnimationFrame(tick);
      }
    };
    tick();
  }

  handleZoom(event) {
    event.preventDefault();
    
    if (event.deltaY < 0) {
      // Zoom in
      this.advanceStage();
    }
  }

  advanceStage() {
    switch (this.stage) {
      case 1:
        // Zoom into clock
        this.stage = 2;
        this.zoomIn(() => {
          this.stage = 3;
          this.startInteractiveMode();
        });
        break;
      
      case 3:
        // Zoom in again to show app name
        this.stage = 4;
        this.zoomIn(() => {
          this.stage = 5;
          this.showAppName();
        });
        break;
    }
  }

  startInteractiveMode() {
    // Stage 3: Real-time rotation based on mouse movement
    this.isInteractive = true;
    this.showInstructions('Move your mouse to control the clock hands');
  }

  handleMouseMove(event) {
    if (!this.isInteractive || this.stage !== 3) return;

    const { width, height, left, top } = this.bounds;
    const x = event.clientX - left - width / 2;
    const y = event.clientY - top - height / 2;
    
    const currentAngle = Math.atan2(y, x);
    const diff = currentAngle - this.lastAngle;
    
    // Normalize angle difference
    this.angle += diff > Math.PI ? diff - 2 * Math.PI : 
                   diff < -Math.PI ? diff + 2 * Math.PI : diff;
    
    this.lastAngle = currentAngle;
    this.updateClockRotation();
  }

  updateClockRotation() {
    if (this.clockElement) {
      this.clockElement.style.transform = `rotate(${this.angle}rad) scale(${this.zoomLevel})`;
    }
  }

  zoomIn(callback) {
    this.targetZoom = this.zoomLevel * 1.5;
    const duration = 1000; // 1 second
    const startTime = Date.now();
    const startZoom = this.zoomLevel;

    const animate = () => {
      const elapsed = Date.now() - startTime;
      const progress = Math.min(elapsed / duration, 1);
      
      // Ease-in-out animation
      const eased = progress < 0.5 
        ? 2 * progress * progress 
        : -1 + (4 - 2 * progress) * progress;
      
      this.zoomLevel = startZoom + (this.targetZoom - startZoom) * eased;
      this.updateClockRotation();

      if (progress < 1) {
        requestAnimationFrame(animate);
      } else if (callback) {
        callback();
      }
    };

    animate();
  }

  showInstructions(text) {
    const instruction = document.createElement('div');
    instruction.className = 'instruction-text';
    instruction.textContent = text;
    instruction.style.cssText = `
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      color: white;
      font-size: 18px;
      text-align: center;
      animation: fadeIn 0.5s ease-in;
      pointer-events: none;
      z-index: 100;
    `;
    
    document.body.appendChild(instruction);
    
    setTimeout(() => {
      instruction.style.animation = 'fadeOut 0.5s ease-out';
      setTimeout(() => instruction.remove(), 500);
    }, 3000);
  }

  showAppName() {
    // Stage 5: Show PROJECT RAKSHA SUTRA
    this.isInteractive = false;
    
    const appName = document.createElement('div');
    appName.className = 'app-name';
    appName.innerHTML = `
      <h1 style="
        font-size: 48px;
        font-weight: bold;
        color: white;
        text-align: center;
        letter-spacing: 3px;
        text-shadow: 0 4px 8px rgba(0,0,0,0.5);
        animation: zoomIn 1s ease-out;
      ">
        PROJECT RAKSHA SUTRA
      </h1>
      <p style="
        font-size: 24px;
        color: rgba(255,255,255,0.9);
        text-align: center;
        margin-top: 20px;
        animation: fadeIn 1.5s ease-in;
      ">
        Your Digital Protection Thread
      </p>
    `;
    
    appName.style.cssText = `
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      z-index: 200;
    `;
    
    document.body.appendChild(appName);
  }

  destroy() {
    if (this.animationFrame) {
      cancelAnimationFrame(this.animationFrame);
    }
    window.removeEventListener('wheel', this.handleZoom.bind(this));
    window.removeEventListener('mousemove', this.handleMouseMove.bind(this));
  }
}

// CSS Animations
const style = document.createElement('style');
style.textContent = `
  @keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
  }
  
  @keyframes fadeOut {
    from { opacity: 1; }
    to { opacity: 0; }
  }
  
  @keyframes zoomIn {
    from {
      opacity: 0;
      transform: scale(0);
    }
    to {
      opacity: 1;
      transform: scale(1);
    }
  }
  
  .clock {
    transition: transform 0.3s ease-out;
  }
`;
document.head.appendChild(style);

// Initialize when DOM is ready
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', () => {
    new ClockAnimation();
  });
} else {
  new ClockAnimation();
}

export { ClockAnimation };
