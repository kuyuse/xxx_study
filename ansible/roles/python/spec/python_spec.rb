require 'spec_helper'

# 指定したバージョンのpythonが解凍されて配置されていること
describe file("#{property['dest_url']}/python-#{property['python.version.xxx']}") do
  it { should be_directory }
  #it { should be_mode '700' }
end


# pipのパッケージがインストールされていること
%w{
  zlib-devel
  openssl-devel
  tk-devel
}.each do |pkg|
  describe package(pkg) do
    it { should be_installed.by('pip') }
  end
end

# リンクの存在確認をする
describe file("/bin/python#{property['python.version.x']}") do
  it { should be_linked_to "/usr/local/bin/#{property['python.version.xx']}" }
end

describe file("/bin/pip#{property['pip.version.x']}") do
  it { should be_linked_to "/usr/local/bin/pip#{property['pip.version.xx']}" }
end

# pythonがインストールされていることを確認
describe command("python3 -V | grep '#{property['python.version.xxx']}'") do
  its(:stdout) { should match /"#{property['python.version.xxx']}"/ }
end

