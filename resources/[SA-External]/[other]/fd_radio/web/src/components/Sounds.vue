<template></template>

<script setup lang="ts">
import { EventBus } from "@/event-bus";

const joinLeaveSound = new Audio("./sounds/radio-join-leaveogg.ogg");
const jammerSound = new Audio("./sounds/jammer.mp3");
const buttonClick = new Audio("./sounds/button_click.mp3");

function playJoinLeave() {
  joinLeaveSound.pause();
  joinLeaveSound.currentTime = 0;
  joinLeaveSound.volume = 0.3;

  joinLeaveSound.play();
}

function playJammerSound() {
  jammerSound.pause();
  jammerSound.currentTime = 0;
  jammerSound.loop = true;
  jammerSound.volume = 0.01;

  jammerSound.play();
}

function stopJammerSound() {
  jammerSound.pause();
}

function playButtonClick() {
  buttonClick.pause();
  buttonClick.currentTime = 0;
  buttonClick.volume = 0.1;

  buttonClick.play();
}

EventBus.on("radio:playButton", () => {
  playButtonClick();
});

EventBus.on("radio:join", () => {
  playJoinLeave();
});

EventBus.on("radio:playJammer", () => {
  playJammerSound();
});

EventBus.on("radio:stopJammer", () => {
  stopJammerSound();
});
</script>
