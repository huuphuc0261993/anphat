<template>
  <div>
    <a-modal v-model="visible" v-bind:title="formTitle" @ok="close" >
      <a-form-model-item label="Tiêu đề bài viết " prop="title">
        <a-input placeholder="Tiêu đề bài viết" v-model="editedItem.title" />
      </a-form-model-item>

      <a-form-model-item label="Mô tả" prop="description">
        <a-input placeholder="Mô tả" v-model="editedItem.description" />
      </a-form-model-item>

      <a-form-model-item label="Nội dung" prop="content">
        <a-textarea placeholder="Nội dung" v-model="editedItem.content" />
      </a-form-model-item>

      <a-button type="primary" @click="saveModal(editedItem)">
        Submit
      </a-button>
      <upload />
    </a-modal>
  </div>
</template>
<script>
import upload from "../modals/upload";
import axios from "axios";
import news from "../../pages/news";
export default {
  props:{
    changShow: Boolean
  },
  data() {
    return {
      dataNews: [],
      visible : false,
      editedIndex: -1,
      editedItem: {
        title: "",
        image: "",
        description: "",
        content: ""
      },
      defaultItem: {
        title: "",
        image: "",
        description: "",
        content: ""
      }

    };
  },
  methods: {
     showModal() {
        this.editedIndex = -1;
        this.editedItem = Object.assign({}, this.defaultItem);
        this.visible=true
    },
    close() {
      this.visible = false;
      setTimeout(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      }, 300);
    },
    saveModal(item){
      this.$emit('saveDtb',item, this.editedIndex)
    },
    edit(item){
      this.editedIndex = item.id;
      this.editedItem = Object.assign({}, item);
      this.visible = true;
    }
    
  },
  components: {
    upload
  },
  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "Thêm mới" : "Sửa tin tức";
    }
  }
};
</script>
<style>
button.ant-btn.ant-btn-primary {
  margin-bottom: 16px;
  width: 150px;
  border-radius: 0px;
  height: 40px;
}
button.ant-btn {
  margin-bottom: 16px;
  width: 150px;
  border-radius: 0px;
  height: 40px;
}
.ant-modal-footer {
  display: none;
}
</style>