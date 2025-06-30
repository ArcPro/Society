<template>
  <div
    tabindex="-1"
    class="absolute select-none border-none focus:outline-none"
    :style="styles"
    ref="radioFrame"
    v-show="radio.settings.isRadioShown"
    v-auto-animate
  >
    <img
      id="img"
      class="-z-10 flex h-full w-full flex-shrink-0 select-none border-none focus:outline-none"
      :src="radio.frames[radio.settings.frame].url"
      tabindex="-1"
    />
    <div
      @click="radio.toggleOffState()"
      v-tooltip.auto="{
        content: radio.getLocale('turn_on_off'),
        placement: 'right',
      }"
      class="absolute z-50"
      :style="offButton[radio.settings.size]"
    ></div>
    <div
      @click="radio.volumeUpButton()"
      v-tooltip.auto="{
        content: radio.getLocale('volume_up'),
        placement: 'right',
      }"
      class="absolute z-50"
      :style="volumeUpButton[radio.settings.size]"
    ></div>
    <div
      @click="radio.volumeDownButton()"
      v-tooltip.auto="{
        content: radio.getLocale('volume_down'),
        placement: 'right',
      }"
      class="absolute z-50"
      :style="volumeDownButton[radio.settings.size]"
    ></div>
    <div
      id="screen"
      class="absolute overflow-hidden bg-stone-900"
      :style="screenPositions[radio.settings.size]"
      v-auto-animate
    >
      <OffScreen v-if="radio.settings.isOff" v-auto-animate />
      <component
        v-else
        v-auto-animate
        tabindex="-1"
        v-for="(component, index) in screens"
        :is="component"
        :key="index"
        v-show="index === radio.screen"
      />
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed, type CSSProperties, type ComputedRef, onMounted } from "vue";
import { useRadio } from "@/stores/radio";

import interact from "interactjs";
import MainScreen from "./Radio/MainScreen.vue";
import ChangeScreen from "./Radio/ChangeScreen.vue";
import OffScreen from "./Radio/OffScreen.vue";
import ListScreen from "./Radio/ListScreen.vue";
import LockScreen from "./Radio/LockScreen.vue";
import SettingsScreen from "./Radio/SettingsScreen.vue";
import { EventBus } from "@/event-bus";

const radio = useRadio();

let isMovementEnabled: boolean = false;
EventBus.on("radio:toggleMovement", () => {
  isMovementEnabled = !isMovementEnabled;

  radio.isAllowedToMove = isMovementEnabled;

  interact(radioFrame).draggable({
    enabled: isMovementEnabled,
  });
});

const screens = {
  main: MainScreen,
  list: ListScreen,
  change: ChangeScreen,
  lock: LockScreen,
  settings: SettingsScreen,
};

const sizes: { [key: string]: string } = {
  small: "18vh",
  medium: "21vh",
  large: "24vh",
};

const screenPositions: { [key: string]: CSSProperties } = {
  small: {
    top: "19.741vh",
    left: "3.0vh",
    width: "12.0vh",
    height: "17.25vh",
    maxHeight: "17.25vh",
    minHeight: "17.25vh",
    borderRadius: "0.8vh",
  },
  medium: {
    top: "23.07vh",
    left: "3.4vh",
    width: "14.2vh",
    height: "20.5vh",
    maxHeight: "20.05vh",
    minHeight: "20.05vh",
    borderRadius: "1vh",
  },
  large: {
    top: "26.35vh",
    left: "3.95vh",
    width: "16.08vh",
    height: "23vh",
    maxHeight: "23vh",
    minHeight: "23vh",
    borderRadius: "1vh",
  },
};

const offButton: { [key: string]: CSSProperties } = {
  small: {
    top: "25.2vh",
    height: "1.5vh",
    width: "1.5vh",
  },
  medium: {
    top: "29.3vh",
    height: "2vh",
    width: "1.5vh",
  },
  large: {
    top: "33.6vh",
    height: "2vh",
    width: "1.5vh",
  },
};
const volumeUpButton: { [key: string]: CSSProperties } = {
  small: {
    top: "27.1vh",
    height: "1.5vh",
    width: "1.5vh",
  },
  medium: {
    top: "31.5vh",
    height: "2vh",
    width: "1.5vh",
  },
  large: {
    top: "36.1vh",
    height: "2vh",
    width: "1.5vh",
  },
};
const volumeDownButton: { [key: string]: CSSProperties } = {
  small: {
    top: "28.9vh",
    height: "1.5vh",
    width: "1.5vh",
  },
  medium: {
    top: "33.7vh",
    height: "2vh",
    width: "1.5vh",
  },
  large: {
    top: "38.6vh",
    height: "2vh",
    width: "1.5vh",
  },
};

let radioFrame: HTMLDivElement = $ref<HTMLDivElement>();

const styles: ComputedRef<Partial<CSSProperties>> = computed<
  Partial<CSSProperties>
>(() => {
  const frameSize: string = sizes[radio.settings.size];

  return {
    width: frameSize,
    bottom: `${radio.settings.position.bottom}px`,
    right: `${radio.settings.position.right}px`,
  };
});

onMounted(() => {
  interact(radioFrame).draggable({
    enabled: false,
    autoScroll: false,
    listeners: {
      move(event: { dx: number; dy: number }) {
        radio.settings.position.bottom += -event.dy;
        radio.settings.position.right += -event.dx;
      },
      end() {
        radio.positionChanged();
      },
    },
    ignoreFrom: "#screen",
  });

  window.addEventListener("keyup", function (event) {
    if (event.keyCode == 27) {
      if (radio.settings.isRadioShown) {
        radio.closeRadio();
      }

      if (radio.quickJoinIsShown) {
        radio.closeList();
      }
    }
  });

  radio.fetchLocale();
});

EventBus.on("radio:toggleRadio", (data) => {
  radio.settings.isRadioShown = (data as any).state;
});
</script>
