module HomeHelper
  def user_job_seeker?
    current_user.rolable_type == 'JobSeeker'
  end

  def user_employer?
    current_user.rolable_type == 'Employer'
  end
end
