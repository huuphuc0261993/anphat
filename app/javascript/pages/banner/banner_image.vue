<template>
  <div class="clearfix">
    <a-upload
      :multiple="true"
      :action="imageUploadUrl"
      list-type="picture-card"
      :file-list="fileList"
      @preview="handlePreview"
      @change="handleChange"
    >
      <div v-if="fileList.length < 3">
        <a-icon type="plus" />
        <div class="ant-upload-text">
          Upload
        </div>
      </div>
    </a-upload>
    <a-modal :visible="previewVisible" :footer="null" @cancel="handleCancel">
      <img alt="example" style="width: 100%" :src="previewImage" />
    </a-modal>
  </div>
</template>
<script>
function getBase64(file) {
  return new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = () => resolve(reader.result);
    reader.onerror = error => reject(error);
  });
}
import { URLS } from "../../utils/url";
export default {
  watch: {
    product_pictures: {
      handler: function() {
        this.initFileList();
      }
    }
  },
  mounted() {
    this.initFileList();
  },
  data() {
    return {
      previewVisible: false,
      imageUploadUrl: URLS.IMAGES,
      previewImage: "",
      fileList: []
    };
  },
  props: {
    product_pictures: {
      type: Array
    }
  },
  methods: {
    initFileList() {
      this.fileList = JSON.parse(JSON.stringify(this.$props.product_pictures));
    },
    handleCancel() {
      this.previewVisible = false;
      this.updateImageIds()
    },
    async handlePreview(file) {
      if (!file.url && !file.preview) {
        file.preview = await getBase64(file.originFileObj);
      }
      this.previewImage = file.url || file.preview;
      this.previewVisible = true;
    },
    handleChange({ fileList }) {
      this.fileList = fileList;
      this.updateImageIds()
    },
    updateImageIds() {
      
      let pictures_ids = this.fileList.map(object => {
        if (object.status === "done") {
          return object.response.id;

        } else {
          return object.id;
        }
      });

      this.$emit("updatePicturesList", pictures_ids);
    }
  }
};
</script>
<style>
/* you can make up upload button and sample style by using stylesheets */
.ant-upload-select-picture-card i {
  font-size: 32px;
  color: #999;
}

.ant-upload-select-picture-card .ant-upload-text {
  margin-top: 8px;
  color: #666;
}
</style>
