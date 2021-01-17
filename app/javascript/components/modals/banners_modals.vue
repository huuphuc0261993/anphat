<template>
  <div>
    <a-modal v-model="visible" @ok="close"  width="60%">
      <a-form-model ref="editedItem" :model="editedItem" :rules="rules">
        <a-row>
          <a-col :xs="12">
            <banner-image
              :banner_pictures="editedItem.pictures_attributes"
              @updatePicturesList="updatePicturesList"
            />
          </a-col>
          <a-col :xs="12">
            <a-form-model-item label="Title" prop="name">
              <a-input
                placeholder="Nhập title cho banner"
                v-model="editedItem.name"
              />
            </a-form-model-item>
            <a-form-model-item label="Loại Banner" prop="banner_type">
              <a-select
                default-value="--/--"
                style="width: 100%"
                v-model="editedItem.banner_type"
              >
                <a-select-option v-for="banner in banner_type" :key="banner.id">
                  {{ banner.name }}
                </a-select-option>
              </a-select>
              <a-collapse default-active-key="1" class="mb-3" v-if="editedItem.banner_type == 4">
                <a-collapse-panel key="1" header="Danh sách quản lý">
                  <a-row>
                    <a-form-model-item>
                      <a-input  v-model="editedItem.fullname" placeholder="Họ và tên"></a-input>
                      <a-input v-model="editedItem.position" placeholder="Chức vụ"> </a-input>
                      <a-input v-model="editedItem.work" placeholder="Công việc"> </a-input>
                      <a-input v-model="editedItem.description"  placeholder="Mô tả"> </a-input>
                    </a-form-model-item>
                  </a-row>
                </a-collapse-panel>
              </a-collapse>
              
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
import bannerImage from "../../pages/banner/banner_image";

export default {
  props: {
    changShow: Boolean
  },
  data() {
    return {
      key:"",
      rules: {
        banner_type: [
          {
            required: true,
            message: "Không được để trống",
            trigger: "blur"
          }
        ]
      },
      banner_type: [
        {
          id: 1,
          name: "Banner chính"
        },
        {
          id: 2,
          name: "Banner phụ"
        },
        {
          id: 3,
          name: "Upload"
        },
        {
          id: 4,
          name: "Giới thiệu"
        }
      ],
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
  mounted() {},
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
    }
  },
  components: {
    bannerImage
  },
  computed: {}
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