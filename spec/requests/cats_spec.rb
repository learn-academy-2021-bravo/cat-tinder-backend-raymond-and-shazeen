require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "get a list of all the cats" do
      Cat.create name: 'Cat', age: 3, enjoys: 'Likes to eat alot.'

      get '/cats'
     
      cat = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1
    end
    
    describe "POST /create" do
      it "create a cat in the db" do
        cat_params = {
          cat: {
            name: 'Cat',
            age: 3,
            enjoys: 'Likes to eat alot.'
          }
        }

        post '/cats', params: cat_params

        expect(response).to have_http_status(200)

        cat = Cat.first

        expect(cat.name).to eq 'Cat' 
        expect(cat.age).to eq 3
        expect(cat.enjoys).to eq 'Likes to eat alot.'
      end
    end

    describe "PATCH /update" do
      it 'updates a cat' do

        cat_params = {
          cat: {
            name: 'Cat',
            age: 3,
            enjoys: 'eating'
          }
        }
        post '/cats', params: cat_params

        new_cat_params = {
          cat: {
            name: 'Parsely',
            age: 4,
            enjoys: 'eating'
          }
        }

        cat = Cat.first
        patch "/cats/#{cat.id}", params: new_cat_params
        cat = Cat.first
        expect(response).to have_http_status(200)
        expect(cat.name).to eq 'Parsely'
        expect(cat.age).to eq 4
        
      end
    end

    describe "DELETE /destroy" do
      it 'deletes a cat' do
        cat_params = {
          cat: {
            name: 'Felix',
            age: 4,
            enjoys: 'Walks in the park.'
          }
        }
        post '/cats', params: cat_params
        cat = Cat.first
        delete "/cats/#{cat.id}"
        expect(response).to have_http_status(200)
        cats = Cat.all
        expect(cats).to be_empty
      end
    end

    describe "Check meaningful validiation" do 
      it "doesn't create a cat without a name" do
        cat_params = {
          cat:{
            age:2,
            enjoys:"walks in the park"
          }
        }

        post "/cats", params: cat_params

        expect(response.status).to eq 422

        json = JSON.parse(response.body)

        expect(json['name']).to include "can't be blank"

      end
    end

    describe "Check meaningful validiation" do 
      it "doesn't create a cat without a age" do
        cat_params = {
          cat:{
            name:"Cat",
            enjoys:"walks in the park"
          }
        }

        post "/cats", params: cat_params

        expect(response.status).to eq 422

        json = JSON.parse(response.body)

        expect(json['age']).to include "can't be blank"

      end
    end

    describe "Check meaningful validiation" do 
      it "doesn't create a cat without enjoys" do
        cat_params = {
          cat:{
            name:"Cat",
            age: 3
            
          }
        }

        post "/cats", params: cat_params

        expect(response.status).to eq 422

        json = JSON.parse(response.body)

        expect(json['enjoys']).to include "can't be blank"

      end
    end

  end
end
