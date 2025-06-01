export default {
  template:`
  <div>
  <h1>About</h1>
  <p>This is about page</p>
  <div>
    {{ count }}
    <button @click="count++">Count</button>
  </div>
  </div>
  `,
  data() {
    return {
        count: 0
    }
  }
};
