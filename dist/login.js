// Create a new Vue instance

const vuemain = Vue.createApp({

    // Data Properties
    data() {
        return {


            username: "",
            password: "",

            logged_in_user: "",

            error_msg: "",

            new_name: "",
            new_username: "",
            new_email: "",
            new_password: "",
            new_confirm_password: "",

            success_msg: ""

        }
    },

    

    // created: function() {
    //     console.log("=== created ===")

    //     // Do you need to do anything here so that
    //     // when activity2.html loads for the first time
    //     // <table> shows all messages from the API?
    //     // HINT: Did you already implement this method?
    //     //       This method retrieves all messages from API
    //     //       and makes the data available in a Data Property
    //     //       that <table> relies on.
    // },


    methods: {

        login(){

            let api_endpoint = "http://localhost/roofBlanket_api/api/user/authenticate_login.php"

            let login_details = {
                username: this.username,
                password: this.password
            }

            axios.get(api_endpoint, { 
                params: login_details
            })
            .then(response => {
                console.log( response.data )
                user_id = response.data.records[0].id
                console.log(user_id)
                sessionStorage.setItem("userid", user_id);
                this.error_msg = ""
                window.location.href = "index_jialer.html"

                
            })
            .catch(error => {
                console.log( error.message )
                this.error_msg = "Invalid Username/Password"
            })


        },

        register_user(){

            // check if password == confirm password

            // check if all fields are filled 

            if (this.new_name != '' & this.new_username != '' & this.new_email != '' & 
            this.new_password != '' & this.new_password == this.new_confirm_password){


                let api_endpoint = "http://localhost/roofBlanket_api/api/user/registeruser.php"

                let new_user = {

                    name: this.new_name,
                    username: this.new_username,
                    email: this.new_email,
                    password: this.new_password,

                }

                axios.get(api_endpoint, { 
                    params: new_user
                })
                .then(response => {
                    console.log( response.data )
                    this.success_msg = "Account created successfully"

                    this.error_msg = ""
                    this.success_msg = ""
                    window.location.href = "login.html"

                    
                })
                .catch(error => {
                    console.log( error.message )
                    this.error_msg = "Unable to create account"
                })

                }

            else{
                this.error_msg = "Invalid registration details "
            }

        }

    
    },
})

// Link this Vue instance with <div id="main">
vuemain.mount("#loginpage")