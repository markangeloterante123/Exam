export const api_key = process.env.TINY_MCE_API_KEY || 'no-api-key';

export const default_settings = {
  plugins: 'preview paste searchreplace autolink directionality code visualblocks visualchars image link media codesample table charmap hr pagebreak nonbreaking toc insertdatetime advlist lists wordcount imagetools textpattern noneditable charmap quickbars emoticons',
  imagetools_cors_hosts: ['picsum.photos'],
  menu: {
    file: {
      title: 'File',
      items: 'preview'
    },
    edit: {
      title: 'Edit',
      items: 'undo redo | cut copy paste pastetext | selectall | searchreplace',
    },
    view: {
      title: 'View',
      items: 'code | visualchars visualblocks | preview'
    },
    insert: {
      title: 'Insert',
      items: 'link media pageembed codesample inserttable | charmap emoticons hr | pagebreak nonbreaking | insertdatetime',
    },
    format: {
      title: 'Format',
      items: 'bold italic underline strikethrough superscript subscript codeformat | styles blocks fontfamily fontsize align lineheight | forecolor backcolor | language | removeformat',
    },
    tools: {
      title: 'Tools',
      items: 'code wordcount'
    },
    table: {
      title: 'Table',
      items: 'inserttable | cell row column | advtablesort | tableprops deletetable',
    },
  },
  toolbar: 'undo redo | bold italic underline strikethrough | fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent | numlist bullist | forecolor backcolor removeformat | pagebreak | charmap emoticons | preview | insertfile media link codesample | ltr rtl',
  toolbar_sticky: true,
  height: 400,
  quickbars_selection_toolbar: 'bold italic | quicklink h2 h3 blockquote quickimage quicktable',
  noneditable_noneditable_class: 'mceNonEditable',
  toolbar_mode: 'sliding',
  contextmenu: 'link image imagetools table'
}
