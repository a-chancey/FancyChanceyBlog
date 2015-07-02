require 'spec_helper'

feature 'Managing blog posts' do
    
    scenario 'Guests cannot create posts' do
        visit root_path
        expect(page).to_not have_link 'New Post'
    end
    
    context 'as an admin user' do
        background do
            email = 'admin@example.com'
            password = 'password'
            @admin = AdminUser.create(email: email, password: password)
         
            log_in_admin_user
        end
  
        def log_in_admin_user(email = 'admin@example.com', password = 'password')
            reset_session!
            visit admin_root_path
            fill_in 'Email', with: email
            fill_in 'Password', with: password
            click_button 'Login'
        end
        
        scenario 'Posting a new blog' do
            click_link 'Posts'
            click_link 'New Post'
        
            fill_in 'post_title', with: 'New Blog Post'
            fill_in 'post_body', with: 'This post was made from the admin interface'
            click_button 'Create Post'
        
            expect(page).to have_content 'This post was made from the admin interface'
        end
    
    end
end