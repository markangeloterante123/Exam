<template lang="html">
  <div class="box mb seventy">
    <div class="top_box">
      <h2>Metadata <b>(OPTIONAL)</b></h2>
    </div>
    <div class="bottom_box">
      <div class="group bordered">
        <label for="meta_title">Meta Title</label>
        <input type="text" name="meta_title" class="input" v-model="form_data.meta_title">
        <!-- <div class="disclaimer">
          <p class="violator">Default value is the <b>title/name/h1</b> of the content</p>
        </div> -->
      </div>
      <div class="group bordered nmb">
        <label for="meta_description">Meta Description</label>
        <textarea class="input" rows="8" name="meta_description" v-model="form_data.meta_description"></textarea>
        <!-- <div class="disclaimer">
          <p class="violator">Default value is the <b>summary/description</b> of the content</p>
        </div> -->
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    props: {
      payload: {
        type: Object,
        default: () => {
          return {
            meta_title: '',
            meta_description: ''
          }
        }
      }
    },
    data: ({ payload }) => ({
      form_data: {
        meta_title: (payload) ? payload.meta_title : '',
        meta_description: (payload) ? payload.meta_description : ''
      }
    })
  }
</script>
