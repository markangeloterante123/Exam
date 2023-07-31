<template lang="html">
  <validation-observer tag="div" class="group" :vid="`asset_form_${unique}`" :key="refresh">
    <validation-provider :name="input_name" ref="provider" :vid="`asset_form_${unique}.${input_name}[]`" v-slot="{ errors, validate }" :rules="{ required: (required) ? true : false, image: (type == 'image') ? true : false, size: file_size, ext: extensions}" class="file">
      <input type="file" :name="`${input_name}[]`" :id="`${input_name}_${unique}`" :multiple="multiple" :accept="populateExtensions" class="o_hidden" @change="getFiles($event)">
      <label :for="`${input_name}_${unique}`" class="pointer" @dragover.prevent @dragenter.prevent @drop.prevent="dropFiles($event)">
        <p>Drag a {{ type }} here<br>
        or <b class="pointer">browse</b> to upload.</p>
      </label>
      <transition name="slide"><span class="validate" v-if="errors.length > 0">{{ errors[0] }}</span></transition>
    </validation-provider>
    <div :class="[ 'preview_image', columns ]" v-if="files.length > 0">
      <div :class="[ 'preview', division, (type == 'file') ? 'big' : '' ]" v-for="(data, key) in populateFiles" :key="key">
        <div class="image_close" @click="removeTempFiles(key)">×</div>
        <template v-if="type == 'image'">
          <img src="" :id="`preview_image_${unique}${key}`" v-if="type == 'image'" />
          <validation-provider tag="div" class="group bordered" name="title" :rules="{ required: true, regex: '^[a-zA-Z0-9\-_ |\_]*$', max: 50 }" :vid="`asset_form_${key}.${input_name}[]`" v-slot="{ errors }">
            <label :for="`image_title${key}`">Title <span>*</span></label>
            <input type="text" :name="`${input_name}_title[]`" :id="`image_title${key}`" autocomplete="off" class="input" v-model="data.title">
            <transition name="slide"><span class="validate" v-if="errors.length > 0">{{ errors[0] }}</span></transition>
          </validation-provider>
          <validation-provider tag="div" class="group bordered" name="alt" :vid="`asset_form_${key}.file_alt[]`" :rules="{ required: true, regex: '^[a-zA-Z0-9\-_ |\_]*$', max: 50 }" v-slot="{ errors }">
            <label :for="`image_alt${key}`">Alt <span>*</span></label>
            <input type="text" :name="`${input_name}_alt[]`" :id="`image_alt_${key}`" autocomplete="off" class="input" v-model="data.alt">
            <transition name="slide"><span class="validate" v-if="errors.length > 0">{{ errors[0] }}</span></transition>
          </validation-provider>
          <template v-if="show_sequence">
            <validation-provider tag="div" class="group bordered" name="sequence" :rules="{ required: true, numeric: true, min_value: 1, max_value: 99 }" :vid="`asset_form_${key}.file_sequence[]`" v-slot="{ errors }">
              <label :for="`image_sequence${key}`">Sequence <span>*</span></label>
              <input type="text" :name="`${input_name}_sequence[]`" :id="`image_sequence_${key}`" autocomplete="off" class="input" v-model="data.sequence">
              <transition name="slide"><span class="validate" v-if="errors.length > 0">{{ errors[0] }}</span></transition>
            </validation-provider>
          </template>
          <template v-if="show_caption">
            <validation-provider tag="div" class="group bordered" name="caption" :rules="{ required: false }" :vid="`asset_form_${key}.file_caption[]`" v-slot="{ errors }">
              <label :for="`image_caption${key}`">Caption <b>(OPTIONAL)</b></label>
              <textarea class="input" rows="8" :name="`${input_name}_caption[]`" v-model="data.caption"></textarea>
              <transition name="slide"><span class="validate" v-if="errors.length > 0">{{ errors[0] }}</span></transition>
            </validation-provider>
          </template>

          <input type="hidden" :name="`${input_name}_id[]`" v-model="data.id">
          <input type="hidden" :name="`${input_name}_category[]`" v-model="category">
        </template>
        <div class="item mb twenty">
          <span v-line-clamp="1">{{ data.name }}</span>
        </div>
      </div>
    </div>
    <div class="disclaimer">
      <div class="violator">Drag and drop {{ type }}.<br>
      Maximum, file size is {{ file_size / 1000 }}MB<br>
      Supported file formats: {{ populateExtensions }}</div>
    </div>
  </validation-observer>
