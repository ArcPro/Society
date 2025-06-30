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
          class="relative inline-flex flex-1 items-center justify-center bg-zinc-700 py-2 text-xs font-medium text-white transition duration-150 ease-linear hover:bg-zinc-600 hover:text-white"
        >
          <i class="fa-solid fa-arrow-left"></i>
        </button>
        <button
          @click="radio.toggleExternalListState()"
          v-tooltip.auto="{
            content: radio.settings.isExternalListShown
              ? radio.getLocale('disable_external_list')
              : radio.getLocale('enable_external_list'),
            placement: 'bottom',
          }"
          type="button"
          class="relative inline-flex flex-1 items-center justify-center bg-zinc-700 py-2 text-xs font-medium text-white transition duration-150 ease-linear hover:bg-zinc-600 hover:text-white"
          :disabled="!radio.settings.canExternalUsersListBeToggled"
        >
          <i
            class="fa-solid fa-list"
            v-if="!radio.settings.isExternalListShown"
          ></i>
          <i class="fa-solid fa-ellipsis-vertical" v-else></i>
        </button>
      </div>
      <div
        class="no-scrollbar flex w-full flex-1 flex-col gap-1 overflow-y-auto rounded-md"
      >
        <div
          class="flex w-full items-baseline gap-1 rounded-md bg-zinc-700 px-2 py-2"
          v-for="item in radio.radioList"
        >
          <span class="flex-shrink-0 text-xs font-bold" v-if="item.sign">{{
            item.sign
          }}</span>
          <span class="break-all text-xs" v-if="item.name">{{
            item.name
          }}</span>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup lang="ts">
import { useRadio } from "@/stores/radio";

const radio = useRadio();
</script>
