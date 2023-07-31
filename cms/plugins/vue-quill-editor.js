import Vue from 'vue'
import VueQuillEditor from 'vue-quill-editor'
import VueQuillTable from 'vue-quill-table'
import Quill from 'quill'

import ImageResize from 'quill-image-resize-vue'
import VideoResize from 'quill-video-resize-module2'

let Parchment = Quill.import('parchment'),
  BaseImageFormat = Quill.import('formats/image')

const ImageFormatAttributesList = [
  'alt',
  'height',
  'width',
  'style'
]

class ImageFormat extends BaseImageFormat {
  static formats(domNode) {
    return ImageFormatAttributesList.reduce(function(formats, attribute) {
      if (domNode.hasAttribute(attribute)) {
        formats[attribute] = domNode.getAttribute(attribute)
      }
      return formats
    }, {})
  }
  format(name, value) {
    if (ImageFormatAttributesList.indexOf(name) > -1) {
      if (value) {
        this.domNode.setAttribute(name, value)
      } else {
        this.domNode.removeAttribute(name)
      }
    } else {
      super.format(name, value)
    }
  }
}

Quill.register(ImageFormat, true)
Quill.register('modules/imageResize', ImageResize)
Quill.register('modules/VideoResize', VideoResize)
Quill.register(VueQuillTable.TableCell)
Quill.register(VueQuillTable.TableRow)
Quill.register(VueQuillTable.Table)
Quill.register(VueQuillTable.Contain)
Quill.register('modules/table', VueQuillTable.TableModule)

import 'quill/dist/quill.core.css'
import 'quill/dist/quill.snow.css'
import 'vue-quill-table/src/css/quill.table.css'

const max_rows = 10
const max_cols = 5
const table_options = [];
for (let r = 1; r <= max_rows; r++) {
    for (let c = 1; c <= max_cols; c++) {
        table_options.push('newtable_' + r + '_' + c)
    }
}

Vue.use(VueQuillEditor, {
  modules: {
    imageResize: {},
    VideoResize: {
      modules: [ 'Resize', 'DisplaySize', 'Toolbar' ],
      tagName: 'iframe', // iframe | video
    },
    table: true,
    toolbar: [
      [{table: table_options}, {table: 'append-row'}, {table: 'append-col'}],
      ['bold', 'italic', 'underline', 'strike'],
      ['blockquote', 'code-block'],
      [{ 'header': 1 }, { 'header': 2 }],
      [{ 'list': 'ordered' }, { 'list': 'bullet' }],
      [{ 'script': 'sub' }, { 'script': 'super' }],
      [{ 'indent': '-1' }, { 'indent': '+1' }],
      [{ 'direction': 'rtl' }],
      [{ 'size': ['small', false, 'large', 'huge'] }],
      [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
      [{ 'color': [] }, { 'background': [] }],
      [{ 'align': [] }],
      ['link', 'image', 'video']
    ]
  }
})
