export default {

template:`
  <div>
    <!-- <h1>List</h1> -->
    <div class="row row-cols-auto">
     <!-- <router-link :to="{ name: 'edit' }" class="btn btn-primary">Create</router-link> -->
      <!-- Search bar -->
      &nbsp&nbsp&nbsp <input type="text" v-model="searchterm" v-on:keyup.enter="dataRows" placeholder="Search"><button
        v-on:click="clearsearch">x</button>
      <button @click="getrecords">Search</button>
      &nbsp Recrds: {{recordcnt}}
    </div>
    <!-- <br /> -->

    <table class="table table-hover">
      <thead>
        <tr>
          <th>id</th>
          <th>link</th>
          <th>Application</th>
          <!--<th>Actions</th>-->
        </tr>
      </thead>
      <tbody>
        <tr v-for="dataRow in fdataRows" :key="dataRow.id">
          <td>{{ dataRow.id }}</td>
          <td>{{ dataRow.mlink }}</td>
          <td>{{ dataRow.mapplication }}</td>
          <td>
            <!-- <router-link :to="{name: 'edit', params: { id: dataRow.id }}" class="btn btn-primary">Edit</router-link> -->
          </td>
          <!-- <td><button class="btn btn-danger" @click.prevent="deletedataRow(dataRow.id)">Delete</button></td> -->
        </tr>
      </tbody>
    </table>
  </div>
`,

  data() {
    return {
      dataRows: [],
      recordcnt: 0,
      searchterm: "",
      accessToken: "",
    }
  },
  mounted() {
    if ("localsearchterm" in localStorage) {
      this.searchterm = localStorage.getItem("localsearchterm");
    }
    this.getrecords();
  },
  methods: {
    clearsearch() {
      this.searchterm = "";
      this.getrecords();
    },
    getrecords() {
      localStorage.setItem("localsearchterm", this.searchterm);
      // this.accessToken = localStorage.getItem("jwtToken");
      // this.accessToken = localStorage.getItem("jwtToken");;
      // let head = { headers: {   Authorization: `Bearer ${this.accessToken}`   } };
      let uri = `http://10.4.71.231:37461/menuapp/api/v1/Menu0`;
      console.log(uri);
      axios.get(uri).then(response => {
        console.log(response);
        this.dataRows = response.data.results;
        this.recordcnt = response.data.count;
      }).catch(e => { this.$root.doError(e) });
    },
  },
  computed: {
    fdataRows() {       
      return this.dataRows.filter(dataRow => {
        const mdescription = dataRow.mdescription.toLowerCase();
        const mapplication = dataRow.mapplication.toLowerCase();
        const searchterm2 = this.searchterm.toLowerCase();
        return (
          mapplication.includes(searchterm2) || mdescription.includes(searchterm2));
      });
    }
  }
}

