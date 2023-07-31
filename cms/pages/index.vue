<template lang="html">
  <main v-if="loaded">
    <!-- Page Content -->
    <page-content />
  </main>
</template>

<script>
import { computed } from "vue";
export default {
  components: {
    PageContent: () => import("~/components/home/PageContent"),
  },
  data: () => ({
    loaded: false,
    page: {
      title: "Home",
      meta_title: "Renewable energy that powers positive change.",
    },
  }),
  provide() {
    return {
      above_the_fold: {
        title: "<h1>One stop Solutions your transport requirement</h1>",
        description:
          "We offer 20% discount for the asian country cargo delivery - by tack-kun",
        buttons: [
          {
            label: "Login",
            url: "/login",
          },
          {
            label: "Create Account",
            url: "/register",
          },
        ],
      },
    };
  },
  updated() {
    this.$nuxt.$emit("toggle-footer", "image", true);
  },
  mounted() {
    setTimeout(() => {
      this.loaded = true;
    }, 500);
  },
  asyncData({ $axios, store, error }) {
    // return $axios
    //   .$get('web/pages/home')
    //   .then(({ record }) => ({
    //     record: record
    //   }))
    //   .catch(() => {
    //     error({ statusCode: 500 })
    //   })
  },
  head() {
    let host = process.env.BASE_URL;

    return {
      title: `Exam | ${this.page.title}`,
      link: [
        {
          rel: "canonical",
          href: `${host}${this.$route.fullPath}`,
        },
      ],
    };
  },
};
</script>