</template>

<script>
  export default {
    props: {
      unique: {
        type: Number,
        default: 0
      },
      multiple: {
        type: Boolean,
        default: true
      },
      required: {
        type: Boolean,
        default: true
      },
      input_name: {
        type: String,
        default: 'file'
      },
      show_caption: {
        type: Boolean,
        default: false
      },
      show_sequence: {
        type: Boolean,
        default: false
      },
      type: {
        type: String,
        default: 'image'
      },
      columns: {
        type: String,
        default: 'four'
      },
      division: {
        type: String,
        default: ''
      },
      category: {
        type: String,
        default: 'image'
      },
      extensions: {
        type: Array/Object,
        default: () => {
          return ['jpeg', 'jpg', 'png', 'webp']
        }
      },
      file_size: {
        type: Number,
        default: 20000
      },
    },
    data: () => ({
      files: [],
      refresh: 0
    }),
    computed: {
      populateFiles () {
        let result
        result = this.files
        return result
      },
      populateExtensions () {
        let result = ''
        this.extensions.forEach((item, key) => {
          if (key != (this.extensions.length - 1)) {
            result += `.${item}, `
          } else {
            result += `.${item}`
          }
        })

        return result
      }
    },
    methods: {
      removeTempFiles (unique) {
        let confirm = window.confirm('Are you sure you remove this? This action cannot be undone.')
        if (confirm) {
          let data_transfer = new DataTransfer(),
          target_file = document.getElementById(`${this.input_name}_${this.unique}`),
          { files } = target_file

          for (let i = 0; i < files.length; i++) {
            const file = files[i]
            if (unique !== i) data_transfer.items.add(file)
            target_file.files = data_transfer.files
            this.files = target_file.files
          }
          if (this.files.length == 0) {
            this.refresh += 1
          }

          if (this.type == 'image') {
            let element = document.getElementById(`${this.input_name}_${this.unique}`)
            for (let i = 0; i < element.files.length; i++) {

              let reader = new FileReader()
              reader.onload = () => {
                let image = document.getElementById(`preview_image_${this.unique}${i}`)
                image.src = reader.result
              }
              reader.readAsDataURL(element.files[i])
            }
          }
        }
      },
      /**
       * manipulate files
       */
      getFiles (event) {
        let element = event.target
        if (element.files.length > 0) {
          console.log(element.files);
          this.files = []
          for (let i = 0; i < element.files.length; i++) {
            this.$refs.provider.validate(element.files[i]).then(success => {
              if (success.valid) {
                this.files.push(element.files[i])
                this.files[i].id = 0
                this.files[i].alt = ''
                this.files[i].title = ''
                this.files[i].sequence = 0
                this.files[i].caption = ''

                if (this.type == 'image') {
                  let reader = new FileReader()
                  reader.onload = () => {
                    let image = document.getElementById(`preview_image_${this.unique}${i}`)
                    image.src = reader.result
                  }
                  reader.readAsDataURL(element.files[i])
                }
              }
            })
          }
        }
      },
      /**
       * drag and drop event files
       * @param  {[object]} event [event handler]
       */
      dropFiles (event) {
        let target = event.dataTransfer.files,
          target_file = document.getElementById(`${this.input_name}_${this.unique}`)

        const data_transfer = new DataTransfer()
        let length = (this.multiple) ? target.length : 1

        for (let i = 0; i < length; i++) {
          this.$refs.provider.validate(target[i]).then(success => {
            if (success) {
              data_transfer.items.add(target[i])
              target_file.files = data_transfer.files
              this.files = target_file.files
              this.files[i].id = 0
              this.files[i].alt = ''
              this.files[i].title = ''
              this.files[i].sequence = 0
              this.files[i].caption = ''

              if (this.type == 'image') {
                let reader = new FileReader()
                reader.onload = () => {
                  let image = document.getElementById(`preview_image_${this.unique}${i}`)
                  image.src = reader.result
                }
                reader.readAsDataURL(target[i])
              }
            }
          })
        }
      }
    }
  }
</script>
