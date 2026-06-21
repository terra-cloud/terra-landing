/* ==========================================================================
   Terra.Ph Technologies Inc. - Interactive Mechanics & WebGL Canvas
   ========================================================================== */

document.addEventListener('DOMContentLoaded', () => {
  // Mark body as JS-ready so reveal animations activate
  document.body.classList.add('js-ready');

  // Initialize Lucide Icons
  if (typeof lucide !== 'undefined' && document.querySelector('i[data-lucide]')) {
    lucide.createIcons();
  }

  initMobileMenu();
  initStarryBackground();
  initScrollObserver();
  initTestimonialDeck();
  initContactForm();
  initLiveStatsFluke();
  initTypingAnimation();

  // Create a MutationObserver to automatically keep the Three.js canvas
  // and Lucide Icons intact even when Jaspr client-side hydration replaces
  // DOM nodes (preventing any race conditions).
  const hydrationObserver = new MutationObserver(() => {
    // 1. Re-init Three.js blob if container exists but is empty/missing its canvas
    const container = document.getElementById('blob-canvas-container');
    if (container && !container.querySelector('canvas')) {
      initThreeJSBlob();
      initScrollObserver(); // Re-run scroll observer to catch any newly attached elements
    }

    // 2. Re-render Lucide icons if any unprocessed i[data-lucide] tags exist
    if (typeof lucide !== 'undefined' && document.querySelector('i[data-lucide]')) {
      lucide.createIcons();
    }

    // 3. Re-init typing animation if the container has been replaced (lacks the active attribute)
    const typedText = document.querySelector('.typed-text');
    if (typedText && !typedText.hasAttribute('data-typing-active')) {
      initTypingAnimation();
    }
  });

  hydrationObserver.observe(document.body, { childList: true, subtree: true });

  // Fallback timeout in case no mutations occur but page hydration finished
  setTimeout(() => {
    const container = document.getElementById('blob-canvas-container');
    if (container && !container.querySelector('canvas')) {
      initThreeJSBlob();
      initScrollObserver();
    }
    if (typeof lucide !== 'undefined' && document.querySelector('i[data-lucide]')) {
      lucide.createIcons();
    }
    const typedText = document.querySelector('.typed-text');
    if (typedText && !typedText.hasAttribute('data-typing-active')) {
      initTypingAnimation();
    }
  }, 500);
});


/* ==========================================================================
   Mobile Navigation Menu
   ========================================================================== */
function initMobileMenu() {
  const toggleBtn = document.getElementById('mobile-toggle');
  const mobileMenu = document.getElementById('mobile-menu');
  const menuLinks = document.querySelectorAll('.mobile-link');

  if (!toggleBtn || !mobileMenu) return;

  toggleBtn.addEventListener('click', () => {
    const isActive = mobileMenu.classList.toggle('active');
    // Change menu icon to close icon if active
    const icon = toggleBtn.querySelector('i');
    if (icon) {
      if (isActive) {
        icon.setAttribute('data-lucide', 'x');
      } else {
        icon.setAttribute('data-lucide', 'menu');
      }
      lucide.createIcons({ attrs: { class: 'lucide' } });
    }
  });

  // Close menu when a link is clicked
  menuLinks.forEach(link => {
    link.addEventListener('click', () => {
      mobileMenu.classList.remove('active');
      const icon = toggleBtn.querySelector('i');
      if (icon) {
        icon.setAttribute('data-lucide', 'menu');
        lucide.createIcons({ attrs: { class: 'lucide' } });
      }
    });
  });
}

/* ==========================================================================
   Starry Background Canvas (Rise & Fade Particle System)
   ========================================================================== */
