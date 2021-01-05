<template>
  <div>
    <section class="banner-goggles ratio2_3" style="padding-top:70px">
      <div class="container-fluid">
        <div class="row partition3">
          <div class="col-md-4" v-for="(item, index) in items" :key="index">
            <a v-if="item.banner_type == 2">
              <div class="collection-banner p-left text-center">
                <div class="img-part">
                  <img
                    :src="item.pictures_attributes[0].url"
                    class="img-fluid"
                    alt
                  />
                </div>
                <div class="contain-banner banner-3">
                  <div>
                    <h4>{{ item.subtitle }}</h4>
                    <h2>{{ item.title }}</h2>
                  </div>
                </div>
              </div>
            </a>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script type="text/javascript">
import axios from "axios";
import { URLS } from "../../utils/url";
export default {
  mounted() {
    this.initialize();
  },
  methods: {
    initialize() {
      axios
        .get(URLS.BANNERS(), {})
        .then(response => {
          this.items = response.data;
          this.items.forEach((element, index) => {
            if (element.banner_type != 2) {
              this.items.splice(index, 1);
            }
          });
        })
        .catch(error => {
          console.log(error);
        });
    }
  },
  data() {
    return {
      items: [
        {
          imagepath: "/uploads/assets/images/electronics/sub1.jpg",
          title: "speaker",
          subtitle: "30% off"
        }
      ]
    };
  }
};
</script>
