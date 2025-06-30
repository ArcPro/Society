<template>
  <div class="flex h-full flex-1 flex-col">
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
    <div class="flex flex-1 flex-col justify-around px-2 py-1">
      <div>
        <label for="search" class="block text-xs font-medium text-white">{{
          radio.getLocale("channel")
        }}</label>
        <div class="relative mt-1 flex items-center">
          <input
            type="number"
            :min="radio.settings.ranges.min"
            :max="radio.settings.ranges.max"
            class="block w-full !appearance-none rounded-md bg-zinc-700 pr-12 text-gray-200 shadow-sm focus:ring-0 focus:ring-transparent focus:ring-offset-transparent sm:text-sm"
            v-model="radio.settings.input"
            @keyup.enter="radio.connectToRadio()"
          />
          <div
            class="absolute inset-y-0 right-0 flex py-1.5 pr-1.5"
            v-tooltip.auto="{
              content: radio.getLocale('press_enter_to_connect'),
              placement: 'top',
            }"
          >
            <kbd
              class="inline-flex items-center rounded border border-gray-200 px-2 font-sans text-sm font-medium text-white"
            >
              <i class="fa-solid fa-arrow-turn-down rotate-90 transform"></i>
            </kbd>
          </div>
        </div>
      </div>
      <div
        class="inline-flex divide-x-[0.01vh] divide-gray-300/50 overflow-hidden rounded-md shadow-sm"
      >
        <button
          v-if="radio.settings.isChannelWithList"
          type="button"
          @click="radio.setTab('list')"
          v-tooltip.auto="{
            content: radio.getLocale('show_list'),
            placement: 'top',
          }"
          class="relative inline-flex flex-1 items-center justify-center bg-zinc-700 py-2 text-sm font-medium text-white transition duration-150 ease-linear hover:bg-zinc-600 hover:text-white"
        >
          <i class="fa-solid fa-list"></i>
        </button>
        <button
          v-if="radio.settings.isChannelWithList"
          @click="radio.setTab('change')"
          v-tooltip.auto="{
            content: radio.getLocale('change_signs'),
            placement: 'top',
          }"
          type="button"
          class="relative inline-flex flex-1 items-center justify-center bg-zinc-700 py-2 text-sm font-medium text-white transition duration-150 ease-linear hover:bg-zinc-600 hover:text-white"
        >
          <i class="fa-solid fa-pen-to-square"></i>
        </button>
        <button
          v-if="radio.settings.canChannelBeLocked"
          @click="radio.setTab('lock')"
          v-tooltip.auto="{
            content: radio.getLocale('lock_channel'),
            placement: 'top',
          }"
          type="button"
          class="relative inline-flex flex-1 items-center justify-center bg-zinc-700 py-2 text-sm font-medium text-white transition duration-150 ease-linear hover:bg-zinc-600 hover:text-white"
        >
          <i class="fa-solid fa-lock" v-if="radio.settings.isChannelLocked"></i>
          <i class="fa-solid fa-lock-open" v-else></i>
        </button>
        <button
          type="button"
          v-tooltip.auto="{
            content: radio.getLocale('settings'),
            placement: 'top',
          }"
          @click="radio.setTab('settings')"
          class="relative inline-flex flex-1 items-center justify-center bg-zinc-700 py-2 text-sm font-medium text-white transition duration-150 ease-linear hover:bg-zinc-600 hover:text-white"
        >
          <i class="fa-solid fa-gear"></i>
        </button>
      </div>
    </div>
    <div class="flex divide-x-[1px] divide-opacity-50">
      <button
        type="button"
        @click="radio.connectToRadio()"
        class="inline-flex flex-1 items-center justify-center border border-transparent bg-zinc-700 px-2.5 py-1.5 text-xs font-medium text-white shadow-sm transition duration-150 ease-linear hover:bg-zinc-600 hover:text-white focus:outline-none focus:ring-0 focus:ring-transparent"
      >
        {{ radio.getLocale("change_button") }}
      </button>

      <button
        v-if="radio.settings.current"
        type="button"
        v-tooltip.auto="{
          content: radio.getLocale('disconnect'),
          placement: 'top',
        }"
        @click="radio.leaveRadio()"
        class="inline-flex items-center justify-center border border-transparent bg-zinc-700 px-2.5 py-1.5 text-xs font-medium text-white shadow-sm transition duration-150 ease-linear hover:bg-zinc-600 hover:text-white focus:outline-none focus:ring-0 focus:ring-transparent"
      >
        <i class="fa-solid fa-close"></i>
      </button>
    </div>
  </div>
</template>
<script setup lang="ts">
import { useRadio } from "@/stores/radio";

const radio = useRadio();
</script>
