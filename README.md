# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


NOTES : 

1- The GemFile is where we add any third party things into the web app of ours, we can install it and add it there


2- Rails is called a MVC arcitecture, Modules View Controller =>

-> Modules : tehy are data bases, and with Rails we can use differrent databases, fruthermore we can change the database without the need to change the code, but to add the DB into thre gemFile and that's pretty much it!

-> Views : they r web pages "html, css etc.."

-> Controller : The brain behind the scene! which will do the coding things behind the scene for the veiws 

#In the app dir :
    1- assests dir : here is the css, images & js stuff.
    
    2- channels dir : #SEARCH FOR ITS USE.
    3- controllers dir : thats the modules of our controllers.
    
    4-models dir : parts of the models in the MVC.
    5- views dir : when we build web pages they gon end up in the views dir!

    6-config dir : 
        routes.rb : anytime we create a web page, it needs a route, every page needs a route "like the url fe, that's a route"!!

    7- All html pages end in .html.erb, which allows us to use embeded Ruby on the webpage!

    8- To create a page manually, we will have to create an inde.html.erb file, a route for the webpage and a controller for it!

    9- In the layouts dir > application.html : 
        <body>
            
            # This is the header for all of the pages 
            HEADER HERE...<br/><br/> 

            <%= yield %> # then is our index.html.erb page

            # last is the Footer for all of the page 
            <br/><br/>
            FOOTER HERE... 
    
            </body>


    10- To create a nav bar, we will need to cretae a partial, that partia we cretaed for the nav is the _header.html.erb in the homeDIr

    11- the <%= %> is how we show stuff on the web page using embedded Ruby, without the equal sign "=" the thing wont show up, so its useful if we wanna do a if-else conditions fe!

    12- To create a CRUD in rails, we sue something called Scaffold, to generate a scaffold, we run in the terminal the following command : 
    <rails g scaffold <table's name> <table's col>:<col's datatype> etc...>

        #Logic : 
            Here we r creeaing a DB module, we specify the DB table's name, then a space, then add the name of the first col in the table, then we add a :, then specify the type of data this col will hold, then a space separator, then another col etc...

    13- In almsot all of the web dev platforms, we first create a DB migration, and then we push that migration into our DB (The rials g DBTable command creates us a DB migration!)


    14- Supported dataTypes
            Active Record supports the following database column types:
                :binary
                :boolean
                :date
                :datetime
                :decimal
                :float
                :integer
                :primary_key
                :string
                :text
                :time
                :timestamp

                More info on the topic at => https://guides.rubyonrails.org/v3.2/migrations.html

    15- To migrate the migration ruby file of the db to the DB and get the schema file "which is the final product of the pushed tables/data to the DB", we run the following command : 
    rails db:migrate


    16- Gems are those third party things that do some job for our web apps!
    To handle fr the login/user management stuff, we use a gem called "Devise"
    -> ALL THE GEMS CAN BE FOUND IN RUBYGEMS.ORG

        #Usually to insallt a gem. we add it to the gemFile and run the command <bundle inatall> in the terminal, n it will install all of the gems in the gemFile

        ->YET! for the "Devise" gem, it aint work that way, we will have to do a couple of steps to install it after adding it to the gemFile!!

        #DEVISE INSTALLATION PROCESS:
            1- run the "bundle install" command in the terminal!

            2- Head to the Documentation page on gitHub of devise "The link is going to be on the rubyGems devise's page" 
            and there we will find the instructions on how to install devise!!!

            3- The config.action_mailer.default_url_options = { host: 'localhost', port: 3000 } :

            In this line of code, when we wanna push our web page on the internet, instead of localhost and p3000, we will have to add our host info, fe. lets say we using heruku webhosting, we will the info of our heruko host and so on...

            This code must be added to the development.rb file "in the phase of development" with the localhost info casually, and then in the production.rb with the host info included in it when we wanna push the web app online!

            ##THE COMMAND WILL GIVE US THE INSTRUCTIONS ON WHAT SHOULD BE DONE!

            4- The "rails g devise:views" command :
                When the gem "devise" in ruuning, it will need differnet pages "login, regiester, password reset etc..", so this command will gegnerate 'em for us!!

            5- The "rails generate devise MODEL" command : 
                This command creates a model "DataBase" for the gem "devise" to keep track of all of the mailer stuff! 
                <#NOTE: We can chane the MODEL to whatever name we want, in our case I picked the name user!>

            6- After we created the migration "user", now we will have to push it by running the command : 
                rails db:migrate 


    17- For the sign out, after we specifiy the peth, we will need to add the "method: :delete" code ->
        The sing out is a destroy/delete command, as when we sign in, a session gets created/starts, so when we wanna sign out, we simply delete/destroy that session!


    18- To make each user able to create theier own friends list, instead a single big friends list, we will have to use the "Associations"
        
        -> Associations :
            We have by now two databases, the one for the users and the other for the firends, thus, to make the user able to own their own unique friends list, we will need to associate the two databases "Link them together!" 

            Useful link on the Association :
            -> Link : https://guides.rubyonrails.org/association_basics.html


        -> The Types of Associations 
            Rails supports six types of associations:

                belongs_to
                has_one
                has_many
                has_many :through
                has_one :through
                has_and_belongs_to_many    

        We do our Associations inside of the models dir, inside of the friends.rb and users.rb files!

        #After adding the belongs_to :user to the friends.rb file & the has_many :friends to the user.rb file, we will have to create a userID and link it to each of its friends, and to do that, we will need to update the db we have, thus we run the following command in the terminal : 

            -> rails g migration add_user_id_to_friends user_id:integer:index 

                # This command is to create a migration, add a userID of the type int to the friends db

            -> Now we need to push the migration -> rails db:migrate 


        #NEXT, we will have to tell the app that when we create a new user, we want it to belong to a specific user!
        So we add a hidden field in the form of adding a friend to determine the id of the user we are creating a friend to :

        The field -> inside of a div, we pass the following embedded ruby line : 
            <%= form.number_field :user_id, id: :friend_user_id ,class:"form-control", value: current_user.id, type: :hidden %>

            1- id: :friend_user_id -> here we are telling the app to link this friend we are creating to the user id
            
            2- value: current_user.id -> this will give the user his unique id
            
            3- type: :hidden -> this is used so the field aint get showed on the form, cuz we aint want the user to input nothing, we will automatically generate the data required for this field!

        #SUPER CRUCIAL STEP :
            In the controllers dir, in the friends controller, we will find a def at the end called friends params, the params are actually the forms, login, logout, register etc... they are all params!

            def friend_params
                params.require(:friend).permit(:first_name, :last_name, :email, :phone, :twitter)
            end

            As we can see, the param for a friend, will PERMIT the following data : first_name, last_name, email, phone, twitter 
            Thus, to allow it to let in the user_id, so the app is able to take the user_id and associate to it the added friend, we will have to add the attr to it : 

                    params.require(:friend).permit(:first_name, :last_name, :email, :phone, :twitter, :user_id)

                    #By ADDING IT, WE WILL NO LONGER ENCOUNTER THE ERROR <PROHIBTED FROM SAVING THIS USER : USER MUST EXIST>

        #LAST STEP :

            -> By now, we are half the way throw, yet the friends list is visible even for the user who aint logged in without the ability to edit it, though for the logged in users, the same friends list shows up for all, and they all can see, edit or delete the friend any of the other users has added!!!

            LET'S FIX THAT : 

                1- To fix the not logged in users permissions, we will need set up something called <before_action> :

                    before_action :authenticate_user!, except: [:index, :show]

                        This code, tells ruby that before the user is authenticated, don't allow 'em to do nothing but to access the show method and the index page with the friends list!


                2- To fix the problem of friends appearing to everone who's logged in, and permit them to edit or destroy the friend, we have two ways :

                    METHOD-1 : The easy way : 

                        Add : 
                        <% if friend.user == current_user %> 
                            Here we add the destroy, edit options!
                        <%else%>
                            Here we add nothing "remove the destroy and edit options!    
                        <%end%>

                    Tho, this way ain't really good, nor effective, thus we better off without it, and using the second way!


                    METHOD-2 : THE HARDER, YET EFFECT RIGHT WAY TO DO IT :

                        1- In the friends controller, we will add a function to check if the logged in user, is the auther of the friend :

                            def correct_user
                                @friend = current_user.friends.find_by(id: params[:id])
                                redirect_to friends_path, notice: "Unauthorized to edit this friend sucker!" if @friend.nil?
                            end  


                            This will check if @friend is the friend created by the current logged in user
                            we take the current_user, look into their database of friends using <.friends.find_by()>

                            and inside we specify the <id: params[:id]> to be the id of the friend, and not the user_id <we matching this friend with the friends in the user's friends database, thus we will need the id created for the firend when it was added and not the id of the currect user!>


                        2- We add a before_action : 

                            before_action :correct_user, only: [:edit, :destroy, :update]

                            here we tell the app, that before the the authentication of the correct user "The user who added the friend", allow all of the actions, except the three of (destroy user, update user, and edit user)


                        3- MODIFICATION TO THE "NEW" FUNCTION :

                                def new
                                    @friend = Friend.new
                                end

                                instead of the Friend.new, we will need to add @friend = current_user.friend.build
                                So when a new friend is added, it gets associated to the user who created it, istead of all the users logged in!

                                def new
                                    @friend = current_user.friend.build
                                end


                        4- MODIFICTION TO THE "CREATE" FUNCTION : 

                            def create
                                @friend = Friend.new(friend_params)

                                respond_to do |format|
                                    if @friend.save
                                        format.html { redirect_to friend_url(@friend), notice: "Friend was successfully created." }
                                        format.json { render :show, status: :created, location: @friend }
                                    else
                                        format.html { render :new, status: :unprocessable_entity }
                                        format.json { render json: @friend.errors, status: :unprocessable_entity }
                                    end
                                end
                            end

                            Here instead of the Friend.new(friend_params), we will need to add @friend = current_user.friend.build(friend_params)
                            Again, so it associated the created friend to the user who created it, rather than to all of the logged in users!!

    19- HIDING THE FRIENDS LIST FROM THE UNSIGNED-IN USERS :

        Another way to hiding the friends list from the not signed in users, rather than adding the before_action :authenticate_user!, is by adding an ambedded ruby code to our friends > index.html.erb page : 

            <% if user_signed_in? %>

                The index.html.erb code here

            <% esle %>

                The home > index.html.erb code here

            <% end %>


    20- <th colsapn="3"><th> : 

        This code, will merge the table header of the 3 following columns!        


    21- In the friends dir > index.html.erb we have the following block of code : 

        <% @friends.each do |friend| %>
            <% if friend.user == current_user %>   


        We notice that we have the @friend tag at the beginning, doing a for each loop, and making each as a firend object so it after shows thier information!

        That's why, inside of the that block, when we wanna refer to the friend, we ain't use @friend tag, but the word "friend", fr. in the <friend.user == current_user>, cuz we arldy defined that friend in the |friend| which is a one of the friends object the @friends loop, looped through 


        #-> ON THE OTHER HAND, in the friends dir > edit.html.erb : 

            We aint use the @friends tag to loop through, cuz we ain't wanna loop through a bunch of friends, but we wanna do edits on a specifc friend, that's why we use the "friend" keyword and not the @friends tag, like in   -> <% friend.errors.each do |error| %>


    21- ADDING A CONFIRMATION MSG BEFORE DELETING : 

        We can pop up a confirmation msg b4 deleting using two blocks of code added to the btn block : 

            1- form: { data: { turbo_confirm: "Are you sure?" } }

            2- data: {turbo_method: :delete, turbo_confirm: 'Are you sure?'}

            3- EXTRA WAY "Works only with the link_to, not the button_to" :
                data: { confirm: 'Are You Sure?' }


                
    22- We can use the contoller to fe, use another api's functionality, and insert it into our web app!

        #EXAMPLES on what can be done with the controller "SIlly examples, yet explains the point" are at -> Controllers dir >  home > about def 



    23- The .dir are hidden, so fe when we create a dir and want it to be hidden, we add the dot to it!

    24- If there ain't not ssh key, to push and pull repositories securly on GitHub, we will have to generate one : 

        1- mkdir ~/.ssh 
            This command will make a hidden dir called .ssh

        2- inside of it, we will run the command > ssh-keygen.exe

            This command will generate us a ssh key!!
            If we choose to add a psswd, this will require us to enter it every time we wanna connect to GitHub, thus it ain't really cruical to add it, so we just hit enter and leave the psswd blank!

        3- To get the key, we "cat" the file id_rsa.pub and copy the generated key!

        4- On Github, we head to -> Settings > SSH & GPS keys > Add new SSH key.

            



