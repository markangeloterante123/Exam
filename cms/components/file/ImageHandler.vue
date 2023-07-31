<template>
  <ValidationObserver tag="div" v-if="enabled" :vid="`image_form_${unique}`">
    <ValidationProvider tag="div" :class="[ 'group', (showTags) ? '' : ($parent.multiple) ? '' : 'nmb' ]" name="file" :vid="`image_form_${unique}.file[]`" ref="provider" v-slot="{ errors, validate }" :rules="file_rules">
      <input type="file" class="action_image" accept=".jpeg, .jpg, .png, .webp, .svg" :id="`${input_payload.file}${unique}`" :name="`${input_payload.file}[]`" ref="file" @change="getFile($event)">
      <label class="action_image_label" :for="`${input_payload.file}${unique}`">{{ label }}</label>
      <div v-if="$parent.showCloser && multiple" class="action_image_remove" @click="removeImage($event, unique, item.id, parent)">Remove</div>
      <transition name="slide"><span class="validate" v-if="errors.length > 0">{{ errors[0] }}</span></transition>
    </ValidationProvider>

    <input type="hidden" :name="`${input_payload.id}[]`" v-model="dataImage.id">
    <input type="hidden" :name="`${input_payload.category}[]`" v-model="input_payload.category_value">

    <div class="form_tags_group" v-if="showTags">
      <div class="preview_group">
        <img :id="`preview_file_${input_payload.identifier}${unique}`" :src="`${(item != null) ? item.path : ''}`" />
      </div>
      <div class="tags_group">
        <ValidationProvider tag="div" class="group bordered" name="title" :rules="{ required: true, regex: '^[a-zA-Z0-9\-_ |\_]*$', max: 50 }" :vid="`image_form_${unique}.file_title[]`" v-slot="{ errors }">
          <label :for="`image_title${unique}`">Title <span>*</span></label>
          <input type="text" :name="`${input_payload.title}[]`" :id="`image_title${unique}`" autocomplete="off" class="input" v-model="dataImage.title">
          <transition name="slide"><span class="validate" v-if="errors.length > 0">{{ errors[0] }}</span></transition>
        </ValidationProvider>
        <ValidationProvider tag="div" class="group bordered nmb" name="alt" :vid="`image_form_${unique}.file_alt[]`" :rules="{ required: true, regex: '^[a-zA-Z0-9\-_ |\_]*$', max: 50 }" v-slot="{ errors }">
          <label :for="`image_alt${unique}`">Alt <span>*</span></label>
          <input type="text" :name="`${input_payload.alt}[]`" :id="`image_alt_${unique}`" autocomplete="off" class="input" v-model="dataImage.alt">
          <transition name="slide"><span class="validate" v-if="errors.length > 0">{{ errors[0] }}</span></transition>
        </ValidationProvider>
      </div>
    </div>
  </ValidationObserver>
</template>

<script>
  export default {
    props: {
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
      required: {
        type: Boolean,
        default: true
      },
      item: {
        default: 0
      },
      unique: {
        type: Number/String
      },
      parent: {
        type: Number/String,
        default: 0
      },
      table_name: {
        type: String,
        default: 'images'
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
    data: () => ({
      file_rules: { required: true },
      api: '',
      showTags: false,
      enabled: true,
      dataImage: {
        id: 0,
        title: '',
        alt: '',
        sequence: 0,
        mode: 'dark'
      },
      populated: false,
      label: 'Choose File',
      image_interval: null
    }),
    methods: {
      getFile (event) {
        this.$refs.provider.validate(event).then(success => {
          if (success) {
            let element = event.target
            if (element.files[0]) {
              this.label = element.files[0].name
              this.showTags = true
              this.$parent.files[this.unique] = this.$refs.file.files[0]
            }
            if (element.files && element.files[0]) {
              let reader = new FileReader()
              reader.onload = () => {
                let image = document.getElementById(`preview_file_${this.input_payload.identifier}${this.unique}`)
                image.src = reader.result
              }
              setTimeout( () => {
                reader.readAsDataURL(element.files[0])
                if (this.$parent.$parent.collapsible) {
                  let target = document.getElementById('item_1')
                  target.style.height = `${target.scrollHeight}px`
                }
              }, 10)
            }
          }
        })
      },
      removeImage (event, unique, key, parent) {
        let me = this
        this.$parent.files.forEach((file, index) => {
          if (unique == index) {
            this.$parent.files.splice(index, 1)
          }
        })
        if (this.item == 0) {
          this.enabled = false
          this.$parent.determineIfShowCloser()
        } else {
          setTimeout( () => {
            this.api = `images/${key}`
            this.$refs.confirmation.opened = true
          }, 10)
        }
      },
      checkRules () {
        if (this.required) {
          if (this.dimension.width == 0) {
            this.file_rules = { required: (this.dataImage.id) ? false : true, image: true, ext: ['jpeg', 'jpg', 'png', 'webp', 'svg'], size: 20000 }
          } else {
            this.file_rules = { required: (this.dataImage.id) ? false : true, image: true, ext: ['jpeg', 'jpg', 'png', 'webp', 'svg'], size: 20000, dimensions: [this.dimension.width, this.dimension.height] }
          }
        } else {
          if (this.dimension.width == 0) {
            this.file_rules = { image: true, ext: ['jpeg', 'jpg', 'png', 'webp', 'svg'], size: 20000 }
          } else {
            this.file_rules = { image: true, ext: ['jpeg', 'jpg', 'png', 'webp', 'svg'], size: 20000, dimensions: [this.dimension.width, this.dimension.height] }
          }
        }

        if (this.item) {
          this.populated = true
        }
      }
    },
    mounted () {
      this.image_interval = setInterval( () => {
        if (!this.populated) {
          if (this.item) {
            this.dataImage.id = (this.item.id != null) ? this.item.id : 0
            this.dataImage.title = (this.item.title) ? this.item.title : ''
            this.label = (this.item.name) ? this.item.name : 'Choose File'
            this.dataImage.alt = (this.item.alt) ? this.item.alt : ''
            this.dataImage.sequence = (this.item.sequence) ? this.item.sequence : 0
            this.dataImage.caption = (this.item.caption) ? this.item.caption : ''
            this.dataImage.mode = (this.item.file_mode) ? this.item.file_mode : 'dark'
            this.showTags = (this.item && this.item.id) ? true : false
          }
          this.checkRules()
        } else {
          clearInterval(this.image_interval)
        }
      }, 500)
    }
  }
</script>
