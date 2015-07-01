require 'spec_helper'

describe Post do
    describe 'validations' do
        subject(:post) {Post.new}
        before {post.valid?}
        
        [:title, :body].each do |attribute|
            it 'should validate the presence of a title' do
                expect(post.errors[attribute].size).to be >= 1
                expect(post.errors.messages[attribute]).to include "can't be blank"
            end
        end
    end
end
