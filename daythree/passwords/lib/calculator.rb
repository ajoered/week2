class PasswordChecker
  attr_accessor :email, :password
  def initialize(email, password)
     @email = email
     @password = password
  end

  def check_password
   
    @status = ""
    if longer && !up_low_case && namey_domain && chars
      @status = "valid"
    else
      @status = "invalid"
    end
    @status

  end

  def longer
    @password.length > 6
  end

  def up_low_case
    @password.chars.each do |char|
     if char = /[a-zA-Z]/
      true
      else
        false
      end
    end
  end

  def namey_domain 
    array = @email.gsub(/[@]/, ".").split(".")
    namey = array[0]
    domain = array[1]
    if @password.include? namey || domain
      false
    else
      true
    end
  end

  def chars
    alnum = (/[[:alnum:]]/)
    if @password.include? alnum
      true
    else
      false
    end
  end

end

