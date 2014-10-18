<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [Project 1](#project-1)
  - [Instructions](#instructions)
      - [Step 1: Create the Pokemon model](#step-1-create-the-pokemon-model)
      - [Step n: Implement the ability to damage other trainers' Pokemon](#step-n-implement-the-ability-to-damage-other-trainers-pokemon)
  - [Hints](#hints)
      - [Step 1: Create the Pokemon model](#step-1-create-the-pokemon-model-1)
      - [Step n: Implement the ability to damage other trainers' Pokemon](#step-n-implement-the-ability-to-damage-other-trainers-pokemon-1)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Project 1

For this project, we will have high-level project instructions in the first section of this readme. If you find yourself confused about how to implement a specific step, there are more detailed instructions/hints in the second section of the readme that you can reference, however try to tackle each step yourselves first before referencing the hints.

**Note:** The skeleton project we have created for you already implements sign up and sign in. Though this course will not cover the details of sign up and sign in, we know many of you will want to have sign up and sign in for your final projects, so here is the [link to a really simple and quick way to setup an entire Rails app with user authentication (and frontend framework) already implemented](https://github.com/RailsApps/rails-devise#generate). All you have to do to set up a base app is follow the instructions in the *Generate* section. This is what we used to create the foundation of this project!

Throughout this project you will be creating a PokePortal, a mysterious realm where you will be able to:

* Capture Pokemon
* View your Pokemon
* View other trainers' Pokemon
* Damage and destroy other trainers' Pokemon

## Instructions

#### Step 1: Create the Pokemon model

Run the `generate` method you've learned to generate the Pokemon model. The model should have the following attributes

* name: string
* level: integer
* trainer_id: integer

After you've generated the model, migrate it into the database. Then, edit your Pokemon.rb and Trainer.rb file so that a Pokemon belongs to a Trainer and a Trainer can have many Pokemon.

#### Step n: Implement the ability to damage other trainers' Pokemon

First, generate a migration that adds a field called `health` of type `integer` to the Pokemon model. Don't forget to migrate. Also, go into your `db/seeds.rb` file and make all seed Pokemon start out with 100 health.

## Hints

#### Step 1: Create the Pokemon model

Reference [Lecture 6](https://slides.com/railsdecal/week-6-model-relationships) for a recap of how to make a Pokemon belong to a Trainer

#### Step n: Implement the ability to damage other trainers' Pokemon

Recall the syntax to add a new field to a model is `rails generate migration AddFieldNameToTableName field_name:datatype`.
