# require 'rails_helper'

# RSpec.describe 'Posts', type: :request do
#   describe 'ROOT /index' do
#     before(:example) { get '/users' }

#     it 'should return success' do
#       expect(response).to have_http_status(:ok)
#     end

#     it 'should return a 200 response status code' do
#       expect(response).to have_http_status 200
#     end

#     it 'should render index template' do
#       expect(response).to render_template('index')
#     end

#     it 'include the correct text' do
#       expect(response.body).to include('All users')
#     end
#     it 'returns http success' do
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe 'ROOT /show' do
#     before(:example) { get '/users/:user_id' }
#     it 'the request is a success' do
#       expect(response).to have_http_status(:ok)
#     end

#     it 'renders the right template' do
#       expect(response).to render_template('show')
#     end

#     it 'include the correct text' do
#       expect(response.body).to include('User show')
#     end

#     it 'returns http success' do
#       expect(response).to have_http_status(:success)
#     end
#   end
# end
