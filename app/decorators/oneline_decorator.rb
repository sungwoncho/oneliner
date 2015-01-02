class OnelineDecorator < Draper::Decorator
  delegate_all
  include Draper::LazyHelpers

  def authored_date
    model.created_at.strftime("%e %b %Y")
  end

end
