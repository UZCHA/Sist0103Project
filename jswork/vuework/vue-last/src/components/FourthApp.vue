<template>
    <div>
        <h1 class="alert alert-info">FourthApp입니다</h1>
        <div v-for="info in infoArray" :key="info">
            <h3>{{ info.id + "/" + info.user }}</h3>
        </div>
        <div>
            <li v-for="fruit in fruitArray" :key="fruit">{{ fruit }}</li>

        </div>
    </div>
</template>

<script>
export default {
    setup() {

        const fruitArray = ['apple', 'banana', 'orange'];
        const infoArray = [{ id: 0, user: '영수' },
        { id: 1, user: '철수' },
        { id: 2, user: '지수' },
        { id: 3, user: '남수' },]

        return {
            fruitArray, infoArray
        }
    }
}
</script>

<style lang="scss" scoped></style>