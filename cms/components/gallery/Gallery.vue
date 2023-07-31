<template lang="html">
	<div class="box mb">
		<div class="top_box inline">
			<h2>{{ title }}</h2>
			<template v-if="show_adding && (countRecords < max_number)">
				<div class="success button pointer" @click="addItem()">
					<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>
					<span>New Item</span>
				</div>
			</template>
		</div>
		<div class="bottom_box nmb">
			<div class="group nmb">
				<ul class="gallery">
					<template v-for="(item, key) in gallery">
						<template v-if="item.show">
							<li :key="key">
								<template v-if="!item.type">
									<div class="actions inline centered">
										<div class="info button pointer" @click="itemType(key, 'image')">
											<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>
											<span>Add Image</span>
										</div>
										<template v-if="show_videos">
											<div class="info button ml ten pointer" @click="itemType(key, 'video')">
												<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>
												<span>Add Video</span>
											</div>
										</template>
									</div>
								</template>
								<template v-else>
									<template v-if="item.type == 'image'">
										<div class="group">
											<image-handler-container
												:image_label="'Image'"
												:input_name="image_input_name"
												:category="image_input_name"
												:show_image_caption="show_image_caption"
												:show_sequence="show_sequence"
												:data="(update && item.record) ? [item.record] : [item.id]"
												:parent="(update && item.record) ? item.record.parent_id : 0"
											/>
										</div>
									</template>
									<template v-else>
										<template v-if="show_videos">
											<video-container
												:item="item"
												:update="(item.id) ? update : false"
											/>
										</template>
									</template>
								</template>
								<template v-if="countRecords != 1">
									<div class="actions inline centered nmb">
										<div class="cancel button pointer" @click="removeItem(key)">
											<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24"  fill="none" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg>
											<span>Remove</span>
										</div>
									</div>
								</template>
							</li>
						</template>
					</template>
				</ul>
			</div>
		</div>
	</div>
</template>

<script>
	export default {
		components: {
			ImageHandlerContainer: () => import('~/components/file/ImageHandlerContainer'),
			VideoContainer: () => import('~/components/gallery/Video')
		},
		props: {
			records: {
				type: Object/Array,
				default: null
			},
			title: {
				type: String,
				default: 'Gallery'
			},
			image_input_name: {
				type: String,
				default: 'gallery'
			},
			show_adding: {
				type: Boolean,
				default: true
			},
			show_image_caption: {
				type: Boolean,
				default: false
			},
			show_sequence: {
				type: Boolean,
				default: true
			},
			show_videos: {
				type: Boolean,
				default: true
			},
			update: {
				type: Boolean,
				default: false
			},
			max_number: {
				type: String/Number,
				default: 6
			}
		},
		data: ({ records }) => ({
			gallery: (records) ? records : [ { id: 0, show: true, type: '', record: null } ]
		}),
		computed: {
			countRecords () {
				let ctr = 0
				this.gallery.forEach((item, i) => {
					if (item.show) {
						ctr += 1
					}
				})

				return ctr
			}
		},
		methods: {
			itemType (key, type) {
				this.gallery[key].type = type
				switch (type) {
					case 'image':

						break
					case 'video':
						this.gallery[key].record = {
							url: '',
							type: '',
							sequence: '',
							image: [
								{
									id: 0
								}
							]
						}
						break
				}
			},
			addItem () {
				if (this.countRecords < this.max_number) {
					this.gallery.push({
						id: this.gallery[this.gallery.length - 1].id + 1,
						show: true,
						type: '',
						record: null
					})
				}
			},
			removeItem (key) {
				this.gallery[key].show = false
			}
		}
	}
</script>
