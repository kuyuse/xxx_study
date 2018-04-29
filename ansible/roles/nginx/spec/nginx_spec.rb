require 'spec_helper'

# インストールされていることを確認
describe package('nginx') do
  it { should be_installed }
end

# 起動していることを確認
describe service('nginx') do
  it { should be_enabled   }
  it { should be_running   }
end
