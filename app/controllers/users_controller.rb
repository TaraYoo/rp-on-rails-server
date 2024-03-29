# frozen_string_literal: true

class UsersController < ProtectedController
  skip_before_action :authenticate, only: %i[signup signin]

  # POST '/sign-up'
  def signup
    user = User.create(user_creds)
    if user.valid?
      render json: user, status: :created

      @example_locations = user.locations.build(
        name: 'Example: Baji\'s Hollow',
        plot: 'Example: Defeat a dwarf cult',
        visited: 'No (have players been here?)',
        has_players: 'No (are players here now?)'
      )

      @example_locations.save

      @example_bokbulboks = user.bokbulboks.build(
        description: 'Example: Get the deck of many things',
        used: false
      )

      @example_bokbulboks.save
    else
      render json: user.errors, status: :bad_request
    end
  end

  # POST '/sign-in'
  def signin
    creds = user_creds
    if (user = User.authenticate creds[:email],
                                 creds[:password])
      render json: user, serializer: UserLoginSerializer, root: 'user'
    else
      head :unauthorized
    end
  end

  # DELETE '/sign-out'
  def signout
    current_user.logout
    head :no_content
  end

  # PATCH '/change-password/:id'
  def changepw
    # if the the old password authenticates,
    # the new one is not blank,
    # and the model saves
    # then 204
    # else 400
    if current_user.authenticate(pw_creds[:old]) &&
       !(current_user.password = pw_creds[:new]).blank? &&
       current_user.save
      head :no_content
    else
      head :bad_request
    end
  end

  def demosignout
    current_user.locations.destroy_all
    current_user.bokbulboks.destroy_all

    head :no_content
  end

  def demosignin

    @demo_example_location = current_user.locations.build(
      name: 'Example: Baji\'s Hollow',
      plot: 'Example: Defeat a dwarf cult',
      visited: 'No (have players been here?)',
      has_players: 'No (are players here now?)'
    )
    @demo_example_bokbulbok = current_user.bokbulboks.build(
      description: 'Example: Get the deck of many things',
      used: false
    )

    @demo_example_location.save
    @demo_example_bokbulbok.save

    head :no_content
  end


  private

  def user_creds
    params.require(:credentials)
          .permit(:email, :password, :password_confirmation)
  end

  def pw_creds
    params.require(:passwords)
          .permit(:old, :new)
  end
end
