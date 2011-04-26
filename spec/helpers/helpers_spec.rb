require File.expand_path('../spec_helper', File.dirname(__FILE__))
include Kaminari::Helpers

describe 'Kaminari::Helpers::Paginator' do
  let :template do
    stub(r = Object.new) do
      render.with_any_args
      params { {} }
      options { {} }
      url_for {|h| "/foo?page=#{h[:page]}"}
    end
    r
  end

  describe '#params' do
    before do
      @paginator = Paginator.new(template, :params => {:controller => 'foo', :action => 'bar'})
    end
    subject { @paginator.page_tag(template).instance_variable_get('@params') }
    it { should == {:controller => 'foo', :action => 'bar'} }
  end

  describe '#param_name' do
    before do
      @paginator = Paginator.new(template, :param_name => :pagina)
    end
    subject { @paginator.page_tag(template).instance_variable_get('@param_name') }
    it { should == :pagina }
  end
end
