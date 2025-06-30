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
        @click="radio.setTab('main')"
        class="flex w-full select-none items-center gap-3 rounded-md bg-zinc-700 py-1 px-2 transition duration-150 ease-linear hover:bg-zinc-600 hover:text-white"
      >
        <i class="fa-solid fa-arrow-left text-xs"></i>
        <span class="text-xs font-semibold">{{
          radio.getLocale("go_back")
        }}</span>
      </div>
      <div
        class="no-scrollbar flex w-full flex-1 flex-col gap-2 overflow-y-auto rounded-md"
      >
        <div>
          <label for="sign" class="block text-xs font-medium text-white">{{
            radio.getLocale("call_sign")
          }}</label>
          <div class="mt-1">
            <input
              type="text"
              id="sign"
              v-model="radio.settings.signs.sign"
              class="block w-full rounded-lg border-gray-300 bg-transparent text-xs text-white shadow-sm placeholder:text-white"
              :placeholder="radio.getLocale('call_sign_placeholder')"
            />
          </div>
        </div>
        <div>
          <label for="name" class="block text-xs font-medium text-white">{{
            radio.getLocale("name_input")
          }}</label>
          <div class="mt-1">
            <input
              type="text"
              id="name"
              v-model="radio.settings.signs.name"
              class="block w-full rounded-lg border-gray-300 bg-transparent text-xs text-white shadow-sm placeholder:text-white"
              :placeholder="radio.getLocale('name_input_placeholder')"
            />
          </div>
        </div>
        <div>
          <button
            type="button"
            @click="radio.updateSigns()"
            class="inline-flex w-full items-center justify-center rounded-lg border border-transparent bg-zinc-700 px-2.5 py-1.5 text-xs font-medium text-white shadow-sm hover:bg-zinc-600 focus:outline-none"
          >
            {{ radio.getLocale("button_save") }}
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup lang="ts">
import { useRadio } from "@/stores/radio";

const radio = useRadio();
</script>
