<template>
  <div>
    <a-modal v-model="visible" @ok="close" v-bind:name="formTitle">
      <a-form-model>
        <a-row>
          <a-col :xs="12"> <upload /> </a-col>
          <a-col :xs="12">
            <a-form-model-item label="Tên sản phẩm" prop="name">
              <a-input placeholder="Tên sản phẩm" v-model="editedItem.name" />
            </a-form-model-item>
            <a-form-model-item has-feedback label="Mô tả" prop="description">
              <a-textarea
                placeholder="Mô tả"
                v-model="editedItem.description"
              />
            </a-form-model-item>
            <a-form-model-item label="Giá nhập" prop="price">
              <a-input
                placeholder="Giá nhập"
                type="number"
                min="0"
                v-model="editedItem.price"
              >
                {{ discountedPrice() }}
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
                type="number"
                min="0"
                v-model="editedItem.price_sale"
              >
                <span slot="addonAfter">VNĐ</span>
              </a-input>
            </a-form-model-item>
            <a-form-model-item label="Categories" prop="category_id">
              <a-select default-value="--/--" style="width: 100%" v-model="editedItem.category_id">
                <a-select-option
                  v-for="category in categoriesChild"
                  :key="category.id"
                >
                  {{ category.name }}
                </a-select-option>
              </a-select>
            </a-form-model-item>
            <a-row>
              <a-form-model-item class="float-right">
                <a-button type="primary" html-type="submit">
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
import upload from "../modals/uploadProducts";
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
      categoriesChild: [],
      dataNews: [],
      visible: false,
      editedIndex: -1,
      editedItem: {
        name: "",
        price: "",
        description: "",
        discount: "",
        price_sale: "",
        category_id: ""
      },
      empty: [],
      defaultItem: {
        name: ""
      }
    };
  },
  mounted() {
    this.categories();
  },
  methods: {
    discountedPrice() {
      this.editedItem.price_sale =
        this.editedItem.price -
        this.editedItem.price * (this.editedItem.discount / 100);
      console.log(this.editedItem.price_sale);
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
    },
    categories() {
      return axios
        .get("http://localhost:3000/api/categories")
        .then(response => {
          this.categoriesChild = response.data;
          console.log(this.categoriesChild);
        })
        .catch(e => {
          console.log(e);
        });
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