function initStarryBackground() {
  const canvas = document.getElementById('stars-canvas');
  if (!canvas) return;
  const ctx = canvas.getContext('2d');

  let stars = [];
  const maxStars = 100; // More quantity for a rich backdrop

  // Color palette: purple, violet, cyan, white-blue tones
  const starColors = [
    [139, 92, 246],   // purple (primary)
    [99, 102, 241],   // indigo
    [167, 139, 250],  // violet light
    [255, 255, 255],  // pure white
  ];

  function resizeCanvas() {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
  }

  resizeCanvas();
  window.addEventListener('resize', () => {
    resizeCanvas();
    // Re-clamp existing stars to new dimensions
    stars.forEach(s => {
      s.x = Math.random() * canvas.width;
    });
  });

  class Star {
    constructor() {
      this.reset(true);
    }

    reset(initial = false) {
      this.x = Math.random() * canvas.width;

      // On initial load, distribute across full screen height so
      // particles are visible immediately without waiting for them to rise.
      // On recycle, spawn at the bottom 10% to keep the upward flow going.
      if (initial) {
        this.y = Math.random() * canvas.height;
      } else {
        // Spawn in the bottom quarter so they rise through the screen
        this.y = canvas.height * 0.75 + Math.random() * (canvas.height * 0.35);
      }

      // Size: mix of tiny twinkles and slightly larger points (sharp & non-pixelated)
      const sizeRoll = Math.random();
      if (sizeRoll > 0.95) {
        this.size = Math.random() * 0.3 + 0.9; // large: 0.9–1.2px
        this.glowRadius = this.size * 2;
      } else if (sizeRoll > 0.80) {
        this.size = Math.random() * 0.3 + 0.6; // medium: 0.6–0.9px
        this.glowRadius = this.size * 1.5;
      } else {
        this.size = Math.random() * 0.3 + 0.3; // small: 0.3–0.6px (very sharp points)
        this.glowRadius = 0; // No glow for smallest to keep them crisp
      }

      // Pick a random color from palette
      this.color = starColors[Math.floor(Math.random() * starColors.length)];

      // Rise speed — larger particles move faster for parallax depth feel
      this.vy = -(Math.random() * 0.45 + 0.08) * (this.size / 1.5);

      // Opacity
      this.alpha = initial ? Math.random() * 0.5 + 0.1 : 0;
      this.maxAlpha = Math.random() * 0.75 + 0.25; // 0.25–1.0
      this.fadeInSpeed = Math.random() * 0.025 + 0.008;
      this.isFadingIn = !initial; // Initial stars start visible
    }

    update() {
      this.y += this.vy;

      if (this.isFadingIn) {
        this.alpha += this.fadeInSpeed;
        if (this.alpha >= this.maxAlpha) {
          this.alpha = this.maxAlpha;
          this.isFadingIn = false;
        }
      } else {
        // Very slow fade out — only after reaching the top 10% of screen
        if (this.y < canvas.height * 0.1) {
          this.alpha -= 0.004;
        }
      }

      // Recycle when off-screen or fully faded
      if (this.y < -this.size * 2 || this.alpha <= 0) {
        this.reset(false);
      }
    }

    draw() {
      const [r, g, b] = this.color;

      ctx.save();
      if (this.glowRadius > 0) {
        ctx.shadowBlur = this.glowRadius;
        ctx.shadowColor = `rgba(${r}, ${g}, ${b}, ${this.alpha * 0.8})`;
      }

      ctx.beginPath();
      ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
      ctx.fillStyle = `rgba(${r}, ${g}, ${b}, ${this.alpha})`;
      ctx.fill();
      ctx.restore();
    }
  }

  // Populate stars
  for (let i = 0; i < maxStars; i++) {
    stars.push(new Star());
  }

  function animate() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    stars.forEach(star => {
      star.update();
      star.draw();
    });
    requestAnimationFrame(animate);
  }

  animate();
}



/* ==========================================================================
   WebGL Three.js Morphing 3D Blob with Custom Shaders (Reference 1)
   ========================================================================== */
