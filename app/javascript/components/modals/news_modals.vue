<template>
  <div>
    <!-- <upload /> -->

    <a-modal v-model="visible" v-bind:title="formTitle" @ok="close">
      <a-form-model ref="editedItem" :model="editedItem" :rules="rules">

        <a-form-model-item has-feedback label="Tiêu đề bài viết " prop="title">
          <a-input placeholder="Tiêu đề bài viết" v-model="editedItem.title" />
        </a-form-model-item>

        <a-form-model-item has-feedback label="Mô tả" prop="description">
          <a-input placeholder="Mô tả" v-model="editedItem.description" />
        </a-form-model-item>

        <a-form-model-item has-feedback label="Nội dung" prop="content">
          <a-textarea placeholder="Nội dung" v-model="editedItem.content" />
        </a-form-model-item>

        <a-button type="primary" @click="saveModal('editedItem')">
          Submit
        </a-button>
        <br />
        
     
        <input
          type="file"
          id="file"
          ref="myFiles"
          class="custom-file-input"
          @change="takeFile"
          multiple
        />

      </a-form-model>
    </a-modal>
  </div>
</template>
<script>
// import upload from "../modals/upload";
import axios from "axios";
import news from "../../pages/news";
export default {
  props: {
    changShow: Boolean
  },
  data() {
 

    return {
      rules: {
        title: [
          { required: true, message: 'Vui lòng nhập tiêu đề', trigger: 'blur' }
        ],
        description: [
          { required: true, message: 'Vui lòng nhập mô tả', trigger: 'blur' }
        ],
        content: [
          { required: true, message: 'Vui lòng nhập nội dung', trigger: 'blur' }
        ]
      },
      dataNews: [],
      visible: false,
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
    takeFile(event) {
      this.editedItem.image = this.$refs.myFiles.files[0];
      console.log(this.editedItem.image);
    },
    showModal() {
      this.editedIndex = -1;
      this.editedItem = Object.assign({}, this.defaultItem);
      this.visible = true;
    },
    close() {
      this.visible = false;
      setTimeout(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      }, 300);
    },
    saveModal(item) {
      this.$refs[item].validate(valid => {
        if (valid) {
          this.$emit("saveDtb", this.editedItem, this.editedIndex);
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    edit(item) {

      this.editedIndex = item.id;
      this.editedItem = Object.assign({}, item);
      // this.$refs.editedItem.resetFields();
      this.visible = true;
    }
  },
  components: {
    // upload
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