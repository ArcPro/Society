import { defineStore } from "pinia";
import type { CSSProperties } from "vue";
import mitt from "mitt";
import { resource } from "../utils";

// Import necessary components
import { useAxios } from "@vueuse/integrations/useAxios";
import { EventBus } from "@/event-bus";

export const useRadio = defineStore({
  id: "radio",
  state: () => ({
    locale: {} as { [key: string]: string },
    screen: "main" as string,
    sizes: [
      { name: "Small", value: "small" },
      { name: "Medium", value: "medium" },
      { name: "Large", value: "large" },
    ],
    settings: {
      isRadioShown: false as boolean,
      isOff: true as boolean,
      current: false,
      volume: 20,
      input: 1,
      isChannelWithList: false,
      isChannelLocked: false,
      canChannelBeLocked: false,
      isColorChangeAllowed: false,
      ranges: {
        min: 1,
        max: 10,
      },
      position: {
        bottom: 0 as number,
        right: 0 as number,
      } as Partial<CSSProperties>,
      size: "medium",
      signs: {
        sign: null,
        name: null,
      },
      frame: "default",
      customName: false,
      isExternalListShown: false as boolean,
      canExternalUsersListBeToggled: false as boolean,
      externalListUsers: [] as Array<{ name: string; sign?: string}>,
    } as Record<string, any>,
    inviteId: null,
    isAllowedToMove: false as boolean,
    screenLists: ["main", "list", "settings", "change", "lock"] as string[],
    radioList: [] as Array<{ name: string; sign?: string }>,
    frames: {
      default: {
        url: "./black.svg",
        name: "Black",
      },
      white: {
        url: "./white.svg",
        name: "White",
      },
      blue: {
        url: "./blue.svg",
        name: "Blue",
      },
      green: {
        url: "./green.svg",
        name: "Green",
      },
      red: {
        url: "./red.svg",
        name: "Red",
      },
      yellow: {
        url: "./yellow.svg",
        name: "Yellow",
      },
    } as { [key: string]: { url: string; name: string } },
    quickJoinIsShown: false,
    quickJoinList: [] as Array<{ channel: string; name: string }>,
  }),
  actions: {
    async setTab(tab: string) {
      if (!this.screenLists.includes(tab)) return;

      if (tab === "list") {
        this.fetchList();
      }

      this.screen = tab;
    },

    async leaveRadio() {
      useAxios(`https://${resource()}/leaveRadio`, {
        method: "POST",
        data: null,
      });
    },

    async closeRadio() {
      useAxios(`https://${resource()}/closeRadio`, {
        method: "POST",
        data: null,
      });
    },

    async closeList() {
      useAxios(`https://${resource()}/closeList`, {
        method: "POST",
        data: null,
      });
    },

    async toggleOffState() {
      this.settings.isOff = !this.settings.isOff;

      EventBus.emit("radio:playButton");

      if (this.settings.isOff) {
        EventBus.emit("radio:join");
        this.leaveRadio();
      }
    },

    async volumeUpButton() {
      EventBus.emit("radio:playButton");
      this.volumeUp();
    },

    async volumeUp() {
      if (this.settings.isOff) return;
      if (this.settings.volume >= 100) return;

      useAxios(`https://${resource()}/volumeUpRadio`, {
        method: "POST",
        data: null,
      });
    },

    async volumeDownButton() {
      EventBus.emit("radio:playButton");
      this.volumeDown();
    },

    async volumeDown() {
      if (this.settings.isOff) return;
      if (this.settings.volume <= 0) return;

      useAxios(`https://${resource()}/volumeDownRadio`, {
        method: "POST",
        data: null,
      });
    },

    async updateSigns() {
      useAxios(`https://${resource()}/updateSignsRadio`, {
        method: "POST",
        data: {
          signs: this.settings.signs,
        },
      });
    },

    async positionChanged() {
      useAxios(`https://${resource()}/updatePositionRadio`, {
        method: "POST",
        data: {
          position: this.settings.position,
        },
      });
    },

    async colorChanged() {
      useAxios(`https://${resource()}/colorChangeRadio`, {
        method: "POST",
        data: {
          frame: this.settings.frame,
        },
      });
    },

    async sizeChanged() {
      useAxios(`https://${resource()}/changeSizeRadio`, {
        method: "POST",
        data: {
          size: this.settings.size,
        },
      });
    },

    async connectToRadio(channel?: number | string) {
      useAxios(`https://${resource()}/joinRadio`, {
        method: "POST",
        data: {
          radio: channel || this.settings.input,
        },
      });
    },

    async fetchList() {
      const {
        data: { value },
      } = await useAxios(`https://${resource()}/fetchList`, {
        method: "POST",
        data: {
          channel: this.settings.current,
        },
      });

      this.radioList = value;
    },

    async toggleChannelState() {
      if (!this.settings.current) return;

      useAxios(`https://${resource()}/toggleChannelState`, {
        method: "POST",
        data: {
          channel: this.settings.current,
        },
      });
    },

    async toggleExternalListState() {
        if(!this.settings.canExternalUsersListBeToggled) return;

        this.settings.isExternalListShown = !this.settings.isExternalListShown;
    },

    async invitePlayer() {
      if (!this.settings.current) return;

      useAxios(`https://${resource()}/inviteToChannel`, {
        method: "POST",
        data: {
          id: this.inviteId,
        },
      });
    },

    getLocale(key: string) {
      return this.locale[key] ?? key;
    },

    async fetchLocale() {
      const {
        data: { value },
      } = await useAxios(`https://${resource()}/fetchLocale`, {
        method: "POST",
        data: {},
      });

      this.locale = value;
    },
  },
});

EventBus.on("radio:updateValues", (data) => {
  const radio = useRadio();
  for (const [, [key, value]] of Object.entries(Object.entries(data as any))) {
    if (Object.prototype.hasOwnProperty.call(radio.settings, key)) {
      if (key === "signs" && Array.isArray(value)) {
        radio.settings[key] = {};
      } else {
        radio.settings[key] = value;
      }
    }
  }
});
