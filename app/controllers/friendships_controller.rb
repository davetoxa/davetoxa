class FriendshipsController < ApplicationController
  load_and_authorize_resource only: [:index]

  def index
    @friendships = @friendships.where(approved: true)
    @pendings = Friendship.where(friend: current_user, approved: false)
  end

  def destroy
    @friendship = Friendship.find_by(user: current_user, friend: User.find(params[:id]))
    @friendship.destroy!
    redirect_to :back
  end

  def invite
    if friend
      Friendship.create(user: current_user, friend: friend)
      flash[:notice] = 'Friend request sended'
    end
    redirect_to :back
  end

  def accept
    if friendship
      friendship.accept!
      flash[:notice] = 'Invite accepted'
    end
    redirect_to :back
  end

  def reject
    if friendship
      friendship.destroy
      flash[:notice] = 'Invite rejected'
    end
    redirect_to :back
  end

  private

  def friend
    User.find(params[:id])
  end

  def friendship
    Friendship.find_by(user: current_user, friend: friend) || Friendship.find_by(friend: current_user, user: friend)
  end
end
