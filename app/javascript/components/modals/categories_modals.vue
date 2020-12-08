<template>
  <div>
    <a-modal v-model="visible" v-bind:name="formTitle" @ok="close">
      <a-form-model ref="editedItem" :model="editedItem" :rules="rules">
        <a-form-model-item has-feedback label="Tên " prop="name">
          <a-input placeholder="Category" v-model="editedItem.name" />
        </a-form-model-item>

        <a-button type="primary" @click="saveModal('editedItem')">
          Submit
        </a-button>
        <br />
      </a-form-model>
    </a-modal>
  </div>
</template>
<script>
import upload from "../modals/upload";
import axios from "axios";
import news from "../../pages/news";
export default {
  props: {
    changShow: Boolean
  },
  data() {
    return {
      rules: {
        name: [
          {
            required: true,
            message: "Không được để trống tên",
            trigger: "blur"
          }
        ]
      },
      dataNews: [],
      visible: false,
      editedIndex: -1,
      editedItem: {
        name: ""
      },
      empty: [],
      defaultItem: {
        name: ""
      }
    };
  },
  methods: {
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
      console.log("day la editItem");
      console.log(this.editedItem);
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
      this.visible = true;
    }
  },
  components: {
    upload
  },
  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "Thêm mới" : "Sửa Category";
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