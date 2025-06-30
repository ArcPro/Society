<template>
  <div class="flex h-full flex-1 flex-col overflow-hidden">
    <div
      class="flex items-center justify-between gap-1 bg-zinc-700 py-1 px-2 text-xs text-white"
    >
      <span class="flex items-center gap-1">
        <i class="fa-solid fa-volume-high"></i>
        <span class="font-semibold">{{ radio.settings.volume }}%</span>
      </span>
      <span class="flex items-end gap-1">
        <span class="font-semibold" v-if="radio.settings.current">{{
          radio.settings.customName
            ? radio.settings.customName.substring(0, 10)
            : radio.settings.current
        }}</span>
        <i class="fa-solid fa-signal" v-if="radio.settings.current"></i>
        <i class="fa-solid fa-close" v-else></i>
      </span>
    </div>
    <div
      class="flex flex-1 flex-col gap-2 overflow-hidden py-2 px-2 text-white"
    >
      <div
        class="inline-flex divide-x-[0.1vh] divide-gray-300/50 overflow-hidden rounded-md shadow-sm"
      >
        <button
          @click="radio.setTab('main')"
          v-tooltip.auto="{
            content: radio.getLocale('go_back'),
            placement: 'bottom',
          }"
          type="button"
          class="relative inline-flex flex-1 items-center justify-center bg-zinc-700 py-2 text-xs font-medium text-white transition duration-150 ease-linear"
        >
          <i class="fa-solid fa-arrow-left"></i>
        </button>
        <button
          @click="toggleMovement()"
          v-tooltip.auto="{
            content: radio.getLocale('toggle_frame_movement'),
            placement: 'bottom',
          }"
          type="button"
          class="relative inline-flex flex-1 items-center justify-center bg-zinc-700 py-2 text-xs font-medium text-white transition duration-150 ease-linear"
          :class="{
            'bg-zinc-500 text-white': radio.isAllowedToMove,
            'hover:bg-zinc-600 hover:text-white': !radio.isAllowedToMove,
          }"
        >
          <i class="fa-solid fa-up-down-left-right"></i>
        </button>
      </div>
      <div
        class="no-scrollbar flex w-full flex-1 flex-col gap-1 overflow-y-auto rounded-md"
      >
        <div v-if="radio.settings.isColorChangeAllowed">
          <label for="size" class="block pb-1 text-xs font-medium text-white">{{
            radio.getLocale("color")
          }}</label>
          <select
            id="size"
            v-model="radio.settings.frame"
            @change="radio.colorChanged()"
            class="block w-full appearance-none rounded-md border border-gray-400 bg-transparent py-2 pl-3 pr-10 text-xs ring-0 focus:outline-none"
          >
            <option
              v-for="(frame, index) in radio.frames"
              :value="index"
              :selected="index === radio.settings.frame"
              class="bg-zinc-700 text-xs text-white"
            >
              {{
                radio.getLocale(
                  `color_${
                    frame.name === "default"
                      ? "black"
                      : frame.name.toLowerCase()
                  }`
                )
              }}
            </option>
          </select>
        </div>
        <div>
          <label for="size" class="block pb-1 text-xs font-medium text-white">{{
            radio.getLocale("size")
          }}</label>
          <select
            id="size"
            v-model="radio.settings.size"
            @change="radio.sizeChanged()"
            class="block w-full appearance-none rounded-md border border-gray-400 bg-transparent py-2 pl-3 pr-10 text-xs ring-0 focus:outline-none"
          >
            <option
              v-for="size in radio.sizes"
              :value="size.value"
              :selected="size.value === radio.settings.size"
              class="bg-zinc-700 text-xs text-white"
            >
              {{ size.name }}
            </option>
          </select>
        </div>
        <div>
          <label for="size" class="block pb-1 text-xs font-medium text-white">{{
            radio.getLocale("volume")
          }}</label>
          <div
            class="flex w-full items-center justify-center overflow-hidden rounded-md border border-gray-400"
          >
            <button class="py-2 px-2 text-xs" @click="radio.volumeDown()">
              <i class="fa-solid fa-minus"></i>
            </button>
            <div class="flex flex-1 justify-center">
              {{ radio.settings.volume }}
            </div>
            <button class="py-2 px-2 text-xs" @click="radio.volumeUp()">
              <i class="fa-solid fa-plus"></i>
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup lang="ts">
import { EventBus } from "@/event-bus";
import { useRadio } from "@/stores/radio";

const radio = useRadio();

function toggleMovement() {
  EventBus.emit("radio:toggleMovement");
}
</script>
