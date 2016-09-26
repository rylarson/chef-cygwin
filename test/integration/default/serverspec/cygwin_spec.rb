require 'spec_helper'

describe file('C:\cygwin\bin\bash.exe') do
  it { should exist }
  it { should be_file }
end
