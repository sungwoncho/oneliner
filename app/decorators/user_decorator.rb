class UserDecorator < Draper::Decorator
  delegate_all
  include Draper::LazyHelpers

  def post_count
    authored_onelines.count
  end

end
