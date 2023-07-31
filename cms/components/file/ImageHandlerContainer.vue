<template>
  <div :class="[ 'form_image_group', ($refs.showTags) ? 'mb' : 'nmb' ]">
    <label>{{ image_label }} <span>{{ (required) ? '*' : '' }}</span> <strong v-if="dimension.width != 0">( Max: 5MB: Dimension: {{ dimension.width }} x {{ dimension.height }} )</strong></label>
    <image-handler
      v-for="(image, key) in images"
      ref="imagePicker"
      :key="key"
      :unique="(image.id) ? image.id : unique"
      :item="image"
      :parent="parent"
      :table_name="table_name"
      :required="required"
      :dimension="dimension"
      :input_payload="input_payload"
    />
    <!-- <button type="button" class="action_image_add" v-if="multiple" @click="addImage()">Add Image</button> -->
  </div>
</template>

<script>
  export default {
    props: {
      unique: {
        type: Number/String
      },
      input_payload: {
        type: Object,
        default: () => {
          return {
            identifier: 'image',
            file: 'image',
            id: 'image_id',
            category: 'image_category',
            category_value: 'image',
            alt: 'image_alt',
            title: 'image_title'
          }
        }
      },
      image_label: {
        type: String,
        default: 'Image'
      },
      multiple: {
        type: Boolean,
        default: false
      },
      required: {
        type: Boolean,
        default: true
      },
      data: {
        type: Object/Array,
        default: ''
      },
      parent: {
        type: Number/String,
        default: 0
      },
      dimension: {
        type: Object,
        default: function () {
          return {
            width: 0,
            height: 0
          }
        }
      }
    },
    components: {
      ImageHandler: () => import('~/components/file/ImageHandler')
    },
    data: () => ({
      table_name: 'images',
      files: [],
      images: [0],
      ctr: 0,
      showCloser: false
    }),
    methods: {
      addImage () {
        this.ctr += 1
        this.images.push(this.ctr)
        this.determineIfShowCloser()
      },
      determineIfShowCloser () {
        let enabledCount = 0
        setTimeout(() => {
          this.$refs.imagePicker.forEach((item, index) => {
            if (item.enabled == true) {
              enabledCount++
            }
          })
          this.showCloser = (enabledCount > 1) ? true : false
        }, 10)
      }
    },
    mounted () {
      let ctr = 0
      setInterval( () => {
        if (ctr < 1 && this.data != '') {
          this.images = this.data
          this.data.forEach((item, index) => {
            this.files.push(null)
          })
          ctr++
        }
        this.determineIfShowCloser()
      }, 500)
    }
  }
</script>
