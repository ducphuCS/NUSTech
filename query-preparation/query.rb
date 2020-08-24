############################### Feeds #########################

# Get public photo whose sharing mode is set public, in reverse chronological order (from newest to oldest)

Photo.where(public: true, user_id: @user.followees).order(created_at: :desc)

# Get public album whose sharing mode is set public, in reverse chronological order (from newest to oldest)

Album.where(public: true, user_id: @user.followees).order(created_at: :desc)

############################# Discover ######################

# Get public photo whose sharing mode is set public, in reverse chronological order (from newest to oldest)

Photo.where(public: true).order(created_at: :desc)

# Get public album whose sharing mode is set public, in reverse chronological order (from newest to oldest)

Album.where(public: true).order(created_at: :desc)

########################## Public Profile  ####################

# Tab Photos: All public photos of the visited user will be displayed

Photo.where(public: true, user_id: @visited_user.id).order(created_at: :desc)

# Tab Albums: ALl public albums of the visited user will be displayed

Album.where(public: true, user_id: @visited_user.id).order(created_at: :desc)

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

# Tab Followers: all followers of current logged-in user will be displayed

User.where(id: @user.followers)

###################### Admin ########################

# Manages Photos: manage all existing photos even when their sharing modes are private

Photo.limit(40)

# Manage Albums:

Album.limit(40)

# Manage Users:

User.pluck(:firstname, :lastname, :email, :last_login)
# or
User.select(:firstname, :lastname, :email, :last_login)
