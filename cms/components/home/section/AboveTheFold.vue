<template lang="html">
  <section id="__home-fold" :class="attr['fold']">
    <!-- Container Template -->
    <div :class="attr['fold__container']">
      <div
        :class="attr['fold__container-title']"
        v-html="above_the_fold.title"
      ></div>
      <div
        :class="attr['fold__container-excerpt']"
        v-html="above_the_fold.description"
      ></div>
      <div class="buttons">
        <a
          v-for="(button, key) in above_the_fold.buttons"
          :key="key"
          :href="button.url"
          class="success button mr outline pointer"
          >{{ button.label }}</a
        >
      </div>
    </div>
    <img :class="attr['fold__background']" src="/home/truck.jpg" />
  </section>
</template>

<script>
export default {
  inject: ["above_the_fold"],
  methods: {
    setPulse() {
      setTimeout(() => {
        this.no_pulse = false;
      }, 5000);
    },
  },
  mounted() {
    this.setPulse();
  },
};
</script>

<style lang="stylus" module="attr">
.fold
  display: flex
  flex-flow: row wrap
  &__container
    flex: 0 0 40%
    padding: 120px 40px 60px
    &-title
      padding-bottom: 20px
      h1
        font-size: 52px
        font-weight: 700
        color: #000
        line-height: 1.2
    &-excerpt
      margin-bottom: 40px
      font-size: 18px
      font-weight: 500
      color: #444444
      line-height: 1.4
  &__background
    flex: 0 0 60%
    width: 50%
    height: 100vh
    object-fit: cover
    object-position: left

  @media (max-width: 1024px) and (min-width: 280px)
    .fold
      &__container
        flex: 0 0 100%
        h1
          font-size: 32px
          text-align: center
        &-excerpt
          text-align: center
      &__background
        display: none
</style>
