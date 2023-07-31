<template lang="html">
  <section :class="attr['page']">
    <!-- Above The Fold -->
    <above-the-fold />
  </section>
</template>

<script>
export default {
  components: {
    AboveTheFold: () => import("~/components/home/section/AboveTheFold"),
  },
};
</script>
<style lang="stylus" module="attr">
.page
  //
</style>
