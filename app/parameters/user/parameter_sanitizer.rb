class User::ParameterSanitizer < Devise::ParameterSanitizer	  
	def initialize(*)
		super
        # 新規登録時のパラメーター
		permit(:sign_up, keys: [:name])   
        # ユーザー情報アップデート時のパラメーター
        permit(:account_update, keys: [:name])
        permit(:invite, keys: [:name])
        permit(:accept_invitation, keys: [:password, :password_confirmation, :invitation_token, :username])
	end
end
# {:college_ids => []}
# user_colleges: [college_ids:[]] 
# colleges: []
# 参考に
# permit(:sign_up, keys: [:clubname, :clubtype, :text, :population, :profile_img , {:college_ids => []} ])   