var progressBar = document.querySelector(".circular-progress");
var valueContainer = document.querySelector(".value-container");

var progressValue = 0;
var progressEndValue = 70;
var speed = 50;

let progress = setInterval(() => {
  progressValue++;
  valueContainer.textContent = `${progressValue}%`;
  progressBar.style.background = `conic-gradient(
      black ${progressValue * 3.6}deg,
      white ${progressValue * 3.6}deg )`;
  if (progressValue == progressEndValue) {
    clearInterval(progress);
  }
}, speed);