<template>
  <div>
    <a-modal v-model="visible" @ok="close" v-bind:name="formTitle" width=60%>
      <a-form-model ref="editedItem" :model="editedItem" :rules="rules">
        <a-row>
          <a-col :xs="12">
            <product-image
              :product_pictures="editedItem.pictures_attributes"
              @updatePicturesList="updatePicturesList"
            />
            <a-form-model-item label="Mô tả" prop="content">
              <ckeditor
                v-model="editedItem.description"
                :config="editorConfig"
              ></ckeditor>
            </a-form-model-item>
          </a-col>
          <a-col :xs="12">
            <a-form-model-item label="Tên sản phẩm" prop="name">
              <a-input placeholder="Tên sản phẩm" v-model="editedItem.name" />
            </a-form-model-item>
            <a-form-model-item label="Giá nhập" prop="price">
              <a-input
                placeholder="Giá nhập"
                type="number"
                min="0"
                v-model="editedItem.price"
              >
                <span slot="addonAfter">VNĐ</span>
              </a-input>
            </a-form-model-item>
            <a-form-model-item label="Giảm giá" prop="discount">
              <a-input
                placeholder="Giảm giá"
                type="number"
                min="0"
                v-model="editedItem.discount"
              >
                <span slot="addonAfter">%</span>
              </a-input>
            </a-form-model-item>
            <a-form-model-item label="Giá sau khi giảm" prop="price_sale">
              <a-input
                placeholder="Giá sau khi giảm"
                v-model="editedItem.price_sale"
              >
                <span slot="addonAfter">VNĐ</span>
              </a-input>
            </a-form-model-item>
            <a-form-model-item label="Categories" prop="category_id">
              <a-select
                default-value="--/--"
                style="width: 100%"
                v-model="editedItem.category_id"
              >
                <a-select-option
                  v-for="category in categoriesChild"
                  :key="category.id"
                >
                  {{ category.name }}
                </a-select-option>
              </a-select>
            </a-form-model-item>
            <a-form-model-item label="Link youtube:" prop="youtube">
              <a-input placeholder="Link youtube:" v-model="editedItem.youtube" />
            </a-form-model-item>
            <a-row>
              <a-form-model-item class="float-right">
                <a-button type="primary" @click="saveModal('editedItem')">
                  Lưu
                </a-button>
              </a-form-model-item>
            </a-row>
          </a-col>
        </a-row>
      </a-form-model>
    </a-modal>
  </div>
</template>
<script>
import axios from "axios";
import news from "../../pages/news";
import productImage from "../../pages/product/product_image";
import { URLS } from "../../utils/url";
export default {
  props: {
    changShow: Boolean
  },
  data() {
    return {
       editorData: "",
      editorConfig: {
        toolbar: [
          ["Source"],
          ["Styles", "Format", "Font", "FontSize"],
          ["Bold", "Italic"],
          ["Undo", "Redo"],
          ["Table"],
          ["Image"]
        ]
      },
      rules: {
        name: [
          {
            required: true,
            message: "Không được để trống tên",
            trigger: "blur"
          }
        ],
        // price: [
        //   {
        //     required: true,
        //     message: "Không được để trống giá",
        //     trigger: "blur"
        //   }
        // ],
        category_id: [
          {
            required: true,
            message: "Không được để trống",
            trigger: "blur"
          }
        ]
      },
      categoriesChild: [],
      dataNews: [],
      visible: false,
      editedIndex: -1,
      editedItem: {},
      empty: [],
      defaultItem: {
        pictures_attributes: []
      }
    };
  },
  mounted() {
    this.categories();
  },
  methods: {
    updatePicturesList(pictures_ids) {
      this.editedItem.pictures_ids = pictures_ids;
    },
    discountedPrice() {
      this.editedItem.price_sale =
        this.editedItem.price -
        this.editedItem.price * (this.editedItem.discount / 100);
      return this.editedItem.price_sale;
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
      this.visible = true;
    },
    categories() {
      return axios
        .get(URLS.CATEGORIES())
        .then(response => {
          this.categoriesChild = response.data;
        })
        .catch(e => {
          console.log(e);
        });
    }
  },
  components: {
    productImage
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
div#cke_editor1{
  width: 90%;
}
</style>