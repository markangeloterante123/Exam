<template lang="html">
  <div id="dashboard">
    <div :class="attr['section']">
      <h1>Welocome to truck-kun {{ user.user_detail.first_name }}</h1>
      Lorem, ipsum dolor sit amet consectetur adipisicing elit. Repudiandae iure
      distinctio nostrum temporibus sint consequatur doloribus, sed optio
      corporis doloremque culpa unde! Obcaecati officiis magnam soluta dicta!
      Quos, perspiciatis a.

      <div class="item ml cancel pointer" @click="logout()">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="24px"
          height="24px"
          viewBox="0 0 24 24"
          class="icon"
        >
          <path
            d="M6,19A2,2 0 0,0 8,21H16A2,2 0 0,0 18,19V7H6V19M8,9H16V19H8V9M15.5,4L14.5,3H9.5L8.5,4H5V6H19V4H15.5Z"
          />
        </svg>
        <span>Unsubscribe </span>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  data: () => ({
    is_toggled: false,
    user_logout: false,
    user: {
      role: {
        name: "",
      },
      user_detail: {
        first_name: "",
        last_name: "",
      },
    },
  }),
  watch: {
    $route(to, from) {
      if (!this.user_logout) {
        this.user = this.$auth.user;
      }
    },
  },
  computed: {
    ...mapGetters({
      title: "global/settings/getTitle",
    }),
  },
  methods: {
    async logout() {
      this.toggleModalStatus({
        type: "delete_confirmation",
        status: true,
        item: { api: `cms/users/${user.id}`, item_type: "account" },
      });

      this.toggleModalStatus({ type: "loader", status: true });
      await this.$auth.logout().then((res) => {
        setTimeout(() => {
          this.user_logout = true;
          this.toggleModalStatus({ type: "loader", status: false });
          window.location.assign("/");
        }, 500);
      });
    },
  },
  mounted() {
    this.user = this.$auth.user;
  },
};
</script>

<style lang="stylus" module="attr">
.section
  h1
    padding-top: 80px
    font-size: 52px
    color: #000
</style>
