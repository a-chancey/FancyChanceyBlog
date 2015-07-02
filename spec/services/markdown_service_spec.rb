require 'spec_helper'

describe MarkdownService do
    it {should be_a MarkdownService}
   
    describe '#render' do 
        let(:content) { "anything" }
       
        let(:markdown_engine) { double('Markdown') }
       
        before do
        # Stub the redcarpet engine because it's a well tested library
        Redcarpet::Markdown.stub(:new) { markdown_engine }
        end
        
        it 'should delegate to the markdown engine' do
           markdown_engine.should_receive(:render).with(content) 
           MarkdownService.new.render(content)
        end
        
    end
end