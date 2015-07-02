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
    
    describe '#content' do
        let(:markdown_service) { double('MarkdownService') }
        
        before do
            MarkdownService.stub(:new) { markdown_service }
        end
        
        it 'should convert its body to markdown' do
            markdown_service.should_receive(:render).with('post body')
            Post.new(body: 'post body').content
        end
    end
end
