document.addEventListener('DOMContentLoaded', function() {
    // Variables
    const backgroundSlideshow = document.getElementById('background-slideshow');
    const playButton = document.getElementById('play-button');
    const volumeButton = document.getElementById('volume-button');
    const volumeSliderContainer = document.getElementById('volume-slider-container');
    const volumeSlider = document.getElementById('volume-slider');
    const volumePercentage = document.getElementById('volume-percentage');
    const audio = document.getElementById('background-audio');
    const modsLoadedElement = document.getElementById('mods-loaded');
    const loadingPercentageElement = document.getElementById('loading-percentage');
    const messageElement = document.getElementById('message');
    
    let isPlaying = false;
    let isMuted = false;
    let audioLoaded = false;
    let currentImageIndex = 0;
    let modsLoaded = 0;
    let loadingProgress = 0;
    let currentMessageIndex = 0;
    
    // Images pour le diaporama
    const backgroundImages = [
        'assets/images/background.png',
        'assets/images/background2.png',
        'assets/images/background3.png',
        'assets/images/background4.png',
        'assets/images/background5.png',
        'assets/images/background6.png',
        

    ];
    
    // Messages
    const messages = [
        "Vous venez d'arriver et pas d'agent immobilier disponible? Vous pouvez louer votre première propriété tout seul!",
        "Bienvenue dans la ville! N'oubliez pas de respecter les règles du serveur.",
        "Besoin d'aide? Rejoignez notre Discord pour plus d'informations.",
        "Les jobs sont disponibles au centre-ville. Parlez à l'agent d'emploi pour commencer.",
        "N'oubliez pas de verrouiller votre véhicule pour éviter les vols."
    ];
    
    // Initialiser le diaporama
    function initSlideshow() {
        backgroundSlideshow.style.backgroundImage = `url(${backgroundImages[0]})`;
        backgroundSlideshow.style.opacity = '1';
        
        // Changer l'image toutes les 3 secondes
        setInterval(() => {
            currentImageIndex = (currentImageIndex + 1) % backgroundImages.length;
            backgroundSlideshow.style.opacity = '0';
            
            setTimeout(() => {
                backgroundSlideshow.style.backgroundImage = `url(${backgroundImages[currentImageIndex]})`;
                backgroundSlideshow.style.opacity = '1';
            }, 500);
        }, 5000);
    }
    
    // Initialiser l'audio
    function initAudio() {
        audio.volume = parseFloat(volumeSlider.value);
        updateVolumeIcon();
        
        audio.addEventListener('canplaythrough', () => {
            audioLoaded = true;
            playButton.classList.remove('disabled');
            volumeButton.classList.remove('disabled');
        });
        
        audio.addEventListener('error', () => {
            console.log("Audio error: File not found or format not supported");
            audioLoaded = false;
            playButton.classList.add('disabled');
            volumeButton.classList.add('disabled');
        });
    }
    
    // Contrôles audio
    playButton.addEventListener('click', () => {
        if (!audioLoaded) return;
        
        if (isPlaying) {
            audio.pause();
            playButton.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="5 3 19 12 5 21 5 3"></polygon></svg>';
        } else {
            const playPromise = audio.play();
            
            if (playPromise !== undefined) {
                playPromise.then(() => {
                    playButton.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="6" y="4" width="4" height="16"></rect><rect x="14" y="4" width="4" height="16"></rect></svg>';
                }).catch(error => {
                    console.log("Audio playback failed:", error);
                });
            }
        }
        
        isPlaying = !isPlaying;
    });
    
    // Contrôle du volume
    volumeButton.addEventListener('click', () => {
        if (!audioLoaded) return;
        volumeSliderContainer.classList.toggle('active');
    });
    
    volumeSlider.addEventListener('input', () => {
        const newVolume = parseFloat(volumeSlider.value);
        audio.volume = newVolume;
        volumePercentage.textContent = `${Math.round(newVolume * 100)}%`;
        
        if (newVolume === 0) {
            audio.muted = true;
            isMuted = true;
        } else if (isMuted) {
            audio.muted = false;
            isMuted = false;
        }
        
        updateVolumeIcon();
    });
    
    // Fermer le curseur de volume en cliquant ailleurs
    document.addEventListener('mousedown', (event) => {
        const isClickInside = volumeSliderContainer.contains(event.target) || volumeButton.contains(event.target);
        
        if (!isClickInside && volumeSliderContainer.classList.contains('active')) {
            volumeSliderContainer.classList.remove('active');
        }
    });
    
    // Mettre à jour l'icône du volume
    function updateVolumeIcon() {
        const volume = parseFloat(volumeSlider.value);
        
        if (isMuted || volume === 0) {
            volumeButton.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="11 5 6 9 2 9 2 15 6 15 11 19 11 5"></polygon><line x1="23" y1="9" x2="17" y2="15"></line><line x1="17" y1="9" x2="23" y2="15"></line></svg>';
        } else if (volume < 0.5) {
            volumeButton.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="11 5 6 9 2 9 2 15 6 15 11 19 11 5"></polygon><path d="M15.54 8.46a5 5 0 0 1 0 7.07"></path></svg>';
        } else {
            volumeButton.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="11 5 6 9 2 9 2 15 6 15 11 19 11 5"></polygon><path d="M15.54 8.46a5 5 0 0 1 0 7.07"></path><path d="M19.07 4.93a10 10 0 0 1 0 14.14"></path></svg>';
        }
    }
    
    // Simuler le chargement
    function simulateLoading() {
        const loadingInterval = setInterval(() => {
            loadingProgress += Math.random() * 2;
            
            if (loadingProgress >= 100) {
                loadingProgress = 100;
                clearInterval(loadingInterval);
            }
            
            loadingPercentageElement.textContent = `Loading game (${Math.floor(loadingProgress)}%)`;
        }, 200);
        
        const modsInterval = setInterval(() => {
            modsLoaded += 1;
            
            if (modsLoaded >= 25) {
                modsLoaded = 25;
                clearInterval(modsInterval);
            }
            
            modsLoadedElement.textContent = modsLoaded;
        }, 800);
    }
    
    // Rotation des messages
    function rotateMessages() {
        setInterval(() => {
            currentMessageIndex = (currentMessageIndex + 1) % messages.length;
            messageElement.textContent = messages[currentMessageIndex];
        }, 8000);
    }
    
    // Initialiser
    initSlideshow();
    initAudio();
    simulateLoading();
    rotateMessages();
});