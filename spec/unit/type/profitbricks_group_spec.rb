require 'spec_helper'

type_class = Puppet::Type.type(:profitbricks_group)

describe type_class do
  let :params do
    [
      :name
    ]
  end

  let :properties do
    [
      :ensure,
      :create_datacenter,
      :create_snapshot,
      :reserve_ip,
      :access_activity_log,
      :members,
      :id
    ]
  end

  it 'should have expected properties' do
    properties.each do |property|
      expect(type_class.properties.map(&:name)).to be_include(property)
    end
  end

  it 'should have expected parameters' do
    params.each do |param|
      expect(type_class.parameters).to be_include(param)
    end
  end

  it 'should require a name' do
    expect {
      type_class.new({})
    }.to raise_error(Puppet::Error, 'Title or name must be provided')
  end

  it 'should support :present as a value to :ensure' do
    type_class.new(:name => 'test', :ensure => :present)
  end

  it 'should support :absent as a value to :ensure' do
    type_class.new(:name => 'test', :ensure => :absent)
  end
end
