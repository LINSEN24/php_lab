<?php

/**
 * Summary of User
 */
class User
{
    /**
     * Summary of id
     * @var
     */
    private $id;
    /**
     * Summary of account
     * @var
     */
    private $account;//账号
    /**
     * Summary of password
     * @var
     */
    private $password;//密码
    /**
     * Summary of realName
     * @var
     */
    private $username;//用户姓名
    /**
     * Summary of phone
     * @var
     */
    private $phone;//手机号码
    /**
     * Summary of role
     * @var
     */
    private $role;//用户类型 0管理员 1老师 2学生

    /**
     * Summary of __construct
     */
    public function __construct(){}
    

    /**
     * Summary of __toString
     * @return string
     */
    public function __toString(){
        return "{".
            $this->id.",".
            $this->account.",".
            $this->password.",".
            $this->username.",".
            $this->phone.",".
            $this->role
            ."}";
    }

	/**
	 * @return mixed
	 */
	public function getId() {
		return $this->id;
	}
	
	/**
	 * @param mixed $id 
	 * @return self
	 */
	public function setId($id): self {
		$this->id = $id;
		return $this;
	}

	/**
	 * @return mixed
	 */
	public function getAccount() {
		return $this->account;
	}
	
	/**
	 * @param mixed $account 
	 * @return self
	 */
	public function setAccount($account): self {
		$this->account = $account;
		return $this;
	}

	/**
	 * @return mixed
	 */
	public function getPassword() {
		return $this->password;
	}
	
	/**
	 * @param mixed $password 
	 * @return self
	 */
	public function setPassword($password): self {
		$this->password = $password;
		return $this;
	}

	/**
	 * @return mixed
	 */
	public function getUsername() {
		return $this->username;
	}
	
	/**
	 * @param mixed $username 
	 * @return self
	 */
	public function setUsername($username): self {
		$this->username = $username;
		return $this;
	}

	/**
	 * @return mixed
	 */
	public function getPhone() {
		return $this->phone;
	}
	
	/**
	 * @param mixed $phone 
	 * @return self
	 */
	public function setPhone($phone): self {
		$this->phone = $phone;
		return $this;
	}

	/**
	 * Summary of role
	 * @return 
	 */
	public function getRole() {
		return $this->role;
	}
	
	/**
	 * Summary of role
	 * @param  $role Summary of role
	 * @return self
	 */
	public function setRole($role): self {
		$this->role = $role;
		return $this;
	}
}

?>