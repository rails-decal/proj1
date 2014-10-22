<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Project 1](#project-1)
  - [Instructions](#instructions)
      - [Part 0: Setup PokePortal](#part-0-setup-pokeportal)
      - [Part 1: Create the Pokemon model](#part-1-create-the-pokemon-model)
      - [Part 2: Implement capturing Pokemon](#part-2-implement-capturing-pokemon)
      - [Part 3: View other trainers' Pokemon](#part-3-view-other-trainers-pokemon)
      - [Part 4: Implement the ability to damage other trainers' Pokemon](#part-4-implement-the-ability-to-damage-other-trainers-pokemon)
      - [Part 5: Create your own new Pokemon](#part-5-create-your-own-new-pokemon)
      - [Part 6: EXTRA CREDIT](#part-6-extra-credit)
      - [Part 7: Submit your PokePortal](#part-7-submit-your-pokeportal)
  - [Hints](#hints)
      - [General](#general)
      - [Part 1: Create the Pokemon model](#part-1-create-the-pokemon-model-1)
      - [Part 2: Implement capturing Pokemon](#part-2-implement-capturing-pokemon-1)
      - [Part 3: View other trainers' Pokemon](#part-3-view-other-trainers-pokemon-1)
      - [Part 4: Implement the ability to damage other trainers' Pokemon](#part-4-implement-the-ability-to-damage-other-trainers-pokemon-1)
      - [Part 5: Create your own new Pokemon](#part-5-create-your-own-new-pokemon-1)
      - [Part 6: EXTRA CREDIT](#part-6-extra-credit-1)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Project 1 - PokePortal (an individual project)

For this project, we will have high-level project instructions in the first section of this readme. If you find yourself confused about how to implement a specific step, there are more detailed instructions/hints in the second section of the readme that you can reference, however try to tackle each step yourselves first before referencing the hints. 

Please make sure you consistently keep your repo up to date by running ```git pull origin master```. If you're having bundle install issues, please refer to Piazza for help. You can try ```bundle install --without production``` if it's a pg gem issue.

**Note:** The skeleton project we have created for you already implements sign up and sign in. Though this course will not cover the details of sign up and sign in, we know many of you will want to have sign up and sign in for your final projects, so here is the [link to a really simple and quick way to setup an entire Rails app with user authentication (and frontend framework) already implemented](https://github.com/RailsApps/rails-devise#generate). This is what we used to create the foundation of this project!

Throughout this project you will be creating a PokePortal, a mysterious realm where you will be able to:

* Capture Pokemon
* View your Pokemon
* View other trainers' Pokemon
* Damage and destroy other trainers' Pokemon
* Create your own new Pokemon

**Important: Throughout this project you will be answering short answer questions in this [Google Form](https://docs.google.com/forms/d/1VhMa7Ml0PdLYEPztMRqoBMsHrJH3O_jiKSJoOKRBYlk/viewform?usp=send_form). If you are going to work on this project over a long period of time though, we encourage you to answer the questions in a separate text file so that your answers are not lost if your browser happens to restart or something, since Google forms doesn't save your answers.**

## Instructions

#### Part 0: Setup PokePortal

Clone the repo (run ```git clone git@github.com:rails-decal/proj1.git```) in your terminal. Cd into the directory, run ```bundle install --without production``` and migrate your database, then start your server. In localhost, you should see an error that says: "uninitialized constant HomeController::Pokemon". This is expected; let's fix it.

In the [Google Form](https://docs.google.com/forms/d/1VhMa7Ml0PdLYEPztMRqoBMsHrJH3O_jiKSJoOKRBYlk/viewform?usp=send_form), answer Question 0.

#### Part 1: Create the Pokemon model

- Run the ```generate``` method you've learned to generate the Pokemon model. The model should have the following attributes
  - name: string
  - level: integer
  - trainer_id: integer
- After you've generated the model, migrate it into the database.
- Edit your Pokemon.rb and Trainer.rb file so that a Pokemon belongs to a Trainer and a Trainer can have many Pokemon.
- Create a controller for your Pokemon model. This should be an empty controller for now, just make the file.
- Create some starter Pokemon in the PokePortal with the seed file we've provided.

Go to localhost - you should be able to see the home page and sign up now. Once you've logged in and go back to the home page, some wild Pokemon should appear with every refresh, however you can't capture them!

In the [Google Form](https://docs.google.com/forms/d/1VhMa7Ml0PdLYEPztMRqoBMsHrJH3O_jiKSJoOKRBYlk/viewform?usp=send_form), answer Question 1.

#### Part 2: Implement capturing Pokemon

- In ```views/home/index.html.erb```, replace the div button with the following code: ```<%= button_to "Throw a Pokeball!", capture_path(id: @pokemon), :class => "button medium", :method => :patch %>```
- In your Pokemon controller, add a function called ```capture```. This function should:
  - Grab the id of the Pokemon from the parameters and set that Pokemon's trainer to be the current trainer logged in.
    - What's great about Devise (the user authentication gem we already have set up) is that it predefines a method to give us the current user logged in - or in this case, current trainer. To grab the current trainer, use ```current_trainer```. You can use this in controllers and views.
  - Don't forget to save the changes to the Pokemon!!!
  - Redirect to the home page
- Create a new route in your routes file that will call the function you just wrote. Name the path ```capture``` as its prefix. Set the URI pattern to be "capture".

On your localhost, you should now be able to capture Pokemon! Double check in your console that a captured Pokemon now belongs to you.

In the [Google Form](https://docs.google.com/forms/d/1VhMa7Ml0PdLYEPztMRqoBMsHrJH3O_jiKSJoOKRBYlk/viewform?usp=send_form), answer Question 2.

#### Part 3: View other trainers' Pokemon

- Figure out where in the app you can see a trainer's profile. In that view, add a list of the trainer's Pokemon. Each Pokemon should show its name and level.

On your localhost, you should now be able to view all your Pokemon in your profile!

In the [Google Form](https://docs.google.com/forms/d/1VhMa7Ml0PdLYEPztMRqoBMsHrJH3O_jiKSJoOKRBYlk/viewform?usp=send_form), answer Question 3.

#### Part 4: Implement the ability to damage other trainers' Pokemon

- Make the Pokemon model have a health column as well.
  - Go into your ```db/seeds.rb``` file and make all seed Pokemon start out with 100 health.
  - After you've changed the seeds, run ```rake db:reset```. This command drops your database, creates a new one, runs all migrations, and seeds the database. Now you should have seeded Pokemon with health as well.
  - Show health for each Pokemon in the list on a Trainer's profile.
- Based on Part 2, you should be able to mimic the capture method to implement a damage method.
  - Each damage should subtract 10 health from the Pokemon.
  - You should redirect back to the trainer's profile page at the end of the damage method. Hint: run ```rake routes``` to see what path you need.
  - There should be a button that says "Damage!" next to each Pokemon in the list of Pokemon on each trainer's page. You can follow the same syntax you used for the button in part 2 to implement this button, except changing two things.
- If a Pokemon reaches <= 0 health after being damaged, destroy it. It should no longer exist in the database. It is dead.

On your profile page, try damaging your own Pokemon. Try destroying one.

In the [Google Form](https://docs.google.com/forms/d/1VhMa7Ml0PdLYEPztMRqoBMsHrJH3O_jiKSJoOKRBYlk/viewform?usp=send_form), answer Question 4.

#### Part 5: Create your own new Pokemon

Now that it's so easy to destroy Pokemon, we need a way to create new Pokemon.

In this part, we will allow the current trainer logged in to create his or her own Pokemon that will automatically belong to himself/herself.

- Create a folder ```pokemons``` in ```views```. Make a new file in that folder called ```new.html.erb```.
  - Use simple_form to make a form for creating a new Pokemon. You should refer to the [documentation on simple_form](https://github.com/plataformatec/simple_form#usage). The only field in your form should be the Pokemon's name.
  - Create the necessary methods in the Pokemons controller that are needed to show the form and to handle the form's data after submit.
    - Since we only had the Pokemon's name in the form, we want to set every other attribute to a default. Default health to 100 and level to 1.
    - Set the new Pokemon's trainer to the current logged-in trainer.
    - Redirect to the current logged-in trainer's profile.
  - Route the methods accordingly.
- Create a button that **only shows up in the current logged-in trainer's profile** and links to the form you just created.

Now if you go into your localhost, you should be able to create new Pokemon for yourself. But we want to make sure you can never create Pokemon with the same name, or even worse, no name! What do we need? A validation.

- In the Pokemon model, validate a name is present and that it is also unique.
- In the method that you created to handle the form data in your Pokemons controller, give the following logic at the end:
  - If you successfully save the new Pokemon instance, then redirect to the current logged-in trainer's profile, just like before.
  - Else, redirect to the form and flash the appropriate error.

Now you shouldn't be able to create new Pokemon with no name or a duplicate name.

In the [Google Form](https://docs.google.com/forms/d/1VhMa7Ml0PdLYEPztMRqoBMsHrJH3O_jiKSJoOKRBYlk/viewform?usp=send_form), answer Question 5.

#### Part 6: EXTRA CREDIT

**[+1% of final course grade]** Let friends join PokePortal.
  - Deploy this app on Heroku. Link the Heroku in the Google Form.

**[+1% of final course grade]** Implement Pokemon healing.
  - Increment health by 10.
  - Your Pokemon should now be hidden from other trainers when health is <= 0, instead of being destroyed.
  - You should be able to heal only your **own** Pokemon.

**[+5% of final course grade]** Implement Pokemon battling.
  - Right now, damaging is lame. Your Pokemon, not yourself, should damage other Pokemon. Make it so that when you click damage, you have to select one of your own Pokemon to gain experience from the attack, and level up!
  - You should choose your Pokemon from a dropdown menu.

#### Part 7: Submit your PokePortal

- At github.com, make a new empty repo called proj1.
- Repoint the remote of your local repo to the new repo you just created.
  - In your terminal, run ```git remote set-url origin git://new.url.here``` using the url of your new repo (this can be found in the bottom right of your empty repo on github.com, in the box above **Clone in Desktop**).
- Run ```git add --all```.
- Run ```git commit -m "I am a Pokemon master."```.
- Run ```git push origin master```.

Link your repo in the last question of the [Google Form](https://docs.google.com/forms/d/1VhMa7Ml0PdLYEPztMRqoBMsHrJH3O_jiKSJoOKRBYlk/viewform?usp=send_form), and submit!

Congratulations. You are a Pokemon master.

## Hints

#### General

If you ever have to reset your database (for instance you destroyed all the Pokemon in the PokePortal or you messed up your migrations), run ```rake db:reset``` to drop, recreate, migrate, and reseed your database.

#### Part 1: Create the Pokemon model

Reference [Lecture 6](https://slides.com/railsdecal/week-6-model-relationships) for a recap of how to make a Pokemon belong to a Trainer. To set up the seed Pokemon, use ```rake db:seed```.

#### Part 2: Implement capturing Pokemon

To redirect to a certain page, use ```redirect_to PREFIX_PATH```.

```rake routes``` will be very helpful in debugging. Since we are updating a Pokemon, your route should be a PATCH. If you need to jog your memory on routing, reference how routes were done in [Lecture 4](https://docs.google.com/document/d/1uG8uLIR8cybq4_wQQSVB-6zP3PKTJ2sDmqlK3o7Q_no/edit?usp=sharing)

Also, if you don't know what a URI pattern in a route is, look back at [Lecture 4](https://docs.google.com/document/d/1uG8uLIR8cybq4_wQQSVB-6zP3PKTJ2sDmqlK3o7Q_no/edit?usp=sharing) again.

To learn more about what ```button_to``` actually does, read up on its [documentation here](http://apidock.com/rails/ActionView/Helpers/UrlHelper/button_to) and [maybe this Stack Overflow](http://stackoverflow.com/questions/12475299/ruby-on-rails-button-to-link-to) post as well.

#### Part 3: View other trainers' Pokemon

Refer to the [live coding portion of Lecture 6](http://www.youtube.com/watch?v=h_nCL3nTagw).

#### Part 4: Implement the ability to damage other trainers' Pokemon

For help with the redirect path, refer to [Lab 4](https://docs.google.com/a/berkeley.edu/document/d/1eRJ8uGfZNohrTnSZgrrFF7X3mvcHdztRhDrfKV1jf9E). The helpful section is towards the end.

#### Part 5: Create your own new Pokemon

[Lab 4](https://docs.google.com/a/berkeley.edu/document/d/1eRJ8uGfZNohrTnSZgrrFF7X3mvcHdztRhDrfKV1jf9E) goes over everything you need to know about forms and routing for forms. If you haven't already done it, we strongly recommend doing it before tackling Part 5.

For help with validations, you should read the [Rails documentation on validation](http://guides.rubyonrails.org/active_record_validations.html), specifically the sections for "presence" and "uniqueness". You can also Google and there should be many Stack Overflow posts to help you out.

To flash the appropriate error, use the line ```flash[:error] = @pokemon.errors.full_messages.to_sentence```. This works because in ```views/layouts/application.html.erb```, it is rendering something at the very end. Take a look at that file and see what it is doing. If you don't already know what ```application.html.erb``` does, you should Google it and understand its function. 

#### Part 6: EXTRA CREDIT

For easy deployment, reference [Heroku's deployment docs](https://devcenter.heroku.com/articles/getting-started-with-rails4#). You'll need to look at the *Local Workstation Setup* part and the *Deploy your application to Heroku* part.