function initThreeJSBlob() {
  const container = document.getElementById('blob-canvas-container');
  if (!container) return;

  // Clear any existing canvas (e.g., from a previous init before hydration)
  container.innerHTML = '';

  // Scene setup
  const scene = new THREE.Scene();

  // Camera - Handle initial 0x0 size to prevent NaN aspect ratio crash
  let aspect = container.clientWidth / container.clientHeight;
  if (isNaN(aspect) || !isFinite(aspect) || aspect === 0) {
    aspect = 1.0;
  }
  const camera = new THREE.PerspectiveCamera(45, aspect, 0.1, 100);
  camera.position.z = 8;

  // Renderer
  const renderer = new THREE.WebGLRenderer({ alpha: true, antialias: true });
  const initW = container.clientWidth || 300;
  const initH = container.clientHeight || 300;
  renderer.setSize(initW, initH);
  renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
  container.appendChild(renderer.domElement);

  // Resize handler
  window.addEventListener('resize', () => {
    const w = container.clientWidth;
    const h = container.clientHeight;
    if (w > 0 && h > 0) {
      camera.aspect = w / h;
      camera.updateProjectionMatrix();
      renderer.setSize(w, h);
    }
  });

  // Track Mouse movement for interaction
  let mouse = { x: 0, y: 0, targetX: 0, targetY: 0 };

  window.addEventListener('mousemove', (e) => {
    // Normalise mouse coords between -1 and 1
    mouse.targetX = (e.clientX / window.innerWidth) * 2 - 1;
    mouse.targetY = -(e.clientY / window.innerHeight) * 2 + 1;
  });

  // Custom Shader Code: Simplex 3D Noise GLSL (Ian McEwan / Ashima Arts)
  const simplexNoiseGLSL = `
    vec3 mod289(vec3 x) { return x - floor(x * (1.0 / 289.0)) * 289.0; }
    vec4 mod289(vec4 x) { return x - floor(x * (1.0 / 289.0)) * 289.0; }
    vec4 permute(vec4 x) { return mod289(((x*34.0)+1.0)*x); }
    vec4 taylorInvSqrt(vec4 r) { return 1.79284291400159 - 0.85373472095314 * r; }
    
    float snoise(vec3 v) {
      const vec2 C = vec2(1.0/6.0, 1.0/3.0);
      const vec4 D = vec4(0.0, 0.5, 1.0, 2.0);
      
      vec3 i  = floor(v + dot(v, C.yyy));
      vec3 x0 = v - i + dot(i, C.xxx);
      
      vec3 g = step(x0.yzx, x0.xyz);
      vec3 l = 1.0 - g;
      vec3 i1 = min(g.xyz, l.zxy);
      vec3 i2 = max(g.xyz, l.zxy);
      
      vec3 x1 = x0 - i1 + C.xxx;
      vec3 x2 = x0 - i2 + C.yyy;
      vec3 x3 = x0 - D.yyy;
      
      i = mod289(i);
      vec4 p = permute(permute(permute(
                i.z + vec4(0.0, i1.z, i2.z, 1.0))
              + i.y + vec4(0.0, i1.y, i2.y, 1.0))
              + i.x + vec4(0.0, i1.x, i2.x, 1.0));
              
      float n_ = 0.142857142857;
      vec3 ns = n_ * D.wyz - D.xzx;
      
      vec4 j = p - 49.0 * floor(p * ns.z * ns.z);
      
      vec4 x_ = floor(j * ns.z);
      vec4 y_ = floor(j - 7.0 * x_);
      
      vec4 x = x_ * ns.x + ns.yyyy;
      vec4 y = y_ * ns.x + ns.yyyy;
      vec4 h = 1.0 - abs(x) - abs(y);
      
      vec4 b0 = vec4(x.xy, y.xy);
      vec4 b1 = vec4(x.zw, y.zw);
      
      vec4 s0 = floor(b0)*2.0 + 1.0;
      vec4 s1 = floor(b1)*2.0 + 1.0;
      vec4 sh = -step(h, vec4(0.0));
      
      vec4 a0 = b0.xzyw + s0.xzyw*sh.xxyy;
      vec4 a1 = b1.xzyw + s1.xzyw*sh.zzww;
      
      vec3 p0 = vec3(a0.xy, h.x);
      vec3 p1 = vec3(a0.zw, h.y);
      vec3 p2 = vec3(a1.xy, h.z);
      vec3 p3 = vec3(a1.zw, h.w);
      
      vec4 norm = taylorInvSqrt(vec4(dot(p0,p0), dot(p1,p1), dot(p2,p2), dot(p3,p3)));
      p0 *= norm.x;
      p1 *= norm.y;
      p2 *= norm.z;
      p3 *= norm.w;
      
      vec4 m = max(0.6 - vec4(dot(x0,x0), dot(x1,x1), dot(x2,x2), dot(x3,x3)), 0.0);
      m = m * m;
      return 42.0 * dot(m*m, vec4(dot(p0,x0), dot(p1,x1), dot(p2,x2), dot(p3,x3)));
    }
  `;

  // Vertex Shader
  const vertexShader = `
    uniform float u_time;
    uniform float u_noiseFreq;
    uniform float u_noiseAmp;
    uniform vec2 u_mouse;
    
    varying vec3 vNormal;
    varying vec3 vPosition;
    varying vec3 vViewPosition;
    
    ${simplexNoiseGLSL}
    
    void main() {
      vNormal = normalize(normalMatrix * normal);
      vPosition = position;
      
      // Compute vertex displacement based on noise and time
      // REDUCED Z-axis frequency multiplier (u_noiseFreq * 0.2) to make waves fewer in the z dimension
      vec3 noiseOffset = vec3(position.x * u_noiseFreq + u_time * 0.45, 
                              position.y * u_noiseFreq + u_time * 0.35, 
                              position.z * (u_noiseFreq * 0.2) + u_mouse.x * 0.8);
                              
      float displacement = snoise(noiseOffset) * u_noiseAmp;
      
      // Shift geometry slightly in direction of mouse coordinates
      vec3 displacedPos = position + normal * displacement;
      displacedPos.x += u_mouse.x * 0.3 * (1.0 - position.y / 3.0);
      displacedPos.y += u_mouse.y * 0.3;
      
      vec4 mvPosition = modelViewMatrix * vec4(displacedPos, 1.0);
      vViewPosition = -mvPosition.xyz;
      
      gl_Position = projectionMatrix * mvPosition;
    }
  `;

  // Fragment Shader (Glowing Fresnel Gradient)
  const fragmentShader = `
    uniform vec3 u_color1;
    uniform vec3 u_color2;
    uniform vec3 u_color3;
    
    varying vec3 vNormal;
    varying vec3 vViewPosition;
    varying vec3 vPosition;
    
    void main() {
      vec3 normal = normalize(vNormal);
      vec3 viewDir = normalize(vViewPosition);
      
      // Fresnel effect (glow along the edges)
      float fresnel = pow(1.0 - dot(normal, viewDir), 2.5);
      
      // Top-down color gradient
      float heightGradient = (vPosition.y + 2.5) / 5.0;
      vec3 baseGradient = mix(u_color1, u_color3, heightGradient);
      
      // Add neon cyan glow on the outer edges
      vec3 finalColor = mix(baseGradient, u_color2, fresnel * 0.9);
      
      // Specular highlights (Fake light from top-left)
      vec3 lightDir = normalize(vec3(1.2, 1.5, 1.0));
      float specular = pow(max(dot(normal, lightDir), 0.0), 40.0);
      finalColor += vec3(0.3) * specular;
      
      gl_FragColor = vec4(finalColor, 0.95);
    }
  `;

  // Setup ShaderMaterial
  const uniforms = {
    u_time: { value: 0 },
    u_noiseFreq: { value: 0.5 },
    u_noiseAmp: { value: 0.45 }, // Reduced amplitude slightly for a smoother bubble feel
    u_mouse: { value: new THREE.Vector2(0, 0) },
    u_color1: { value: new THREE.Color(0x8b5cf6) }, // Violet
    u_color2: { value: new THREE.Color(0x0ea5e9) }, // Cyan
    u_color3: { value: new THREE.Color(0x6366f1) }  // Indigo
  };

  const material = new THREE.ShaderMaterial({
    vertexShader: vertexShader,
    fragmentShader: fragmentShader,
    uniforms: uniforms,
    transparent: true
  });

  // Geometry (High poly sphere for smooth deformation)
  const geometry = new THREE.IcosahedronGeometry(2.4, 64);
  const mesh = new THREE.Mesh(geometry, material);
  scene.add(mesh);

  // Animation Loop
  const clock = new THREE.Clock();

  function animateBlob() {
    requestAnimationFrame(animateBlob);

    const elapsedTime = clock.getElapsedTime();
    uniforms.u_time.value = elapsedTime;

    // Smoothly interpolate mouse targets
    mouse.x += (mouse.targetX - mouse.x) * 0.06;
    mouse.y += (mouse.targetY - mouse.y) * 0.06;
    uniforms.u_mouse.value.set(mouse.x, mouse.y);

    // Spin slowly
    mesh.rotation.y = elapsedTime * 0.12;
    mesh.rotation.x = elapsedTime * 0.05;

    // Dynamically adjust layout once client size is loaded/non-zero
    const w = container.clientWidth;
    const h = container.clientHeight;
    if (w > 0 && h > 0) {
      const currentAspect = w / h;
      if (Math.abs(camera.aspect - currentAspect) > 0.01 || renderer.domElement.width !== w) {
        camera.aspect = currentAspect;
        camera.updateProjectionMatrix();
        renderer.setSize(w, h);
      }
    }

    renderer.render(scene, camera);
  }

  animateBlob();
}

