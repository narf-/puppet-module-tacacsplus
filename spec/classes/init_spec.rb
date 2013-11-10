require 'spec_helper'
describe 'tacacsplus' do

  describe 'class tacacsplus' do

    context 'default options' do
      let :facts do
        { :operatingsystem => 'RedHat' }
      end

      it { should include_class('tacacsplus')}

      it {
        should contain_package('tacacs+').with({
          'ensure' => 'installed',
        })
      }

      it {
        should contain_file('/etc/init.d/tac_plus').with({
          'ensure' => 'present',
          'owner'  => 'root',
          'group'  => 'root',
          'mode'   => '0744',
        })
      }

      it {
        should contain_file('/etc/tac_plus.conf').with({
          'ensure' => 'present',
          'owner'  => 'root',
          'group'  => 'root',
          'mode'   => '0644',
        })
      }

      it {
        should contain_file('/etc/pam.d/tac_plus').with({
          'ensure' => 'present',
          'owner'  => 'root',
          'group'  => 'root',
          'mode'   => '0644',
        })
      }

      it {
        should contain_service('tac_plus').with({
          'ensure'    => 'running',
          'enable'    => 'true',
          'hasstatus' => 'false',
          'pattern'   => 'tac_plus',
        })
      }
    end

    context 'Operatingsystem Debian' do
        let :facts do
            { :operatingsystem => 'Debian' }
        end

        it do 
            expect {
                should include_class('tacacsplus')
            }.to raise_error(Puppet::Error,/Operating system not supported/)
        end
    end
  end
end

