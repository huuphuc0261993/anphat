<template>
  <div>
    <a-modal v-model="visible" v-bind:title="formTitle" @ok="close" width="60%">
      <a-form-model ref="editedItem" :model="editedItem" :rules="rules">
        <a-form-model-item has-feedback label="Tiêu đề bài viết " prop="title">
          <a-input placeholder="Tiêu đề bài viết" v-model="editedItem.title" />
        </a-form-model-item>

        <a-form-model-item has-feedback label="Mô tả" prop="description">
          <a-input placeholder="Mô tả" v-model="editedItem.description" />
        </a-form-model-item>
        <a-form-model-item label="Loại bài viết" prop="type_post">
          <a-select
            style="width: 100%"
            v-model="editedItem.type_post"
          >
            <a-select-option v-for="type in type_post" :key="type.id">
              {{ type.name }}
            </a-select-option>
          </a-select>
        </a-form-model-item>
        <a-form-model-item has-feedback label="Nội dung" prop="content">
          <div>
            <ckeditor v-model="editorData" :config="editorConfig"></ckeditor>
          </div>
          <!-- <a-textarea placeholder="Nội dung" v-model="editedItem.content" /> -->
        </a-form-model-item>

        <a-button
          type="primary"
          @click="saveModal('editedItem')"
          :methods="uploadfile"
        >
          Submit
        </a-button>
        <br />
        <upload
          @uploadDtb="uploadfile"
          ref="form"
          :item="item"
          :editedIndex="editedIndex"
          :visible="visible"
        />
      </a-form-model>
    </a-modal>
  </div>
</template>
<script>
import editor from "../editor/editor";
import upload from "../modals/upload";
import axios from "axios";
import news from "../../pages/news";

export default {
  props: {
    changShow: Boolean,
  },
  data() {
    return {
      type_post: [
        {
          id: 1,
          name: "Tin tức",
        },
        {
          id: 2,
          name: "Tuyển dụng",
        },
      ],
      editorData: "",
      editorConfig: {
        toolbar: [
          ["Source"],
          ["Styles", "Format", "Font", "FontSize"],
          ["Bold", "Italic"],
          ["Undo", "Redo"],
          ["Table"],
          ["Image"],
        ],
      },
      rules: {
        title: [
          { required: true, message: "Vui lòng nhập tiêu đề", trigger: "blur" },
        ],
        description: [
          { required: true, message: "Vui lòng nhập mô tả", trigger: "blur" },
        ],
      },
      dataNews: [],
      visible: false,
      editedIndex: -1,
      editedItem: {
        title: "",
        image: "",
        description: "",
        content: "",
        type_post: ""
      },
      empty: [],
      item: [
        {
          uid: "-1",
          id: "",
          name: "",
          status: "",
          url: "",
        },
      ],
      item1: [
        {
          uid: "-1",
          name: "",
          status: "",
          url: "",
        },
      ],
      defaultItem: {
        title: "",
        image: "",
        description: "",
        content: "",
      },
    };
  },
  methods: {
    uploadfile(fileList) {
      let img = fileList[0];
      //quan trong khi update, ko dc xoa
      if (img != undefined) {
        this.editedItem.image = fileList[0];
      }
    },
    reset() {
      this.$refs.uploadEmtpy.resetupload();
    },
    showModal() {
      this.editedIndex = -1;
      
      this.editedItem = Object.assign({}, this.defaultItem);
      this.visible = true;
      this.item = this.empty;
    },
    close() {
      this.visible = false;
      setTimeout(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      }, 300);
    },
    saveModal(item) {
      this.editedItem.content = this.editorData;
      this.$refs[item].validate((valid) => {
        if (valid) {
          this.$emit("saveDtb", this.editedItem, this.editedIndex);
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    edit(item) {
      this.editorData = item.content;
      this.editedIndex = item.id;
      this.editedItem = Object.assign({}, item);
      this.item = this.item1;
      this.item[0].url = item.image.url;
      this.item[0].id = item.id;
      this.item[0].uid = item.id;
      this.visible = true;
    },
  },
  components: {
    upload,
    editor,
  },
  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "Thêm mới" : "Sửa tin tức";
    },
  },
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