############################### Feeds #########################

# Get public photo whose sharing mode is set public, in reverse chronological order (from newest to oldest)

Photo.where(public: true, user_id: @user.followees).order(created_at: :desc)

# Get public album whose sharing mode is set public, in reverse chronological order (from newest to oldest)

Album.where(public: true, user_id: @user.followees).order(created_at: :desc)

# Show number  of likes

@content.likes.size

# whether currrent user liked

@content.likes.pluck(:user_id).include?(@user.id)   #return false or true

# user like

Like.create(content_type: @content_type, content_id: @content, user_id: @user)

############################# Discover ######################

# Get public photo whose sharing mode is set public, in reverse chronological order (from newest to oldest)

Photo.where(public: true).order(created_at: :desc)

# Get public album whose sharing mode is set public, in reverse chronological order (from newest to oldest)

Album.where(public: true).order(created_at: :desc)

# Follow user

@user.followee_ids << @photo.user_id

# Unfollow @followee

@user.followee_ids.delete(@photo.user_id)

########################## Public Profile  ####################

# numebr of Photos

@visited_user.photo_count

# number of Albums

@visited_user.album_count

# number of followees

@visited_user.followees.size

# number of followers

@visited_user.followers.size

# follow visited_user

@user.followees << @visited_user

# unfollow visited_user

@user.followees.delete(@visited_user)

# Tab Photos: All public photos of the visited user will be displayed

Photo.where(public: true, user_id: @visited_user.id).order(created_at: :desc)

# Tab Albums: ALl public albums of the visited user will be displayed

Album.where(public: true, user_id: @visited_user.id).order(created_at: :desc)

# number of photos that album contains

@album.photos.size

# Tab Followings: all followees of visited user will be displayed

User.where(id: @visited_user.followees)

# Tab Followers: all followers of the visited user will be displayed

User.where(id: @visited_user.followers)

####################### My Profile ######################

# Tab Photos

Photo.where(user_id: @user.id).order(created_at: :desc)

#Tab Albums

Album.where(user_id: @user.id).order(created_at: :desc)

# Tab followwings: all followings of current log- in  user will be displayed

User.where(id: @user.followees)

# unfollow

@user.followees.delete(@followees)

# Tab Followers: all followers of current logged-in user will be displayed

User.where(id: @user.followers)

# start followings

@user.followees << @follower

###################### New Photo ########################

#new photo

Photo.create(title: @photo.title, description: @photo.description, public: @photo.sharing_mode, user_id: @user.id)

##################### Update Photo ##########################

# update photo

@photo.update title: @new_title, description: @new_description, public: @new_sharing_mode

# delete photo

Photo.delete(@photo.id)

###################### Edit Profile #########################

# update Profile

@user.update fieldname: @new_value

###################### Admin ########################

# Manages Photos: manage all existing photos even when their sharing modes are private

Photo.limit(40)

# Manage Albums:

Album.limit(40)

# Manage Users:

User.pluck(:firstname, :lastname, :email, :last_login, :active)
# or
User.select(:firstname, :lastname, :email, :last_login, :active)

# delete user

User.delete(@user.id)

# Edit user Profile

@user.update fieldname: @new_value
