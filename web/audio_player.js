window.playBackgroundMusic = function () {
	const audio = new Audio("assets/NIKI.mp3");
	audio.loop = true;
	audio.autoplay = true;
	audio.volume = 0.5;
	audio.play();
};
