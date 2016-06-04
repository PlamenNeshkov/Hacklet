RailsAdmin.config do |config|

  config.authenticate_with do
    warden.authenticate! scope: :user
  end

  config.current_user_method(&:current_user)

  config.authorize_with do |controller|
    redirect_to main_app.root_path unless current_user.admin?
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'User' do
    object_label_method do
      :custom_label_method
    end
  end

  config.model 'Item' do
    object_label_method do
      :item_label_method
    end
  end

  def user_label_method
    "#{self.first_name} #{self.last_name}"
  end

  def item_label_method
    "#{self.name}"
  end
end