/* ==========================================================================
   Intersection Observer (Scroll-Reveal & 3D Card Tilts)
   ========================================================================== */
function initScrollObserver() {
  const reveals = document.querySelectorAll('.reveal:not(.visible)');
  const ctaCard = document.querySelector('.cta-card:not(.visible)');

  const observerOptions = {
    root: null,
    rootMargin: '200px 0px',  // generous margin so near-viewport elements trigger
    threshold: 0.05
  };

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
        observer.unobserve(entry.target);
      }
    });
  }, observerOptions);

  reveals.forEach(el => observer.observe(el));
  if (ctaCard) observer.observe(ctaCard);

  // JavaScript 3D Tilt Effect on mouse movement over Service Cards
  const serviceCards = document.querySelectorAll('.service-card');
  serviceCards.forEach(card => {
    const wrapper = card.querySelector('.mockup-tilt-wrapper');
    if (!wrapper) return;
    const mockup = wrapper.querySelector('.mockup-card');
    if (!mockup) return;

    card.addEventListener('mousemove', (e) => {
      const rect = card.getBoundingClientRect();
      const x = e.clientX - rect.left; // x coordinate within component
      const y = e.clientY - rect.top;  // y coordinate within component

      // Calculate rotation based on cursor position relative to card center
      const centerX = rect.width / 2;
      const centerY = rect.height / 2;
      const rotateX = -(y - centerY) / 12; // tilt angle
      const rotateY = (x - centerX) / 12;  // tilt angle

      mockup.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) scale3d(1.05, 1.05, 1.05)`;
    });

    card.addEventListener('mouseleave', () => {
      // Revert to original tilted visual layout values
      mockup.style.transform = '';
    });
  });
}

/* ==========================================================================
   Stacked Testimonial Deck Slider (Reference 2)
   ========================================================================== */
function initTestimonialDeck() {
  const prevBtn = document.getElementById('deck-prev');
  const nextBtn = document.getElementById('deck-next');
  const deck = document.getElementById('testimonial-deck');
  if (!deck) return;
  const cards = Array.from(deck.children);
  let activeIndex = 0;

  function updateDeck() {
    cards.forEach((card, idx) => {
      // Clean up previous classes
      card.classList.remove('active', 'next', 'last', 'swipe-out');

      let relativeIndex = (idx - activeIndex + cards.length) % cards.length;

      if (relativeIndex === 0) {
        card.classList.add('active');
      } else if (relativeIndex === 1) {
        card.classList.add('next');
      } else if (relativeIndex === 2) {
        card.classList.add('last');
      }
    });
  }

  // Initial state setup
  updateDeck();

  if (nextBtn) {
    nextBtn.addEventListener('click', () => {
      const currentCard = cards[activeIndex];
      currentCard.classList.add('swipe-out');

      // Wait for swipe transition to finish before wrapping index
      setTimeout(() => {
        activeIndex = (activeIndex + 1) % cards.length;
        updateDeck();
      }, 350);
    });
  }

  if (prevBtn) {
    prevBtn.addEventListener('click', () => {
      // Rotate backwards
      activeIndex = (activeIndex - 1 + cards.length) % cards.length;
      updateDeck();
    });
  }
}

/* ==========================================================================
   Interactive Stats Fluke (Simulate Activity)
   ========================================================================== */
function initLiveStatsFluke() {
  const successRateText = document.getElementById('success-percent');
  const progressBarFill = document.querySelector('#card-stats-success .progress-bar-fill');
  if (!successRateText) return;

  setInterval(() => {
    // Fluctuate success rate between 95.8% and 96.4%
    const base = 96.0;
    const variation = (Math.random() * 0.6 - 0.3).toFixed(1);
    const resolvedRate = (parseFloat(base) + parseFloat(variation)).toFixed(1);

    successRateText.textContent = `${resolvedRate}%`;
    if (progressBarFill) {
      progressBarFill.style.width = `${resolvedRate}%`;
    }
  }, 4000);
}

/* ==========================================================================
   Contact Form Handler
   ========================================================================== */
function initContactForm() {
  const form = document.getElementById('contact-form');
  const successBox = document.getElementById('form-success');

  if (!form || !successBox) return;

  form.addEventListener('submit', (e) => {
    e.preventDefault();
    const btn = form.querySelector('.btn-submit');
    const originalText = btn.innerHTML;

    // Set sending state
    btn.disabled = true;
    btn.innerHTML = `<span>Sending...</span> <i data-lucide="loader" class="animate-spin"></i>`;
    if (typeof lucide !== 'undefined') {
      lucide.createIcons({ attrs: { class: 'animate-spin' } });
    }

    // Get input values
    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const projectType = document.getElementById('project_type').value;
    const message = document.getElementById('message').value;

    // Submit form via FormSubmit AJAX API
    fetch('https://formsubmit.co/ajax/terraservices.ph@gmail.com', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: JSON.stringify({
        Name: name,
        Email: email,
        'Project Type': projectType,
        Message: message
      })
    })
      .then(response => response.json())
      .then(data => {
        if (data.success === 'true' || data.success === true) {
          form.style.transition = 'opacity 0.4s ease';
          form.style.opacity = '0';
          setTimeout(() => {
            form.style.display = 'none';
            successBox.classList.add('active');
          }, 400);
        } else {
          alert('Something went wrong. Please try again.');
          btn.disabled = false;
          btn.innerHTML = originalText;
          if (typeof lucide !== 'undefined') {
            lucide.createIcons();
          }
        }
      })
      .catch(error => {
        console.error('Error submitting form:', error);
        alert('Failed to send message. Please check your connection and try again.');
        btn.disabled = false;
        btn.innerHTML = originalText;
        if (typeof lucide !== 'undefined') {
          lucide.createIcons();
        }
      });
  });
}

let typingTimeout = null;

function initTypingAnimation() {
  const typedSpan = document.querySelector('.typed-text');
  if (!typedSpan) return;
  
  // Set attribute to prevent multiple observer initializations
  typedSpan.setAttribute('data-typing-active', 'true');
  const cursorSpan = document.querySelector('.typed-cursor');

  // Clear any existing typing animation loop
  if (typingTimeout) {
    clearTimeout(typingTimeout);
    typingTimeout = null;
  }

  // Define words and cycle colors strictly between purple (#a855f7) and blue (#0ea5e9)
  const words = [
    { text: "Scalable", color: "#a855f7" },      // Purple
    { text: "Intelligent", color: "#0ea5e9" },  // Blue
    { text: "Future-Proof", color: "#a855f7" }, // Purple
    { text: "Resilient", color: "#0ea5e9" }     // Blue
  ];
  let wordIndex = 0;
  let charIndex = 0;
  let isDeleting = false;

  // Set initial color
  typedSpan.style.color = words[wordIndex].color;
  if (cursorSpan) {
    cursorSpan.style.color = words[wordIndex].color;
  }

  function type() {
    // If the element is no longer in the DOM, stop the animation loop
    if (!document.body.contains(typedSpan)) {
      return;
    }

    const currentWord = words[wordIndex];

    // Set colors dynamically
    typedSpan.style.color = currentWord.color;
    if (cursorSpan) {
      cursorSpan.style.color = currentWord.color;
    }

    if (isDeleting) {
      typedSpan.textContent = currentWord.text.substring(0, charIndex - 1);
      charIndex--;
    } else {
      typedSpan.textContent = currentWord.text.substring(0, charIndex + 1);
      charIndex++;
    }

    let typeSpeed = isDeleting ? 30 : 60; // Faster delete, smooth typing

    if (!isDeleting && charIndex === currentWord.text.length) {
      typeSpeed = 2200; // Pause at end of word
      isDeleting = true;
    } else if (isDeleting && charIndex === 0) {
      isDeleting = false;
      wordIndex = (wordIndex + 1) % words.length;
      typeSpeed = 400; // Pause before typing next word
    }

    typingTimeout = setTimeout(type, typeSpeed);
  }

  type();
}
