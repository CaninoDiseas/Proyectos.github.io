<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Para Bella - Mi Amor</title>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Playfair+Display:ital@1&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body { margin: 0; overflow: hidden; background-color: #050505; font-family: 'Dancing Script', cursive; }
        .menu-screen { background: radial-gradient(circle, #2d0000 0%, #000 100%); }
        .sparkle { position: absolute; width: 4px; height: 4px; border-radius: 50%; background: #fff; box-shadow: 0 0 10px #fff; animation: twinkle 1.5s infinite; }
        @keyframes twinkle { 0%, 100% { opacity: 0; } 50% { opacity: 1; } }
        .falling-element { position: absolute; top: -50px; animation: fall linear infinite; cursor: pointer; opacity: 0.8; filter: drop-shadow(0 0 8px rgba(255, 255, 255, 0.5)); }
        @keyframes fall { to { transform: translateY(100vh) rotate(360deg); } }
        #experience-wrapper { position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 500px; height: 500px; display: flex; align-items: center; justify-content: center; }
        .love-word { position: absolute; color: #ff0055; font-size: 1.1rem; transition: opacity 0.8s; opacity: 0; cursor: pointer; text-shadow: 0 0 10px #ff0055; }
        .name-bella { font-size: 5rem; color: #ffffff; text-shadow: 0 0 25px #ff0055, 0 0 50px #ff0055; font-family: 'Dancing Script', cursive; opacity: 0; transition: opacity 5s; cursor: pointer; z-index: 10; }
        .popup { position: fixed; bottom: 10%; left: 50%; transform: translateX(-50%); color: white; background: rgba(255, 0, 85, 0.9); padding: 15px 30px; border-radius: 50px; opacity: 0; transition: opacity 0.5s; pointer-events: none; font-size: 1.5rem; text-align: center; z-index: 100; border: 1px solid #fff; }
    </style>
</head>
<body>

    <audio id="bg-music" loop><source src="https://www.soundhelix.com/examples/mp3/SoundHelix-Song-16.mp3" type="audio/mpeg"></audio>
    <div id="popup" class="popup"></div>

    <div id="start-screen" class="menu-screen flex flex-col items-center justify-center h-screen text-white text-center z-50 relative">
        <h1 class="text-6xl mb-10 italic">Para el amor de mi vida</h1>
        <button onclick="startExperience()" class="px-12 py-6 border border-pink-500 rounded-full text-4xl hover:bg-pink-900 transition duration-700 shadow-[0_0_30px_rgba(255,0,85,0.4)] hover:scale-105 transform">Empezar</button>
    </div>

    <div id="exp-screen" class="hidden h-screen w-full bg-black relative">
        <div id="canvas-container" class="absolute inset-0"></div>
        <div id="experience-wrapper">
            <div id="heart-container"></div>
            <div id="name-bella" class="name-bella" onclick="showMessage('Eres la única que quiero por el resto de mi vida')">Bella</div>
        </div>
    </div>

    <script>
        function showMessage(msg) {
            const p = document.getElementById('popup');
            p.innerText = msg;
            p.style.opacity = "1";
            setTimeout(() => { p.style.opacity = "0"; }, 3000);
        }

        function createSparkle(x, y) {
            const s = document.createElement('div');
            s.className = 'sparkle';
            s.style.left = x + 'px';
            s.style.top = y + 'px';
            document.body.appendChild(s);
            setTimeout(() => s.remove(), 1500);
        }

        function startExperience() {
            document.getElementById('bg-music').play().catch(() => {});
            document.getElementById('start-screen').classList.add('hidden');
            document.getElementById('exp-screen').classList.remove('hidden');
            setInterval(createFallingElement, 600);
            drawHeartWords();
        }

        function createFallingElement() {
            const container = document.getElementById('canvas-container');
            const el = document.createElement('div');
            const type = Math.random() > 0.5 ? '❤️' : '👁️';
            el.innerHTML = type;
            el.className = 'falling-element text-2xl';
            el.style.left = Math.random() * 100 + 'vw';
            el.style.animationDuration = (Math.random() * 5 + 4) + 's';
            el.onmouseenter = (e) => createSparkle(e.pageX, e.pageY);
            el.onclick = () => showMessage(type === '👁️' ? 'Tus ojos me hipnotizan y me enamoran cada vez más' : 'Aceleras mi corazón siempre que estoy contigo');
            container.appendChild(el);
            setTimeout(() => el.remove(), 10000);
        }

        function drawHeartWords() {
            const container = document.getElementById('heart-container');
            for (let i = 0; i < 70; i++) {
                const t = (i / 70) * Math.PI * 2;
                const x = 16 * Math.sin(t) ** 3;
                const y = -(13 * Math.cos(t) - 5 * Math.cos(2 * t) - 2 * Math.cos(3 * t) - Math.cos(4 * t));
                const span = document.createElement('span');
                span.className = 'love-word';
                span.innerText = "Love you";
                span.style.left = (x * 16 + 230) + 'px';
                span.style.top = (y * 16 + 220) + 'px';
                span.onclick = () => showMessage('Estás en mi cabeza en todo momento');
                span.onmouseover = (e) => createSparkle(e.pageX, e.pageY);
                container.appendChild(span);
                setTimeout(() => { span.style.opacity = "1"; }, i * 80);
            }
            setTimeout(() => { document.getElementById('name-bella').style.opacity = "1"; }, 6000);
        }
    </script>
</body>
</html>
