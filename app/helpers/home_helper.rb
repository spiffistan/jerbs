module HomeHelper
  def user_job_seeker?
    current_user.rolable_type == 'JobSeeker'
  end

  def user_employer?
    current_user.rolable_type == 'Employer'
  end

  def job_seeker_signed_in?
    user_signed_in? && user_job_seeker?
  end

  def employer_signed_in?
    user_signed_in? && user_employer?
  end
end
