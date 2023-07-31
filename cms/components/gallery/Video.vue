<template lang="html">
	<div class="group">
		<ValidationProvider tag="div" class="group bordered" name="video url" :rules="{ required: true, regex: /^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ }" :vid="`video_${item.id}_url[]`" v-slot="{ errors }">
			<label :for="`url_${item.id}`">URL *</label>
			<input type="text" :name="`videos[${item.id}][url]`" :id="`url_${item.id}`" autocomplete="off" class="input" v-model="item.record.url">
			<transition name="slide"><span class="validate" v-if="errors.length > 0">{{ errors[0] }}</span></transition>
		</ValidationProvider>
		<div class="group_inline two">
			<ValidationProvider tag="div" class="group bordered nmb" name="video type" :rules="{ required: true }" :vid="`video_${item.id}_type[]`" v-slot="{ errors }">
				<label :for="`type_${item.id}`">Type *</label>
				<select class="input" :name="`videos[${item.id}][type]`" :id="`type_${item.id}`" v-model="item.record.type">
					<option value="" disabled selected>Select video type</option>
					<option value="youtube">Youtube</option>
					<option value="vimeo">Vimeo</option>
				</select>
				<div class="dd"></div>
				<transition name="slide"><span class="validate" v-if="errors.length > 0">{{ errors[0] }}</span></transition>
			</ValidationProvider>
			<ValidationProvider tag="div" class="group bordered nmb" name="video sequence" :rules="{ required: true, numeric: true }" :vid="`video_${item.id}_sequence[]`" v-slot="{ errors }">
				<label :for="`sequence_${item.id}`">Sequence *</label>
				<input type="text" :name="`videos[${item.id}][sequence]`" :id="`sequence_${item.id}`" autocomplete="off" class="input" v-model="item.record.sequence">
				<transition name="slide"><span class="validate" v-if="errors.length > 0">{{ errors[0] }}</span></transition>
			</ValidationProvider>
		</div>
		<div class="group nmb">
			<image-handler-container
				:image_label="'Image'"
				:input_name="'videos_image'"
				:category="'videos_image'"
				:data="(update) ? item.record.image : [item.id]"
			/>
		</div>
	</div>
</template>

<script>
	export default {
		components: {
			ImageHandlerContainer: () => import('~/components/file/ImageHandlerContainer')
		},
		props: {
			item: {
				type: Object/Array,
				default: null
			},
			update: {
				type: Boolean,
				default: false
			}
		}
	}
</script>
