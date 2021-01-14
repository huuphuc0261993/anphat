<template>
  <div>
    <a-row>
      <a-form-model-item label="Tiêu đề " prop="name">
        <a-input
          placeholder="Tiêu đề "
          v-model="editedItem.title"
          size="large"
        />
      </a-form-model-item>
      <a-form-model-item label="Mô tả" prop="description">
        <a-input
          placeholder="Mô tả "
          v-model="editedItem.description"
          size="large"
        />
      </a-form-model-item>
      <a-form-model-item label="Nội dung" prop="content">
        <editor ref="child" />
      </a-form-model-item>
      <a-row>
        <a-col :xs="12">
          <a-col :xs="3">
            <a-form-model-item label="Loại bài viết"></a-form-model-item>
          </a-col>
          <a-col :xs="9">
            <a-select
              :default-value="{ key: '--/--' }"
              style="width: 100%"
              @change="handleChange"
              size="large"
              v-model="editedItem.info"
            >
              <a-select-option v-for="e in info" :key="e.id"  >
                {{ e.name }}
              </a-select-option>
            </a-select>
          </a-col>
        </a-col>
        <a-col :xs="12">
          <a-form-model-item class="float-right">
            <a-button
              type="primary"
              @click="save()"
              style="width: 350px; margin-top: 0px"
            >
              Lưu
            </a-button>
          </a-form-model-item>
        </a-col>
      </a-row>
    </a-row>
  </div>
</template>
<script>
import editor from "../editor/editor"
import axios from "axios";
import { URLS } from "../../utils/url";
export default {
  data() {
    return {
      editedItem: {},
      info: [
        {
          id: 1,
          name: "Giới thiệu"
        },
        {
          id: 2,
          name: "Liên hệ"
        },
        {
          id: 3,
          name: "Chính sách bảo hành"
        },
        {
          id: 4,
          name: "Chính sách thanh toán"
        },
        {
          id: 5,
          name: "Chính sách đổi trả"
        }
      ]
    };
  },
  components: {editor},
  computed: {},
  mounted() {},
  methods: {
    handleChange(value) {
      console.log(value);
    },
    save(){
     
        let information = this.editedItem
         axios
          .post(URLS.INFORMATIONS(), {
            information: information
          })
          .then(response => {
            console.log("Created!");
            this.$message.success("Khởi tạo thành công");
            this.$router.push({ name: "Info" })
          })
          .catch(error => {
            console.log(error);
          });
    }
  }
};
</script>
