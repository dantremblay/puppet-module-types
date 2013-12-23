require 'spec_helper'
describe 'types::file' do

  context 'file with bare minimum specified' do
    let(:title) { '/tmp/file' }
    let(:params) do
      { :ensure => 'present',
      }
    end
    let(:facts) { { :osfamily => 'RedHat' } }

    it {
      should contain_file('/tmp/file').with({
        'ensure' => 'present',
        'name'   => '/tmp/file',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
      })
    }
  end

  context 'file with all options specified' do
    let(:title) { '/tmp/file' }
    let(:params) do
      { :ensure                  => 'present',
        :owner                   => 'root',
        :group                   => 'root',
        :mode                    => '0755',
        :content                 => "This is the content of the file",
        :backup                  => 'main',
        :checksum                => 'md5',
        :force                   => true,
        :links                   => 'manage',
        :provider                => 'posix',
        :recurse                 => false,
        :replace                 => true,
        :selinux_ignore_defaults => false,
        :show_diff               => false,
        :source_permissions      => 'ignore',
      }
    end
    let(:facts) { { :osfamily => 'RedHat' } }

    it {
      should contain_file('/tmp/file').with({
        'ensure'                  => 'present',
        'owner'                   => 'root',
        'group'                   => 'root',
        'mode'                    => '0755',
        'content'                 => "This is the content of the file",
        'backup'                  => 'main',
        'checksum'                => 'md5',
        'force'                   => true,
        'links'                   => 'manage',
        'provider'                => 'posix',
        'recurse'                 => false,
        'replace'                 => true,
        'selinux_ignore_defaults' => false,
        'show_diff'               => false,
        'source_premissions'      => 'ignore',
      })
    }
  end

  context 'file with invalid ensure' do
    let(:title) { 'invalid' }
    let(:params) do
      { :owner      => 'root',
        :group      => 'root',
        :mode       => '0644',
        :ensure     => '!invalid',
      }
    end

    it 'should fail' do
      expect {
        should contain_class('types')
      }.to raise_error(Puppet::Error,/types::file::invalid::ensure is invalid and does not match the regex./)
    end
  end
end
