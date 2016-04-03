class Admin::AccessController < ApplicationController
  def index
    @preference = Preference.first_or_create(allow_create_artists: true, allow_create_songs: true)
  end

  def update
    @pref = Preference.find(params[:id])
    @pref.update(access_params)
    redirect_to(admin_access_index_path)
  end

  private
    def access_params
      params.require(:preference).permit(:allow_create_artists, :allow_create_songs)
    end
end