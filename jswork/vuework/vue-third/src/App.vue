<template>
  <div>
    <div class="menu">
      <!-- <a v-for="header in 3" :key="header">Home</a> -->
      <!-- <a v-for="(menu,i) in menus" :key="i">{{ menu }}</a> -->
      <a v-for="menu in menus" :key="menu">{{ menu }}</a>
    </div>
    <div class="celeb" v-for="(agency,key) in agencys" :key="key">
      <img :src="agency.imgSrc">
      <h3>{{ agency.name }}</h3>
      <p>{{ agency.company }}</p>
      <button @click="onClickLikes(key)">좋아요</button>
      <span>좋아요:{{ agency.likes }}</span>
    </div>


  </div>
</template>

<script>
export default {
  data() {


    return {
      menus: ['Home', 'Celeb', "About"],
      agencys: [{ name: '여진구', company: '하이브', likes: 0, imgSrc: require('./assets/images/1.jpg') },
      { name: '김철수', company: 'sm', likes: 0, imgSrc: require('./assets/images/3.jpg') },
      { name: '이영희', company: 'jyp', likes: 0, imgSrc: require('./assets/images/7.jpg') },
      { name: '박보영', company: '울림', likes: 0, imgSrc: require('./assets/images/12.jpg') },
      { name: '수지', company: '안테나', likes: 0, imgSrc: require('./assets/images/19.jpg') }]
    }
  },
  methods:{
    onClickLikes(num){
      //return에서 받아와야해서 agencys.likes임!
      this.agencys[num].likes++;
    }
    
    }
  }

</script>

<style lang="css" scoped>
.menu {
  background-color: aquamarine;
  padding: 10px;
  border-radius: 5px;
}

.menu a {
  color: blue;
  padding: 10px;
}

.celeb img {
  width: 200px;
  border-radius: 30px;
}
</style>