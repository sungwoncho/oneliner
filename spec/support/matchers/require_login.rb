RSpec::Matchers.define :require_login do |expected|
  match do |actual|
    expect(actual.status).to eq 401
  end

  failure_message do |actual|
    "expected to require login to access the method"
  end

  failure_message_when_negated do |actual|
    "expected not to require login to access the method"
  end

  description do
    "redirect to the login page"
  end
end
